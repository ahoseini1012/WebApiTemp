using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using LicenseServer.Models.Authentication;
using Microsoft.IdentityModel.Tokens;

namespace LicenseServer.Utilities
{
    public interface IGenerateNewToken
    {
        public LoginByUsername.response NewToken(int guid);
    }
    public class GenerateNewToken : IGenerateNewToken
    {
        private readonly IConfiguration _config;
        // private readonly Guid _userid;
        public GenerateNewToken(IConfiguration configuration)
        {
            _config = configuration;
            // _userid=id;
        }
        public LoginByUsername.response NewToken(int _userid)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes(_config["Jwt:Key"]!);
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
            return new LoginByUsername.response()
            {
                accesstoken = tokenHandler.WriteToken(token),
                refreshtoken = GenerateRefreshToken()
            };
        }

        private static string GenerateRefreshToken()
        {
            var randomNumber = new byte[64];
            using var rng = RandomNumberGenerator.Create();
            rng.GetBytes(randomNumber);
            return Convert.ToBase64String(randomNumber);
        }
    }
}