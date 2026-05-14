using Microsoft.Playwright;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    public class PlaywrightHelper
    {
        public IPage Page { get; private set; } = null!;

        private IBrowserContext _context = null!;
        private IPlaywright _playwright = null!;

        public async Task InitAsync(string browserType = "edge", bool headless = false)
        {
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();

            // Use the user's existing Edge profile so Windows SSO works automatically —
            // same behaviour as the existing Selenium framework which also used the live profile.
            var userDataDir = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "Microsoft", "Edge", "User Data", "Default");

            var options = new BrowserTypeLaunchPersistentContextOptions
            {
                Headless   = headless,
                Channel    = "msedge",
                ViewportSize = new ViewportSize { Width = 1920, Height = 1080 },
                IgnoreHTTPSErrors = true,
                Args = new[] { "--disable-extensions", "--no-first-run" }
            };

            _context = await _playwright.Chromium.LaunchPersistentContextAsync(
                userDataDir, options);

            Page = _context.Pages.Count > 0
                ? _context.Pages[0]
                : await _context.NewPageAsync();
        }

        public async Task DisposeAsync()
        {
            if (_context is not null) await _context.CloseAsync();
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
