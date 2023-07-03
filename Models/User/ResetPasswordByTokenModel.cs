using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace fetratgram_smh.Models.User
{
    public class ResetPasswordByTokenModel
    {
        public string Email { get; set; }=String.Empty;
        public string Token { get; set; }=String.Empty;
        public string NewPassword { get; set; }=String.Empty;
    }
}