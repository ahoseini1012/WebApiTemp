using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LicenseServer.Models.DB
{
    public class User
    {
        public int Id { get; set; }
        public string username { get; set; } = string.Empty;
        public string mobile { get; set; } = string.Empty;
        public string email { get; set; } = string.Empty;

    }
}