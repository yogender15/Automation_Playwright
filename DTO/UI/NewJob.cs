using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POMSeleniumFrameworkPoc1.DTO
{
    public class NewJob
    {
        public string JobId { get; set; }
        public string RequestId { get; set; }
        public string BillingAuthority { get; set; }
        public string CreatedOnDateTime { get; set; }
        public string EstateFileName { get; set; }
        public string EstateActionType { get; set; }
        public string HouseTypeName { get; set; }
        public Dictionary<string, string> testData { get; set; }
    }
}
