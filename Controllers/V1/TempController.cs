
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebTemplate.Controllers.v1
{
    [ApiVersion("1")]
    [ApiController,Authorize]
    public class TempController : MyBaseController
    {
        [HttpGet]
        public IActionResult GetName(int id)
        {
            return Ok();
        }

        [HttpGet]
        public IActionResult GetFamily(int fid)
        {
            return Ok();
        }
    }
}
