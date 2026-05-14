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
        private readonly ScenarioContext  _scenarioContext;

        public Hooks(PlaywrightHelper playwrightHelper, ScenarioContext scenarioContext)
        {
            _playwrightHelper = playwrightHelper;
            _scenarioContext  = scenarioContext;
        }

        // ── Test run ─────────────────────────────────────────────────────────────

        [BeforeTestRun]
        public static void BeforeTestRun()
        {
            // Resolve log file path from config (mirrors old framework's Log.Information sinks)
            string logPath = "";
            try
            {
                logPath = Path.GetFullPath(
                    Path.Combine(AppDomain.CurrentDomain.BaseDirectory, Config.LogFilePath));
                Directory.CreateDirectory(Path.GetDirectoryName(logPath)!);
            }
            catch { /* path not configured — console-only logging */ }

            var logConfig = new LoggerConfiguration()
                .WriteTo.Console(outputTemplate:
                    "[{Timestamp:HH:mm:ss} {Level:u3}] {Message:lj}{NewLine}{Exception}");

            if (!string.IsNullOrEmpty(logPath))
                logConfig = logConfig.WriteTo.File(logPath,
                    rollingInterval: RollingInterval.Day,
                    outputTemplate: "[{Timestamp:HH:mm:ss} {Level:u3}] {Message:lj}{NewLine}{Exception}");

            Log.Logger = logConfig.CreateLogger();

            Directory.CreateDirectory(ScreenshotFolder());
        }

        // ── Scenario ─────────────────────────────────────────────────────────────

        [BeforeScenario("UI")]
        public async Task BeforeScenario()
        {
            var browser = Config.BrowserType ?? "edge";
            await _playwrightHelper.InitAsync(browserType: browser, headless: false);
            Log.Information("Browser started for scenario: {Scenario}",
                _scenarioContext.ScenarioInfo.Title);
        }

        [AfterScenario("UI")]
        public async Task AfterScenario()
        {
            if (_scenarioContext.TestError != null)
            {
                await SaveScreenshotAsync("FAILED");
            }

            await _playwrightHelper.DisposeAsync();
            Log.Information("Browser disposed");
        }

        // ── Step ─────────────────────────────────────────────────────────────────

        // Mirrors DriverHelper.DismissSignInPopupIfPresent() called from [BeforeStep] in the
        // old Hooks — catches the AAD re-authentication popup that can appear mid-scenario.
        [BeforeStep]
        public async Task BeforeStep()
        {
            await _playwrightHelper.DismissSignInPopupIfPresentAsync();
        }

        // Save a screenshot when a step fails — mirrors old AfterStep PDF screenshot logic
        // (without the PDF; just saves a PNG with timestamp + scenario name).
        [AfterStep]
        public async Task AfterStep()
        {
            if (_scenarioContext.TestError != null)
            {
                await SaveScreenshotAsync("STEP_FAILED");
            }
        }

        // ── Test run teardown ────────────────────────────────────────────────────

        [AfterTestRun]
        public static void AfterTestRun()
        {
            Log.CloseAndFlush();
        }

        // ── Helpers ──────────────────────────────────────────────────────────────

        private async Task SaveScreenshotAsync(string suffix)
        {
            try
            {
                var screenshot = await _playwrightHelper.TakeScreenshotAsync();
                // Mirrors DriverHelper.TakeScreenShot(): yyyyMMdd_HHmmss_fff + scenario title
                var safeTitle = new string(
                    _scenarioContext.ScenarioInfo.Title
                        .Take(60)
                        .Select(c => Path.GetInvalidFileNameChars().Contains(c) ? '_' : c)
                        .ToArray());
                var fileName = $"{DateTime.Now:yyyyMMdd_HHmmss_fff}_{safeTitle}_{suffix}.png";
                var filePath = Path.Combine(ScreenshotFolder(), fileName);
                await File.WriteAllBytesAsync(filePath, screenshot);
                Log.Error("Screenshot saved: {File}", fileName);
            }
            catch (Exception ex)
            {
                Log.Warning("Could not save screenshot: {Msg}", ex.Message);
            }
        }

        private static string ScreenshotFolder()
        {
            // Mirrors DriverHelper.TakeScreenShot(): "Screenshots" under working directory
            string folder = "";
            try
            {
                folder = Path.GetFullPath(
                    Path.Combine(AppDomain.CurrentDomain.BaseDirectory,
                                 Config.ScreenshotFolder ?? "Screenshots"));
            }
            catch
            {
                folder = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Screenshots");
            }
            Directory.CreateDirectory(folder);
            return folder;
        }

        private static void SetBaseUrl()
        {
            string propertiesFilePath = Path.Combine(
                AppDomain.CurrentDomain.BaseDirectory, Config.EnvironmentValFilePath ?? "");
            if (File.Exists(propertiesFilePath))
            {
                var reader = new PropertiesReader(propertiesFilePath);
                Config.BaseUrl = reader.Get(Config.EnvironmentVal ?? "") ?? Config.BaseUrl;
            }
        }
    }
}
