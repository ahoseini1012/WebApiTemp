using Microsoft.AspNetCore.Mvc;
using MihaZupan;

namespace WebTemplate.Controllers.V1
{
    [ApiVersion("1")]
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/[action]")]
    public class HomeController : ControllerBase
    {
        private readonly IConfiguration _config;

        public HomeController(IConfiguration config)
        {
            _config = config;
        }

        [HttpGet]
        public async Task testIp()
        {
            var proxy = new HttpToSocks5Proxy("127.0.0.1", 8888);

            var handler = new HttpClientHandler
            {
                Proxy = proxy,
                UseProxy = true
            };

            using var client = new HttpClient(handler);
            var response = await client.GetAsync("https://api.ipify.org");
            var ip = await response.Content.ReadAsStringAsync();
            System.Console.WriteLine(ip);
        }
    }

}
