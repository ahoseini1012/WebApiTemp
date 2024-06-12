using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Dapper;
using MailKit.Net.Smtp;
using MimeKit;
using Newtonsoft.Json;
using LicenseServer.DL;
using static System.Net.Mime.MediaTypeNames;
using SmtpClient = System.Net.Mail.SmtpClient;

namespace LicenseServer.ThirdPartyServices
{
    public interface IThirdPartyServices
    {
        public bool SendMail(string username, string code, string subject);
        public bool IsValidEmail(string email);
        public bool IsValidPhoneNumber(string phone);

    }
    public class ThirdPartyServices : IThirdPartyServices
    {
        private readonly DBContext _db;
        private readonly IConfiguration _config;
        private readonly IHttpClientFactory _http;
        public ThirdPartyServices(DBContext dBContext, IConfiguration config, IHttpClientFactory http)
        {
            _config = config;
            _db = dBContext;
            _http = http;
        }

        public bool IsValidEmail(string email)
        {
            string pattern = @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$";
            Regex regex = new Regex(pattern);
            bool isValid = regex.IsMatch(email);
            return isValid;
        }

        public bool IsValidPhoneNumber(string phone)
        {
            string pattern = @"^(09[0-9]{9})*$";
            Regex regex = new Regex(pattern);
            bool isValid = regex.IsMatch(phone);
            return isValid;
        }

        

        public bool SendMail(string username, string code, string subject)
        {
            using var smtpClient = new SmtpClient();
            try
            {
                string _Password = _config.GetValue<string>("FetratEmailConfiguration:Password")!;
                string _From = _config.GetValue<string>("FetratEmailConfiguration:From")!;
                string _FromDisplay = _config.GetValue<string>("FetratEmailConfiguration:FromDisplay")!;
                string _bodyMessage = String.Empty;
                string _Host = _config.GetValue<string>("FetratEmailConfiguration:SmtpServer")!;
                int _Port = _config.GetValue<Int16>("FetratEmailConfiguration:port")!;
                bool _EnableSsl = _config.GetValue<Boolean>("EnableSslfalse:port")!;

                _bodyMessage = "نرم افزار فطرت گرام";
                _bodyMessage += "<br/>" + "لطفا کد زیر را در نرم افزار وارد نمایید";
                _bodyMessage += "<br/>" + code;

                var senderEmail = new MailAddress(_From, _FromDisplay);
                var receiverEmail = new MailAddress(username, username);
                var sub = subject;
                var smtp = new SmtpClient
                {
                    Host = _Host,
                    Port = _Port,
                    EnableSsl = _EnableSsl,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(senderEmail.Address, _Password)

                };
                using (var mess = new MailMessage(senderEmail, receiverEmail)
                {
                    Subject = subject,
                    Body = _bodyMessage,
                    IsBodyHtml = true
                })
                {
                    smtp.Send(mess);
                }
            }
            catch (Exception)
            {
                //log an error message or throw an exception or both.
                throw;
            }
            return true;

        }

        // public async Task<SmsResponseBody> sms_send_patern(string mobile, string message)
        // {
        //     try
        //     {
        //         var requestBody = new SmsRequestBody_pattern
        //         {
        //             username = _config.GetValue<string>("SMSCenter:username")!,
        //             password = _config.GetValue<string>("SMSCenter:password")!,
        //             bodyId = Convert.ToInt32(_config.GetValue<string>("SMSCenter:bodyId")),
        //             text = message,
        //             to = mobile
        //         };


        //         var content = new StringContent(
        //             JsonConvert.SerializeObject(requestBody),
        //             Encoding.UTF8,
        //             Application.Json);
        //         var client = _http.CreateClient();

        //         var apiCallResponse = await client.PostAsync(
        //             // _config.GetValue<string>("SMSCenter:SendSMS"),
        //             _config.GetValue<string>("SMSCenter:BaseServiceNumber"),
        //             content);

        //         if (!apiCallResponse.IsSuccessStatusCode)
        //         {
        //             throw new Exception("ارسال پیامک با خطا مواجه شد");
        //         }
        //         else
        //         {
        //             var responseMessage = await apiCallResponse.Content.ReadAsStringAsync();
        //             var jsonResponse = JsonConvert.DeserializeObject<SmsResponseBody>(responseMessage);
        //             return jsonResponse!;
        //         }
        //     }
        //     catch (System.Exception)
        //     {
        //         throw;
        //     }

        // }

        // public async Task<SmsResponseBody> sms_send(string mobile, string message)
        // {
        //         var requestBody = new SmsRequestBody
        //         {
        //             username = _config.GetValue<string>("SMSCenter:username")!,
        //             password = _config.GetValue<string>("SMSCenter:password")!,
        //             from = _config.GetValue<string>("SMSCenter:from")!,
        //             text = message,
        //             to = mobile,
        //             isFlash = false
        //         };


        //         var content = new StringContent(
        //             JsonConvert.SerializeObject(requestBody),
        //             Encoding.UTF8,
        //             Application.Json);

        //         var client = _http.CreateClient();

        //         var apiCallResponse = await client.PostAsync(
        //             _config.GetValue<string>("SMSCenter:SendSMS"),
        //             content);

        //         if (!apiCallResponse.IsSuccessStatusCode)
        //         {
        //             throw new Exception("ارسال پیامک با خطا مواجه شد");
        //         }
        //         else
        //         {
        //             var responseMessage = await apiCallResponse.Content.ReadAsStringAsync();
        //             var jsonResponse = JsonConvert.DeserializeObject<SmsResponseBody>(responseMessage);
        //             return jsonResponse!;
        //         }
        // }

    }
}