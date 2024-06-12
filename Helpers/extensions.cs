using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LicenseServer.ThirdPartyServices
{
    public static class Extensions
    {
        public static string Kafya(this string str)
        {
            if (!string.IsNullOrEmpty(str))
            {
                return str.Replace("ي", "ی")
                            .Replace("ك", "ک");
            }
            else
            {
                return "";
            }

        }

        public static string readBodyHttpRequest(this HttpRequest request )
        {
            if (!request.Body.CanSeek)
            {
                request.EnableBuffering();
            }
            request.Body.Position = 0;
            var reader = new StreamReader(request.Body, Encoding.UTF8);
            var body = reader.ReadToEnd();
            request.Body.Position = 0;
            return body;
        }

        public static string ToPersian(this DateTime dt)
        {
            PersianCalendar pc = new PersianCalendar();
            int year = pc.GetYear(dt);
            int month = pc.GetMonth(dt);
            int day = pc.GetDayOfMonth(dt);
            int hour = pc.GetHour(dt);
            int minute = pc.GetMinute(dt);
            int second = pc.GetSecond(dt);

            try
            {
                DateTime PersianDateTime = new DateTime(year, month, day, hour, minute, second);
                return year.ToString("0000") + "/" + month.ToString("00") + "/" + day.ToString("00") + " " + hour.ToString() + ":" + minute.ToString();
            }
            catch
            {
                return "";
            }

        }
    }
}