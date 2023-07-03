namespace WebTemplate.Models
{
    public class UserModel
    {
        public long Id { get; set; }
        public string Username { get; set; } = String.Empty;
        public string Guid { get; set; } = String.Empty;
        public string Password { get; set; } = String.Empty;
        public string FirstName { get; set; } = String.Empty;
        public string LastName { get; set; } = String.Empty;
        public string Email { get; set; } = String.Empty;
        public string MobileNumber { get; set; } = String.Empty;
        public bool IsActive { get; set; } = true;
    }
}