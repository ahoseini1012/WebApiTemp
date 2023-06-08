namespace WebTemplate.Models
{
    // We are not taking data from data base so we get data from constant
    public class UserConstants
    {
        public static List<UserModel> Users = new()
            {
                    new UserModel(){ Username="smh",Password="smh_admin",Role="Admin"},
                    new UserModel(){ Username="smh",Password="smh_user",Role="User"}
            };
    }
}