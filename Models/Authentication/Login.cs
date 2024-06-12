using LicenseServer.Models.DB;

namespace LicenseServer.Models.Authentication
{
    public class Login
    {
        public class request
        {
            public string username { get; set; } = string.Empty;
            public string password { get; set; } = string.Empty;
        }

        public class response:User
        {
            public string accesstoken { get; set; } = string.Empty;
            public string refreshtoken { get; set; } = string.Empty;
        }
    }
}