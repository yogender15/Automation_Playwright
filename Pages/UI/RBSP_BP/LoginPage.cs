using BSTVOAQAAutomation.Playwright.Helpers;
using Microsoft.Playwright;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Pages.UI.RBSP_BP
{
    public class LoginPage : BasePage
    {
        public LoginPage(IPage page) : base(page) { }

        private ILocator EmailField     => _page.Locator("input[type='email']");
        private ILocator NextButton     => _page.Locator("input[value='Next'], button:has-text('Next')");
        private ILocator PasswordField  => _page.Locator("input[type='password']");
        private ILocator SignInButton   => _page.Locator("input[value='Sign in'], button:has-text('Sign in')");
        private ILocator StaySignedInNo => _page.Locator("input[value='No'], button:has-text('No')");

        // Reliable "Dynamics app is loaded" indicator — works for all VOA-branded instances.
        // AppTitle ([title='Dynamics 365']) doesn't match the VOA white-labelled deployment.
        private ILocator DynamicsReady  => _page.Locator(
            "[data-id='appHeaderContainer'], " +
            "[data-id='AppTabBar'], " +
            ".ms-AppBar");

        // Legal Notice "Continue" button — exact text match mirrors the old Selenium
        // XPath: //button[text()='Continue']  (text-is() is Playwright's exact equivalent)
        private ILocator LegalNoticeContinue => _page.Locator("button:text-is('Continue')");

        public async Task GoToLoginPageAsync(string baseUrl)
        {
            // Use DOMContentLoaded — Dynamics never reaches NetworkIdle due to
            // continuous background requests, so WaitForPageReadyAsync times out.
            await _page.GotoAsync(baseUrl, new PageGotoOptions
            {
                WaitUntil = WaitUntilState.DOMContentLoaded,
                Timeout   = 60_000
            });
            Log.Information("Navigated to: {Url}", baseUrl);
        }

        public async Task LoginWithExistingUserAsync()
        {
            // On HMRC VMs, the Edge profile already holds an active Azure AD session.
            // Dynamics should load without any login interaction.
            bool appLoaded = false;
            try
            {
                await DynamicsReady.First.WaitForAsync(
                    new() { State = WaitForSelectorState.Visible, Timeout = 45_000 });
                appLoaded = true;
                Log.Information("Dynamics app header visible — SSO succeeded");
            }
            catch { /* login page appeared instead */ }

            if (!appLoaded)
            {
                // Fall back to credential login (used by CI pipeline where vars are substituted)
                if (await EmailField.IsVisibleAsync())
                {
                    await EmailField.FillAsync(Config.Username);
                    await NextButton.ClickAsync();

                    try
                    {
                        await PasswordField.WaitForAsync(new() { Timeout = 15_000 });
                        await PasswordField.FillAsync(Config.Password);
                        await SignInButton.ClickAsync();
                    }
                    catch { /* AAD may have completed SSO after email — no password needed */ }

                    try
                    {
                        if (await StaySignedInNo.IsVisibleAsync())
                            await StaySignedInNo.ClickAsync();
                    }
                    catch { }

                    await DynamicsReady.First.WaitForAsync(
                        new() { State = WaitForSelectorState.Visible, Timeout = 60_000 });
                }
            }

            // Always dismiss the Legal Notice dialog ("This is a Private Computer System")
            // that Dynamics shows on each fresh session before letting the user in.
            await DismissLegalNoticeAsync();

            Log.Information("User is ready in Dynamics 365");
        }

        public async Task LoginAsync(string baseUrl)
        {
            await GoToLoginPageAsync(baseUrl);
            await LoginWithExistingUserAsync();
        }

        // ── Helpers ─────────────────────────────────────────────────────────────

        private async Task DismissLegalNoticeAsync()
        {
            try
            {
                // Give Dynamics a moment to render the overlay after the app header appears
                await _page.WaitForTimeoutAsync(2000);

                await LegalNoticeContinue.WaitForAsync(
                    new() { State = WaitForSelectorState.Visible, Timeout = 10_000 });

                // EvaluateAsync("el => el.click()") is the exact Playwright equivalent of
                // the old Selenium: IJavaScriptExecutor.ExecuteScript("arguments[0].click()", el)
                // DispatchEventAsync("click") is NOT the same — it fires a synthetic event
                // but does not invoke the element's native .click() handler.
                await LegalNoticeContinue.EvaluateAsync("el => el.click()");
                await _page.WaitForTimeoutAsync(1500);
                Log.Information("Legal Notice dismissed — el.click() via JS");
            }
            catch { /* dialog not present — nothing to do */ }
        }
    }
}
