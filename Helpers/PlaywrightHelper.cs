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

            // LaunchPersistentContextAsync expects the User Data directory (NOT the Default
            // profile subfolder). Playwright appends \Default internally. Passing the wrong
            // path creates an empty nested profile with no SSO cookies.
            var userDataDir = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "Microsoft", "Edge", "User Data");

            var options = new BrowserTypeLaunchPersistentContextOptions
            {
                Headless          = headless,
                Channel           = "msedge",
                ViewportSize      = new ViewportSize { Width = 1920, Height = 1080 },
                IgnoreHTTPSErrors = true,
                // Do NOT add --disable-extensions: it kills Edge's built-in AAD SSO extension.
                Args = new[]
                {
                    "--no-first-run",
                    "--disable-features=ChromeWhatsNew",
                    "--disable-session-crashed-bubble"
                }
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
