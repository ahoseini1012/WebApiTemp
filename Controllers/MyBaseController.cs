using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebTemplate.Controllers
{

    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/[action]")]
    // [Authorize]
    public class MyBaseController : ControllerBase
    {

    }
}