using Reqnroll;
using Serilog;
using System.IO;
using Log = Serilog.Log;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    [Binding]
    public class Hooks
    {
        private readonly PlaywrightHelper _playwrightHelper;
        private readonly ScenarioContext _scenarioContext;

        public Hooks(PlaywrightHelper playwrightHelper, ScenarioContext scenarioContext)
        {
            _playwrightHelper = playwrightHelper;
            _scenarioContext = scenarioContext;
        }

        [BeforeTestRun]
        public static void BeforeTestRun()
        {
            Log.Logger = new LoggerConfiguration()
                .WriteTo.Console(outputTemplate: "[{Timestamp:HH:mm:ss} {Level:u3}] {Message:lj}{NewLine}{Exception}")
                .CreateLogger();

            Directory.CreateDirectory(
                Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "..", "..", "TestResults"));

            SetBaseUrl();
        }

        [BeforeScenario("UI")]
        public async Task BeforeScenario()
        {
            var browser = Config.BrowserType ?? "edge";
            await _playwrightHelper.InitAsync(browserType: browser, headless: false);
            Log.Information("Browser started for scenario: {Scenario}", _scenarioContext.ScenarioInfo.Title);
        }

        [AfterScenario("UI")]
        public async Task AfterScenario()
        {
            if (_scenarioContext.TestError != null)
            {
                var screenshot = await _playwrightHelper.TakeScreenshotAsync();
                var resultsDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "..", "..", "TestResults");
                var fileName = $"{DateTime.Now:yyyyMMdd_HHmmss_fff}_FAILED.png";
                await File.WriteAllBytesAsync(Path.Combine(resultsDir, fileName), screenshot);
                Log.Error("Scenario failed — screenshot saved: {File}", fileName);
            }

            await _playwrightHelper.DisposeAsync();
            Log.Information("Browser disposed");
        }

        [AfterTestRun]
        public static void AfterTestRun()
        {
            Log.CloseAndFlush();
        }

        private static void SetBaseUrl()
        {
            string propertiesFilePath = Path.Combine(
                AppDomain.CurrentDomain.BaseDirectory, Config.EnvironmentValFilePath ?? "");
            if (File.Exists(propertiesFilePath))
            {
                var reader = new PropertiesReader(propertiesFilePath);
                Config.BaseUrl = reader.Get(Config.EnvironmentVal ?? "") ?? "";
            }
        }
    }
}
