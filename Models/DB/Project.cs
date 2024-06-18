using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LicenseServer.Models.DB
{
    public class Project
    {
        public int? id { get; set; }
        public string? projectName { get; set; }
        public string? address { get; set; }
        public string? website { get; set; }
        public string? ipAddress { get; set; }
        public string? macAddress { get; set; }
        public bool? isActive { get; set; }
        public string? publicKey { get; set; }
        public string? privateKey { get; set; }
        public DateTime? startAt { get; set; }
        public DateTime? endAt { get; set; }
        public int? buldingMaxCount { get; set; }
        public int? UnitMaxCount { get; set; }
        public string? providers_json { get; set; }

    }
}