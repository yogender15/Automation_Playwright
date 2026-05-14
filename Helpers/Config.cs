using System.Configuration;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    public static class Config
    {
        static Config()
        {
            SITBaseUrl             = ConfigurationManager.AppSettings["SITBaseUrl"] ?? "";
            UATBaseUrl             = ConfigurationManager.AppSettings["UATBaseUrl"] ?? "";
            PPEBaseUrl             = ConfigurationManager.AppSettings["PPEBaseUrl"] ?? "";
            LAPortalBaseUrl        = ConfigurationManager.AppSettings["LAPortalBaseUrl"] ?? "";
            ReqClientId            = ConfigurationManager.AppSettings["ReqClientId"] ?? "";
            OrgId                  = ConfigurationManager.AppSettings["OrgId"] ?? "";
            CrmOwinAuth            = ConfigurationManager.AppSettings["CrmOwinAuth"] ?? "";
            BaseApiUrl             = ConfigurationManager.AppSettings["BaseApiUrl"] ?? "";
            SearchJobRelativeUrl   = ConfigurationManager.AppSettings["SearchJobRelativeUrl"] ?? "";
            Username               = ConfigurationManager.AppSettings["Username"] ?? "";
            Password               = ConfigurationManager.AppSettings["Password"] ?? "";
            LAPortalUsername       = ConfigurationManager.AppSettings["LAPortalUsername"] ?? "";
            LAPortalPassword       = ConfigurationManager.AppSettings["LAPortalPassword"] ?? "";
            TestDataExcelFilePath  = ConfigurationManager.AppSettings["TestDataExcelFilePath"] ?? "";
            TestOutPutExcelPath    = ConfigurationManager.AppSettings["TestOutPutExcelPath"] ?? "";
            SQLQueryPropertiesFilePath = ConfigurationManager.AppSettings["SQLQueryPropertiesFilePath"] ?? "";
            LogFilePath            = ConfigurationManager.AppSettings["LogFilePath"] ?? "";
            EnvironmentVal         = ConfigurationManager.AppSettings["EnvironmentVal"] ?? "";
            EnvironmentValFilePath = ConfigurationManager.AppSettings["EnvironmentValFilePath"] ?? "";
            userFilePath           = ConfigurationManager.AppSettings["userFilePath"] ?? "";
            BrowserType            = ConfigurationManager.AppSettings["BrowserType"] ?? "edge";
            BaseProposedEffectiveDate = ConfigurationManager.AppSettings["BaseProposedEffectiveDate"] ?? "";
            DBServer               = ConfigurationManager.AppSettings["DBServer"] ?? "";
            DBPort                 = ConfigurationManager.AppSettings["DBPort"] ?? "5432";
            DBName                 = ConfigurationManager.AppSettings["DBName"] ?? "";
            ScreenshotFolder       = ConfigurationManager.AppSettings["ScreenshotFolder"] ?? "";
            EnvironmentValue       = Environment.GetEnvironmentVariable("TestEnvironment",
                                         EnvironmentVariableTarget.User) ?? "";
        }

        public static string BaseUrl                  { get; set; } = "";
        public static string SITBaseUrl               { get; set; }
        public static string UATBaseUrl               { get; set; }
        public static string PPEBaseUrl               { get; set; }
        public static string LAPortalBaseUrl          { get; set; }
        public static string EnvironmentValue         { get; set; }
        public static string ReqClientId              { get; set; }
        public static string OrgId                    { get; set; }
        public static string CrmOwinAuth              { get; set; }
        public static string BaseApiUrl               { get; set; }
        public static string SearchJobRelativeUrl     { get; set; }
        public static string Username                 { get; set; }
        public static string Password                 { get; set; }
        public static string LAPortalUsername         { get; set; }
        public static string LAPortalPassword         { get; set; }
        public static string TestDataExcelFilePath    { get; set; }
        public static string TestOutPutExcelPath      { get; set; }
        public static string SQLQueryPropertiesFilePath { get; set; }
        public static string LogFilePath              { get; set; }
        public static string EnvironmentVal           { get; set; }
        public static string EnvironmentValFilePath   { get; set; }
        public static string userFilePath             { get; set; }
        public static string BrowserType              { get; set; }
        public static string BaseProposedEffectiveDate { get; set; }
        public static string DBServer                 { get; set; }
        public static string DBPort                   { get; set; }
        public static string DBName                   { get; set; }
        public static string ScreenshotFolder         { get; set; }
    }
}
