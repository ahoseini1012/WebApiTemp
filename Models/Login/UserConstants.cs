namespace WebTemplate.Models
{
    // We are not taking data from data base so we get data from constant
    public class UserConstants
    {
        public static List<LoginModel> Users = new()
            {
                    new LoginModel(){ Username="smh",Password="smh_admin",Role="Admin"},
                    new LoginModel(){ Username="smh",Password="smh_user",Role="User"}
            };
    }
}