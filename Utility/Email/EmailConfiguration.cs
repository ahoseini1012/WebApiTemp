using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LicenseServer.Utility.Email
{
    public class EmailConfiguration
    {
        public string From { get; set; } = String.Empty;
        public string SmtpServer { get; set; } = String.Empty;
        public int Port { get; set; }
        public string UserName { get; set; } = String.Empty;
        public string Password { get; set; } = String.Empty;
    }
}