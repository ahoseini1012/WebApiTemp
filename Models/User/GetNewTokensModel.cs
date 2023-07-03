namespace WebTemplate.Models
{
    public class GetNewTokensModel
    {
        public string OldRefreshToken { get; set; }=String.Empty;
        public long UserId { get; set; }
    }

}