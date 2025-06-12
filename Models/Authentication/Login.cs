using LicenseServer.Models.DB;

namespace LicenseServer.Models.Authentication
{
    public class LoginByUsername
    {
        public class request
        {
            public string username { get; set; } = string.Empty;
            public string password { get; set; } = string.Empty;
        }

        public class response 
        {
            public string accesstoken { get; set; } = string.Empty;
            public string refreshtoken { get; set; } = string.Empty;
        }
    }

    public class LoginByMobileNo
    {
        public class Request
        {
            public string Mobile { get; set; } = string.Empty;
        }

        public class Response 
        {
            public string Accesstoken { get; set; } = string.Empty;
            public string Refreshtoken { get; set; } = string.Empty;
        }
    }
}