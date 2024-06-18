
using LicenseServer.BL.Authentication;
using LicenseServer.Models.DB;
using LicenseServer.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace LicenseServer.Controllers.V1
{
    [ApiVersion("1")]
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/[action]")]
    public class ProjectController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly IProject_BL _project;

        public ProjectController(IConfiguration config, IProject_BL project)
        {
            _config = config;
            _project = project;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ApiResult<Project>> GetLicenseDetail(string data)
        {
            var apiResult = new ApiResult<Project>();
            try
            {
                var iPAddress = HttpContext.Connection.RemoteIpAddress;
                apiResult.Result = await _project.GetProjectDetail(data, iPAddress!.ToString());
                apiResult.Status = 200;
                apiResult.Message = "عملیات موفق";
                return apiResult;
            }
            catch (System.Exception ex)
            {
                apiResult.Status = 500;
                apiResult.Message = ex.Message;
                return apiResult;
            }
        }
    }

}
