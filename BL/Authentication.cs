using LicenseServer.DL.Authentication;
using LicenseServer.Models.Authentication;
using LicenseServer.Utilities;


namespace LicenseServer.BL.Authentication
{
    public interface IAuthentication_BL
    {
        Task<Login.response> login(Login.request request);
    }

    public class Authentication_BL:IAuthentication_BL
    {
        private readonly IAuthentication_DL _authentication;
        private readonly IGenerateNewToken _getAccessToken;

        public Authentication_BL(IAuthentication_DL authentication_dl, IGenerateNewToken generateNewToken)
        {
            _authentication = authentication_dl;
            _getAccessToken = generateNewToken;
        }

        public async Task<Login.response> login(Login.request request)
        {
            var result = new Login.response();
            // get login information
            var data = await _authentication.Login(request);
            
            if (data.Result != null)
            {
                // login succeed => get accessToken
                result.accesstoken = _getAccessToken.NewToken(data.Result.Id).accesstoken;
                result.refreshtoken = _getAccessToken.NewToken(data.Result.Id).refreshtoken;
                result.email = data.Result.email;
                result.mobile = data.Result.mobile;
                result.username = data.Result.username;
                result.Id = data.Result.Id;
            }
            else
            {
                // login failed
            }
            return result;
        }
    }
}