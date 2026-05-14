using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POMSeleniumFrameworkPoc1.DTO.UI
{
    public class SubmissionTestData
    {
        public string IntegrationDataSource { get; set; }
        public string IDS { get; set; }
        public string SubmittedBy { get; set; }
        public string RelationshipRole { get; set; }

        public string SubmissionID { get; set; }
        public string RemarksText { get; set; }
    }
}
