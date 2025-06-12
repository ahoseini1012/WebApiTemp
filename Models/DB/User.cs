using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebTemplate.Models.DB
{
    public class User_
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string Mobile { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
    }

    public class User
    {
        public User(string mobileno)
        {
            MobileNo = mobileno;
        }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public string MobileNo { get; set; }
        public string Email { get; set; }
    }
}