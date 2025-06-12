using API.Models.Authentication;
using LicenseServer.DL.Authentication;
using LicenseServer.Models.Authentication;
using LicenseServer.Utilities;
using WebTemplate.Models.DB;
using static WebTemplate.Utility.ExceptionHandling;


namespace LicenseServer.BL.Authentication
{
    public interface IAuthentication_BL
    {
        Task<int> LoginBySMS(LoginBySMS.Req model);

        // Task<string> LoginBySMS(LoginBySMS.Req model);
        Task<int> UserRegister(User user);
    }

    public class Authentication_BL : IAuthentication_BL
    {
        private readonly IAuthentication_DL _dl;
        private readonly IGenerateNewToken _getAccessToken;
        private readonly Serilog.ILogger _logger;
        private readonly IConfiguration _config;

        public Authentication_BL(IAuthentication_DL authentication_dl, IGenerateNewToken generateNewToken,
         Serilog.ILogger logger, IConfiguration config)
        {
            _dl = authentication_dl;
            _getAccessToken = generateNewToken;
            _logger = logger;
            _config = config;

        }

        public async Task<int> UserRegister(User user)
        {
            int response = -1;
            try
            {
                int userReg = await _dl.InsertNewUser(user);
                //new user created. so sending register form to fill.
                response = 0;
            }
            catch (CustomException ex) when (ex.ErrorCode == ErrorCode.DuplicatedMobileNumber)
            {
                _logger.Information($"{user.MobileNo} is already existed.");
                // the mobile number has registered befor. so sending opt.
                int sendOtp = await SendOTP(user.MobileNo);
                response = 1; 

            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                throw;
            }
            return response;
        }

        public async Task<int> SendOTP(string mobileNo)
        {
            try
            {
                int otp = await _dl.InsertOTP(mobileNo);
                string from = _config["sms0098:from"]!;
                string username = _config["sms0098:username"]!;
                string password = _config["sms0098:password"]!;
                string domain = _config["sms0098:domain"]!;
                string text = @$"کد شما جهت شرکت در مسابقه هیأت خادمین اهل بیت علیهم السلام:{otp}

Code={otp}";
                string url = $"https://www.0098sms.com/sendsmslink.aspx?FROM={from}&TO={mobileNo}&TEXT={text}&USERNAME={username}&PASSWORD={password}&DOMAIN={domain}";

                using (HttpClient client = new HttpClient())
                {
                    HttpResponseMessage response = await client.GetAsync(url);
                    string result = await response.Content.ReadAsStringAsync();
                    _logger.Information($"Mobile:{mobileNo} => {otp}");
                    return 0;
                }
            }
            catch (CustomException ex) when (ex.ErrorCode == ErrorCode.AlreadyGeneratedOTP)
            {
                throw;
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        public async Task<int> LoginBySMS(LoginBySMS.Req model)
        {
            try
            {
                User user = new(model.MobileNo);
                int userReg = await UserRegister(user);
                return userReg;
            }
            catch (System.Exception)
            {

                throw;
            }
            return -1;
        }
    }
}