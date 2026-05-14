using Microsoft.Extensions.Configuration;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    public static class Config
    {
        private static readonly IConfiguration _config;

        static Config()
        {
            _config = new ConfigurationBuilder()
                .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: false)
                .Build();

            BaseUrl                   = _config["BaseUrl"] ?? "";
            LAPortalBaseUrl           = _config["LAPortalBaseUrl"] ?? "";
            BrowserType               = _config["BrowserType"] ?? "edge";
            EnvironmentVal            = _config["EnvironmentVal"] ?? "";
            EnvironmentValFilePath    = _config["EnvironmentValFilePath"] ?? "";
            BaseApiUrl                = _config["BaseApiUrl"] ?? "";
            SearchJobRelativeUrl      = _config["SearchJobRelativeUrl"] ?? "";
            ReqClientId               = _config["ReqClientId"] ?? "";
            OrgId                     = _config["OrgId"] ?? "";
            CrmOwinAuth               = _config["CrmOwinAuth"] ?? "";
            Username                  = _config["Username"] ?? "";
            Password                  = _config["Password"] ?? "";
            LAPortalUsername          = _config["LAPortalUsername"] ?? "";
            LAPortalPassword          = _config["LAPortalPassword"] ?? "";
            TestDataExcelFilePath     = _config["TestDataExcelFilePath"] ?? "";
            TestOutPutExcelPath       = _config["TestOutPutExcelPath"] ?? "";
            SQLQueryPropertiesFilePath = _config["SQLQueryPropertiesFilePath"] ?? "";
            userFilePath              = _config["userFilePath"] ?? "";
            LogFilePath               = _config["LogFilePath"] ?? "";
            ScreenshotFolder          = _config["ScreenshotFolder"] ?? "";
            DBServer                  = _config["DBServer"] ?? "";
            DBPort                    = _config["DBPort"] ?? "5432";
            DBName                    = _config["DBName"] ?? "";
            BaseProposedEffectiveDate = _config["BaseProposedEffectiveDate"] ?? "";
            EnvironmentValue          = Environment.GetEnvironmentVariable(
                                            "TestEnvironment", EnvironmentVariableTarget.User) ?? "";
        }

        public static string BaseUrl                   { get; set; }
        public static string LAPortalBaseUrl           { get; set; }
        public static string BrowserType               { get; set; }
        public static string EnvironmentVal            { get; set; }
        public static string EnvironmentValFilePath    { get; set; }
        public static string EnvironmentValue          { get; set; }
        public static string BaseApiUrl                { get; set; }
        public static string SearchJobRelativeUrl      { get; set; }
        public static string ReqClientId               { get; set; }
        public static string OrgId                     { get; set; }
        public static string CrmOwinAuth               { get; set; }
        public static string Username                  { get; set; }
        public static string Password                  { get; set; }
        public static string LAPortalUsername          { get; set; }
        public static string LAPortalPassword          { get; set; }
        public static string TestDataExcelFilePath     { get; set; }
        public static string TestOutPutExcelPath       { get; set; }
        public static string SQLQueryPropertiesFilePath { get; set; }
        public static string userFilePath              { get; set; }
        public static string LogFilePath               { get; set; }
        public static string ScreenshotFolder          { get; set; }
        public static string DBServer                  { get; set; }
        public static string DBPort                    { get; set; }
        public static string DBName                    { get; set; }
        public static string BaseProposedEffectiveDate { get; set; }
    }
}
