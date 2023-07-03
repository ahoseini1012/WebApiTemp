using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace fetratgram_smh.Models.User
{
    public class UpdaeUserModel
    {
        public string Email { get; set; }=String.Empty;
        public string FirstName { get; set; }=String.Empty;
        public string LastName { get; set; }=String.Empty;
        public string MobileNumber { get; set; }=String.Empty;
    }
}