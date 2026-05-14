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
                // null lets --start-maximized control the window size.
                // A fixed ViewportSize overrides the flag and prevents true maximization.
                ViewportSize      = null,
                IgnoreHTTPSErrors = true,
                // Do NOT add --disable-extensions: it kills Edge's built-in AAD SSO extension.
                Args = new[]
                {
                    "--start-maximized",
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

            // Apply 80% zoom on every page load so Dynamics fits on screen without scrolling.
            // AddInitScript runs before any page script, persisting across navigations.
            await Page.AddInitScriptAsync("document.documentElement.style.zoom = '0.8'");
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
