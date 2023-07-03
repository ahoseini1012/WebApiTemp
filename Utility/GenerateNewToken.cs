using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace WebTemplate.Utilities
{
    public interface IGenerateNewToken
    {
        public string NewToken(string guid);
    }
    public class GenerateNewToken :IGenerateNewToken
    {
        private readonly IConfiguration _config;
        // private readonly Guid _userid;
        public GenerateNewToken(IConfiguration configuration)
        {
            _config=configuration;
            // _userid=id;
        }
       public string NewToken(string _userid)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes(_config["Jwt:Key"]);
            var tokenTimeout = Convert.ToDouble(_config["Jwt:TokenTimeout"]);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                        new Claim("userid", _userid.ToString()) 
                }),

                Expires = DateTime.UtcNow.AddMinutes(tokenTimeout),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}