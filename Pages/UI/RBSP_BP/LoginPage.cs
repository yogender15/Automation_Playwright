using BSTVOAQAAutomation.Playwright.Helpers;
using Microsoft.Playwright;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Pages.UI.RBSP_BP
{
    public class LoginPage : BasePage
    {
        public LoginPage(IPage page) : base(page) { }

        // Locators — defined once, re-evaluated on every use (no stale element risk)
        private ILocator EmailField      => _page.Locator("input[type='email']");
        private ILocator NextButton      => _page.Locator("input[value='Next'], button:has-text('Next')");
        private ILocator PasswordField   => _page.Locator("input[type='password']");
        private ILocator SignInButton    => _page.Locator("input[value='Sign in'], button:has-text('Sign in')");
        private ILocator StaySignedInNo  => _page.Locator("input[value='No'], button:has-text('No')");
        private ILocator AppTitle        => _page.Locator("[title='Dynamics 365']");

        public async Task GoToLoginPageAsync(string baseUrl)
        {
            await _page.GotoAsync(baseUrl);
            await WaitForPageReadyAsync();
            Log.Information("Navigated to: {Url}", baseUrl);
        }

        public async Task LoginWithExistingUserAsync()
        {
            // On HMRC VMs the Edge profile already holds an active Azure AD session,
            // so Dynamics loads without any interaction. Wait up to 45 s for SSO to
            // complete before falling back to manual steps.
            try
            {
                await AppTitle.WaitForAsync(new() { Timeout = 45_000 });
                Log.Information("Dynamics 365 loaded via Windows SSO — no login needed");
                return;
            }
            catch { /* SSO did not complete — login page appeared */ }

            // Login page visible: try to sign in.
            // Note: Username/Password are set to Azure DevOps pipeline vars on CI.
            // For local runs the HMRC VM Windows SSO path above should have succeeded.
            if (await EmailField.IsVisibleAsync())
            {
                await EmailField.FillAsync(Config.Username);
                await NextButton.ClickAsync();

                // Wait for password field — it may not appear if AAD picks up SSO mid-flow
                try
                {
                    await PasswordField.WaitForAsync(new() { Timeout = 15_000 });
                    await PasswordField.FillAsync(Config.Password);
                    await SignInButton.ClickAsync();
                }
                catch { /* AAD completed SSO after email step — no password needed */ }

                try
                {
                    if (await StaySignedInNo.IsVisibleAsync())
                        await StaySignedInNo.ClickAsync();
                }
                catch { }
            }

            // Final wait for Dynamics dashboard
            await AppTitle.WaitForAsync(new() { Timeout = 60_000 });
            Log.Information("User landed in Dynamics 365 dashboard");
        }

        public async Task LoginAsync(string baseUrl)
        {
            await GoToLoginPageAsync(baseUrl);
            await LoginWithExistingUserAsync();
        }
    }
}
