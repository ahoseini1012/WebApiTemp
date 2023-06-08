using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebTemplate.Models;

namespace WebTemplate.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        //For admin Only
        [HttpGet]
        [Route("Admins")]
        [Authorize(Roles = "Admin")]        
        public IActionResult? AdminEndPoint()
        {
            var currentUser = GetCurrentUser();

            if(currentUser != null)
                return Ok($"Hi you are an {currentUser.Role}");
            else
            return null;
        }

        private UserModel? GetCurrentUser()
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                var userClaims = identity.Claims;
                return new UserModel
                {
                    Username = userClaims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value!,
                    Role = userClaims.FirstOrDefault(x => x.Type == ClaimTypes.Role)?.Value!
                };
            }
            return null;
        }
    }
}