using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models.Authentication
{
    public class LoginBySMS
    {
        public class Req
        {
            public string MobileNo { get; set; } = String.Empty;
        }
    }
}