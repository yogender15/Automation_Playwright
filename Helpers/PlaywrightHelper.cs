using Microsoft.Playwright;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    public class PlaywrightHelper
    {
        public IPage Page { get; private set; } = null!;

        private IBrowserContext _context = null!;
        private IPlaywright     _playwright = null!;

        // Matches DriverHelper: Driver.Manage().Timeouts().PageLoad = 360s
        private const int PageLoadTimeoutMs = 360_000;

        public async Task InitAsync(string browserType = "edge", bool headless = false)
        {
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();

            switch (browserType.ToLower())
            {
                case "edgeheadless":
                    // Mirrors DriverHelper "edgeheadless": headless + 1920x1080
                    _context = await LaunchHeadlessEdgeAsync();
                    break;

                case "newedge":
                    // Mirrors DriverHelper "newEdge": InPrivate (no persistent profile)
                    _context = await LaunchInPrivateEdgeAsync();
                    break;

                case "edge":
                default:
                    // Mirrors DriverHelper "edge": persistent user profile for Windows SSO
                    _context = await LaunchPersistentEdgeAsync(headless);
                    break;
            }

            Page = _context.Pages.Count > 0
                ? _context.Pages[0]
                : await _context.NewPageAsync();

            // Matches DriverHelper: Driver.Manage().Timeouts().PageLoad = 360 s
            Page.SetDefaultTimeout(PageLoadTimeoutMs);
            Page.SetDefaultNavigationTimeout(PageLoadTimeoutMs);

            // Apply 80% zoom on every page load — mirrors the commented-out
            // edgeheadless option: --force-device-scale-factor=0.8 / document.body.style.zoom
            await Page.AddInitScriptAsync("document.documentElement.style.zoom = '0.8'");
        }

        // ── Browser launch variants ──────────────────────────────────────────────

        private async Task<IBrowserContext> LaunchPersistentEdgeAsync(bool headless)
        {
            // LaunchPersistentContextAsync expects the User Data directory — NOT the
            // Default subfolder. Playwright appends \Default internally.
            var userDataDir = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "Microsoft", "Edge", "User Data");

            // Detect ServiceProfiles (Azure DevOps build agent).
            // On agents, --start-maximized has no effect without a display, so use a
            // fixed viewport instead — mirrors DriverHelper's ServiceProfiles branch.
            string userId = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile)
                .Split(Path.DirectorySeparatorChar).Last();
            bool isAgent = userId.Equals("ServiceProfiles", StringComparison.OrdinalIgnoreCase);

            var options = new BrowserTypeLaunchPersistentContextOptions
            {
                Headless          = headless,
                Channel           = "msedge",
                // null + --start-maximized for local runs; fixed viewport on CI agent
                ViewportSize      = isAgent
                    ? new ViewportSize { Width = 1920, Height = 1080 }
                    : null,
                IgnoreHTTPSErrors = true,
                // Do NOT add --disable-extensions: kills Edge's built-in AAD SSO extension.
                // Matches DriverHelper edge args:
                Args = new[]
                {
                    "--start-maximized",          // Driver.Manage().Window.Maximize()
                    "--no-sandbox",               // edgeoptions.AddArgument("no-sandbox")
                    "--disable-web-security",     // edgeoptions.AddArgument("disable-web-security")
                    "--disable-gpu",              // edgeoptions.AddArgument("--disable-gpu")
                    "--disable-infobars",         // edgeoptions.AddArgument("disable-infobars")
                    "--no-first-run",
                    "--disable-features=ChromeWhatsNew",
                    "--disable-session-crashed-bubble"
                }
            };

            return await _playwright.Chromium.LaunchPersistentContextAsync(userDataDir, options);
        }

        private async Task<IBrowserContext> LaunchHeadlessEdgeAsync()
        {
            // Mirrors DriverHelper "edgeheadless": --headless=new + 1920x1080
            var browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions
            {
                Headless = true,
                Channel  = "msedge",
                Args     = new[]
                {
                    "--no-sandbox",
                    "--disable-web-security",
                    "--disable-gpu",
                    "--disable-infobars",
                    "--no-first-run",
                    "--window-size=1920,1080"
                }
            });
            return await browser.NewContextAsync(new BrowserNewContextOptions
            {
                ViewportSize      = new ViewportSize { Width = 1920, Height = 1080 },
                IgnoreHTTPSErrors = true
            });
        }

        private async Task<IBrowserContext> LaunchInPrivateEdgeAsync()
        {
            // Mirrors DriverHelper "newEdge": InPrivate (no persisted profile)
            var browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions
            {
                Headless = false,
                Channel  = "msedge",
                Args     = new[]
                {
                    "--start-maximized",
                    "--no-sandbox",
                    "--disable-web-security",
                    "--disable-gpu",
                    "--disable-infobars",
                    "--no-first-run",
                    "--inprivate"
                }
            });
            return await browser.NewContextAsync(new BrowserNewContextOptions
            {
                ViewportSize      = null,
                IgnoreHTTPSErrors = true
            });
        }

        // ── Dispose ──────────────────────────────────────────────────────────────

        public async Task DisposeAsync()
        {
            if (_context is not null) await _context.CloseAsync();
            _playwright?.Dispose();
        }

        // ── Screenshot ───────────────────────────────────────────────────────────

        public async Task<byte[]> TakeScreenshotAsync()
        {
            return await Page.ScreenshotAsync(new PageScreenshotOptions { FullPage = true });
        }

        // ── Sign-in popup dismissal ───────────────────────────────────────────────
        // Mirrors DriverHelper.DismissSignInPopupIfPresent() exactly:
        // detect Sign in button → click → wait for it to disappear → refresh page.

        public async Task DismissSignInPopupIfPresentAsync()
        {
            try
            {
                var signIn = Page.Locator(
                    "button:text-is('Sign in'), input[value='Sign in']").First;

                if (await signIn.IsVisibleAsync())
                {
                    await signIn.ClickAsync();
                    Log.Information("Sign-in popup detected and dismissed — refreshing page");

                    // Wait for sign-in to clear (mirrors WebDriverWait until not displayed)
                    await Page.Locator("button:text-is('Sign in'), input[value='Sign in']")
                              .WaitForAsync(new()
                              {
                                  State   = WaitForSelectorState.Hidden,
                                  Timeout = 10_000
                              });

                    // Refresh — mirrors Driver.Navigate().Refresh() + readyState check
                    await Page.ReloadAsync(new PageReloadOptions
                    {
                        WaitUntil = WaitUntilState.DOMContentLoaded
                    });
                    Log.Information("Page refreshed after sign-in popup");
                }
            }
            catch { /* popup not present — nothing to do */ }
        }
    }
}
