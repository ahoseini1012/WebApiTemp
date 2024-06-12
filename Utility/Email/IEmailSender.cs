using LicenseServer.Utility.Email;
using MailKit.Net.Smtp;
using MimeKit;

namespace LicenseServer.Utility
{
    public interface IEmailSender
    {
        public void SendEmail(MimeMessage message);
        public MimeMessage CreateEmailMessage(string emailAddress, string bodyMessage);
    }

    public class EmailSender : IEmailSender
    {
        private readonly EmailConfiguration _emailConfig;
        public EmailSender(EmailConfiguration emailConfig)
        {
            _emailConfig = emailConfig;
        }

        public MimeMessage CreateEmailMessage(string emailAddress, string bodyMessage)
        {
            var emailMessage = new MimeMessage();
            emailMessage.From.Add(MailboxAddress.Parse(_emailConfig.From));
            emailMessage.To.Add(MailboxAddress.Parse(emailAddress));
            emailMessage.Subject = "Subject";
            emailMessage.Body = new TextPart(MimeKit.Text.TextFormat.Text) { Text = bodyMessage };
            return emailMessage;
        }

        public void SendEmail(MimeMessage mailMessage)
        {

            using var smtpClient = new SmtpClient();
            try
            {
                smtpClient.Connect(_emailConfig.SmtpServer, _emailConfig.Port, true);
                smtpClient.Authenticate(_emailConfig.UserName, _emailConfig.Password);
                var res = smtpClient.Send(mailMessage);
            }
            catch
            {
                //log an error message or throw an exception or both.
                throw;
            }
            finally
            {
                smtpClient.Disconnect(true);
                smtpClient.Dispose();
            }
        }
    }
}