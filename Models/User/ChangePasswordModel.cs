namespace WebTemplate.Models
{
    public class ChangePasswordModel
    {
        public int UserId { get; set; }
        public string Oldpassword { get; set; } = String.Empty;
        public string Newpassword { get; set; }= String.Empty;
    }
}