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
            // Microsoft SSO — already authenticated via Windows session
            // If login page appears, enter credentials from Config
            if (await EmailField.IsVisibleAsync())
            {
                await EmailField.FillAsync(Config.Username);
                await NextButton.ClickAsync();
                await PasswordField.FillAsync(Config.Password);
                await SignInButton.ClickAsync();

                if (await StaySignedInNo.IsVisibleAsync())
                    await StaySignedInNo.ClickAsync();
            }

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
