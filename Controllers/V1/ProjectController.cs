
using Microsoft.AspNetCore.Mvc;

namespace LicenseServer.Controllers.V1
{
    [ApiVersion("1")]
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/[action]")]
    public class ProjectController : ControllerBase
    {
        private readonly IConfiguration _config;

        public ProjectController(IConfiguration config)
        {
            _config = config;
        }

        
    }

}
