using BSTVOAQAAutomation.Playwright.Helpers;
using BSTVOAQAAutomation.Playwright.Pages.UI.RBSP_BP;
using Reqnroll;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Steps.UI
{
    [Binding]
    public class LoginSteps
    {
        private readonly PlaywrightHelper _pw;
        private readonly ScenarioContext _scenarioContext;

        // Reqnroll injects PlaywrightHelper (registered in Hooks) and ScenarioContext
        public LoginSteps(PlaywrightHelper pw, ScenarioContext scenarioContext)
        {
            _pw = pw;
            _scenarioContext = scenarioContext;
        }

        [Given(@"User is logged in to Dynamics application to work for ""(.*)"" case")]
        public async Task GivenUserIsLoggedInToDynamicsApplicationToWorkForCase(string caseName)
        {
            var loginPage = new LoginPage(_pw.Page);
            await loginPage.LoginAsync(Config.BaseUrl);
            Log.Information("Logged in for case: {Case}", caseName);
        }

        [Given(@"User is logged in")]
        public async Task GivenUserIsLoggedIn()
        {
            var loginPage = new LoginPage(_pw.Page);
            await loginPage.LoginAsync(Config.BaseUrl);
        }

        [Given(@"User closes browser")]
        public async Task GivenUserClosesBrowser()
        {
            // Browser disposal is handled by AfterScenario in Hooks — nothing to do here
            await Task.CompletedTask;
        }

        [Given(@"User logged out from Dynamics application")]
        public async Task GivenUserLoggedOutFromDynamicsApplication()
        {
            await _pw.Page.GotoAsync("about:blank");
            Log.Information("Navigated away from Dynamics (simulating logout)");
        }

        [Given(@"User collapse if site map navigation expanded on left pane")]
        public async Task GivenUserCollapseIfSiteMapNavigationExpandedOnLeftPane()
        {
            var expandedNav = _pw.Page.Locator("[aria-label='Site Map'][aria-expanded='true']");
            if (await expandedNav.IsVisibleAsync())
            {
                await expandedNav.ClickAsync();
                Log.Information("Collapsed site map navigation");
            }
        }
    }
}
