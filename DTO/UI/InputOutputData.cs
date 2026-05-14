using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POMSeleniumFrameworkPoc1.DTO
{
    public class InputOutputData
    {
        public string JobId { get; set; }
        public string RequestId { get; set; }
        public string BillingAuthority { get; set; }
        public string CreatedOnDateTime { get; set; }
        public string EstateFileName { get; set; }
        public string EstateActionType { get; set; }
        public string HouseTypeName { get; set; }

        public string Town { get; set; }
        public string PostCode { get; set; }

        public string UPRN { get; set; }

        public string BuildingName { get; set; }

        public Dictionary<string, string> testData { get; set; }
        public Dictionary<string, string> FindHereditament { get; set; }
    }
}
