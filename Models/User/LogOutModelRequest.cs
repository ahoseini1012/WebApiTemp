using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace fetratgram_smh.Models.User
{
    public class LogOutModelRequest
    {
        public long UserId { get; set; }
        public string RefreshToken { get; set; }=String.Empty;
    }
}