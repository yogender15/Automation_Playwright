using Microsoft.Playwright;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    public class PlaywrightHelper
    {
        public IPage Page { get; private set; } = null!;

        private IBrowser _browser = null!;
        private IBrowserContext _context = null!;
        private IPlaywright _playwright = null!;

        public async Task InitAsync(string browserType = "edge", bool headless = false)
        {
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();

            var launchOptions = new BrowserTypeLaunchOptions { Headless = headless };

            _browser = browserType.ToLower() switch
            {
                "chrome"  => await _playwright.Chromium.LaunchAsync(launchOptions),
                "firefox" => await _playwright.Firefox.LaunchAsync(launchOptions),
                "edge"    => await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions
                {
                    Headless = headless,
                    Channel  = "msedge"
                }),
                _ => throw new ArgumentException($"Unsupported browser: {browserType}")
            };

            _context = await _browser.NewContextAsync(new BrowserNewContextOptions
            {
                ViewportSize = new ViewportSize { Width = 1920, Height = 1080 },
                IgnoreHTTPSErrors = true
            });

            Page = await _context.NewPageAsync();
        }

        public async Task DisposeAsync()
        {
            if (Page is not null)    await Page.CloseAsync();
            if (_context is not null) await _context.CloseAsync();
            if (_browser is not null) await _browser.CloseAsync();
            _playwright?.Dispose();
        }

        public async Task<byte[]> TakeScreenshotAsync()
        {
            return await Page.ScreenshotAsync(new PageScreenshotOptions
            {
                FullPage = true
            });
        }
    }
}
