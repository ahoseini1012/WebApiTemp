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

        public static string readBodyHttpRequest(this HttpRequest request)
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

        // Converts Persian/Arabic digits to Latin digits
        public static string ToLatinDigits(this string input)
        {
            if (string.IsNullOrEmpty(input)) return input;
            var persianDigits = new[] { '\u06F0', '\u06F1', '\u06F2', '\u06F3', '\u06F4', '\u06F5', '\u06F6', '\u06F7', '\u06F8', '\u06F9' };
            var arabicDigits = new[] { '\u0660', '\u0661', '\u0662', '\u0663', '\u0664', '\u0665', '\u0666', '\u0667', '\u0668', '\u0669' };
            for (int i = 0; i < 10; i++)
            {
                input = input.Replace(persianDigits[i], (char)('0' + i));
                input = input.Replace(arabicDigits[i], (char)('0' + i));
            }
            return input;
        }
    }
}