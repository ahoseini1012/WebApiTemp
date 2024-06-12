using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LicenseServer.Utility
{
    public static class CheckTokens
    {
        public static bool checkMainToken(string? Token,IConfiguration configuration,out string checktoken_msg)
        {
            var _main_token= configuration.GetValue<string>("Api_3:Main_token")!;
            if (!string.IsNullOrEmpty(Token))
            {
                if (Token != _main_token)
                {
                    checktoken_msg = "کلید صحیح نیست";
                    return false;
                }
                else
                {
                    checktoken_msg = "OK";
                    return true;
                }
            }
            else
            {
                checktoken_msg = "کلید خالی است";
                return false;
            }
        }
    }
}