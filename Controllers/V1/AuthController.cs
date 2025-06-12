using API.Models.Authentication;
using LicenseServer.BL.Authentication;
using LicenseServer.Models.Authentication;
using WebTemplate.Models.DB;
using LicenseServer.Utilities;
using Microsoft.AspNetCore.Mvc;
using LicenseServer.Models;
using LicenseServer.ThirdPartyServices;

namespace LicenseServer.Controllers.V1
{
    [ApiVersion("1")]
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/[action]")]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly IAuthentication_BL _bl;
        private readonly Serilog.ILogger _logger;

        public AuthController(IConfiguration config, IAuthentication_BL authentication, Serilog.ILogger logger)
        {
            _config = config;
            _bl = authentication;
            _logger = logger;
        }

        [HttpPost]
        public async Task<ApiResult<string>> UserRegister(User user)
        {
            // Convert Persian/Arabic digits to Latin before validation
            user.MobileNo = user.MobileNo.ToLatinDigits();
            var response = new ApiResult<string>();
            try
            {
                int userReg = await _bl.UserRegister(user);
                response.Message = "عملیات با موفقیت انجام شد";
                response.Result = "OK";
                response.Status = 200;
            }
            catch (Exception ex)
            {
                response.Message = $"{ex.Message}";
                response.Result = "NOK";
                response.Status = 200;
            }
            return response;
        }

        [HttpPost]
        public async Task<ApiResult<string>> LoginBySMS(LoginBySMS.Req model)
        {
            var response = new ApiResult<string>();
            // Convert Persian/Arabic digits to Latin before validation
            model.MobileNo = model.MobileNo.ToLatinDigits();
            if (model.MobileNo.Length != 11)
            {
                response.Message = "شماره موبایل نامعتبر است";
                response.Result = "nok";
                response.Status = (int)MyStatusCode.Invalid_MobileNo;
            }
            try
            {

                int result = await _bl.LoginBySMS(model);
                if (result == 0)
                {
                    //new user created. so sending register form to fill.
                    _logger.Information($"{model.MobileNo} has been registered");
                    response.Message = "fill register form";
                    response.Result = "ok";
                    response.Status = (int)MyStatusCode.FillForm;
                }
                else
                {
                    // the mobile number has registered befor. so sending opt.
                    _logger.Information($"{model.MobileNo} has been logged in");
                    response.Message = "logged in.OTP sent";
                    response.Result = "ok";
                    response.Status = (int)MyStatusCode.Sending_otp;
                }
            }
            catch (System.Exception ex)
            {
                response.Message = $"unexpected error : {ex.Message}";
                response.Result = "nok";
                response.Status = (int)MyStatusCode.UnKnown_error;
            }
            return response;
        }



    }

}
