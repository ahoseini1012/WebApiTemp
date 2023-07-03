namespace WebTemplate.Models
{
    public class LoginModelRequest
    {
        public string Email { get; set; }=String.Empty;
        public string Password { get; set; }=String.Empty;
    }
    public class LoginModelResponse
    {
        public string AccessToken { get; set; } = String.Empty;
        public string RefereshToken { get; set; } = String.Empty;
        public long UserId { get; set; }
    }
}