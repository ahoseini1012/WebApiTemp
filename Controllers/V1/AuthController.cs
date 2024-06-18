
using LicenseServer.BL.Authentication;
using LicenseServer.Models.Authentication;
using Microsoft.AspNetCore.Mvc;

namespace LicenseServer.Controllers.V1
{
    [ApiVersion("1")]
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/[action]")]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly IAuthentication_BL _auth;

        public AuthController(IConfiguration config, IAuthentication_BL authentication)
        {
            _config = config;
            _auth = authentication;
        }

        [HttpPost]
        public async Task<Login.response> Login(Login.request model)
        {
            var authResult = await _auth.login(model);
            return authResult;
        }



    }

}
