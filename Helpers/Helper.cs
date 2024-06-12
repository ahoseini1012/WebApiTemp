using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace LicenseServer.Helpers
{
    public static class Helpers
    {
        public static string createURLAddress(string text_)
        {

            if (text_ != null)
            {
                string t = text_.Trim();

                t = t.Replace('!', ' ')
                    .Replace('.', ' ')
                    .Replace(',', ' ')
                    .Replace(':', ' ')
                    .Replace('?', ' ')
                    .Replace('؟', ' ')
                    .Replace('،', ' ')
                    .Replace('؛', ' ')
                    .Replace('+', ' ')
                    .Replace('–', ' ')
                    .Replace('«', ' ')
                    .Replace('»', ' ')
                    .Replace('(', ' ')
                    .Replace(')', ' ')
                    .Replace('/', ' ')
                    .Replace(" ع ", " ")
                    .Replace(" ص ", " ")
                    .Replace(" س ", " ")
                    .Replace(" ره ", " ")
                    .Replace(" عج ", " ")
                    .Replace("\\", "")
                    .Replace("\"", "")
                    .Replace('"', ' ')
                    .Replace('_', ' ')
                    .Replace('-', ' ')
                    .Replace("  ", " ")
                    .Replace("'", " ")
                    .Replace("#", " ")
                    .Trim()
                    .Replace(' ', '-')
                    .Replace("--", "-");


                if (t.Length > 500)
                {
                    t = text_.Trim().Substring(0, 500);

                }

                return t;
            }
            return "";
        }

        // public static bool IsValidPhone(string Phone)
        // {
        //     if (!string.IsNullOrEmpty(Phone))
        //     {
        //         try
        //         {
        //             return Regex.IsMatch(Phone, "^(09[0-9]{9})*$", RegexOptions.IgnoreCase);
        //         }
        //         catch
        //         {
        //             return false;
        //         }
        //     }
        //     else
        //     {
        //         return false;
        //     }
        // }
    }
}