using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace fetratgram_smh.Models.User
{
    public class RefreshTokenModel
    {
        public long UserId { get; set; }
        public string RefreshToken { get; set; } = String.Empty;
        public string AccessTokenToken { get; set; } = String.Empty;
        public DateTime CreatedAt { get; set; }
        public bool IsValid { get; set; }
    }
}