using BSTVOAQAAutomation.Playwright.Helpers;
using Microsoft.Playwright;
using NUnit.Framework;
using Reqnroll;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Steps.UI
{
    [Binding]
    public class CommonSteps
    {
        private readonly PlaywrightHelper _pw;
        private readonly ScenarioContext _scenarioContext;

        public CommonSteps(PlaywrightHelper pw, ScenarioContext scenarioContext)
        {
            _pw = pw;
            _scenarioContext = scenarioContext;
        }

        // ── Test Data ────────────────────────────────────────────────────────────

        [Given(@"User uses test data with ID '(.*)' from '(.*)' sheet")]
        [When(@"User uses test data with ID '(.*)' from '(.*)' sheet")]
        [Then(@"User uses test data with ID '(.*)' from '(.*)' sheet")]
        public void GivenUserUsesTestDataWithIDFromSheet(string testCaseID, string sheetName)
        {
            var excelUtil = new ExcelTestDataUtility(Config.TestDataExcelFilePath);
            var testData = excelUtil.GetTestDataByID(sheetName, testCaseID);
            _scenarioContext["testData"] = testData;
            Log.Information("Test data loaded: {ID} from sheet {Sheet}", testCaseID, sheetName);
        }

        // ── Navigation ───────────────────────────────────────────────────────────

        [Given(@"User click on '(.*)' under '(.*)' section")]
        [When(@"User click on '(.*)' under '(.*)' section")]
        [Then(@"User click on '(.*)' under '(.*)' section")]
        public async Task GivenUserClickOnUnderSection(string menuItem, string sectionName)
        {
            var locator = _pw.Page.Locator(
                $"ul[aria-label='{sectionName}'] li[aria-label='{menuItem}'], " +
                $"[aria-label='{menuItem}'][role='treeitem']").First;

            await locator.WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 30_000 });
            await locator.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked '{Item}' under '{Section}'", menuItem, sectionName);
        }

        // Generic: handles 'menubar', 'dialog', or any other 'from' qualifier
        [Given(@"User click on '(.*)' button from '(.*)'")]
        [When(@"User click on '(.*)' button from '(.*)'")]
        [Then(@"User click on '(.*)' button from '(.*)'")]
        public async Task GivenUserClickOnButtonFrom(string buttonName, string context)
        {
            if (context.Equals("menubar", StringComparison.OrdinalIgnoreCase))
            {
                await GivenUserClickOnButtonFromMenubar(buttonName);
                return;
            }

            if (context.Equals("dialog", StringComparison.OrdinalIgnoreCase))
            {
                var dialog = _pw.Page.Locator("[role='dialog']");
                var dialogBtn = dialog.GetByRole(AriaRole.Button, new() { Name = buttonName }).First;
                await dialogBtn.EvaluateAsync("el => el.click()");
                Log.Information("Clicked '{Button}' on dialog", buttonName);
                return;
            }

            // Fallback for any other context (e.g. 'form', 'panel', etc.)
            var btn = _pw.Page.Locator(
                $"button[aria-label='{buttonName}'], " +
                $"button:text-is('{buttonName}')").First;
            await btn.EvaluateAsync("el => el.click()");
            Log.Information("Clicked '{Button}' from '{Context}'", buttonName, context);
        }

        // Internal helper — called by GivenUserClickOnButtonFrom when context = 'menubar'
        private async Task GivenUserClickOnButtonFromMenubar(string buttonName)
        {
            if (buttonName.Equals("Save", StringComparison.OrdinalIgnoreCase))
            {
                await GivenUserClickOnSaveButtonFromMenubar();
                return;
            }
            if (buttonName.Equals("Save & Close", StringComparison.OrdinalIgnoreCase))
            {
                await GivenUserClickOnSaveAndCloseButton();
                return;
            }
            var locator = _pw.Page.Locator(
                $"button[aria-label='{buttonName}'], " +
                $"button[data-id*='{buttonName}'], " +
                $"li[aria-label='{buttonName}']").First;
            await locator.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked '{Button}' from menubar", buttonName);
        }

        [Given(@"User click on '(.*)' button")]
        [When(@"User click on '(.*)' button")]
        [Then(@"User click on '(.*)' button")]
        public async Task GivenUserClickOnButton(string buttonName)
        {
            var locator = _pw.Page.Locator(
                $"button[aria-label='{buttonName}'], " +
                $"button:text-is('{buttonName}'), " +
                $"input[value='{buttonName}']").First;
            await locator.WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 30_000 });
            await locator.EvaluateAsync("el => el.click()");
            Log.Information("Clicked button: {Button}", buttonName);
        }

        [Given(@"User clicked on '(.*)' button")]
        [When(@"User clicked on '(.*)' button")]
        [Then(@"User clicked on '(.*)' button")]
        public async Task GivenUserClickedOnButton(string buttonName)
        {
            var locator = _pw.Page.Locator(
                $"button[aria-label='{buttonName}'], " +
                $"button:text-is('{buttonName}')").First;
            await locator.EvaluateAsync("el => el.click()");
            Log.Information("Clicked button: {Button}", buttonName);
        }

[Given(@"User click on '(.*)' tab from '(.*)'")]
        [When(@"User click on '(.*)' tab from '(.*)'")]
        [Then(@"User click on '(.*)' tab from '(.*)'")]
        public async Task GivenUserClickOnTabFrom(string tabName, string formName)
        {
            var tab = _pw.Page.Locator($"li[title='{tabName}'], [aria-label='{tabName}']").First;
            await tab.EvaluateAsync("el => el.click()");
            Log.Information("Clicked tab: {Tab}", tabName);
        }

        [Given(@"User scroll to '(.*)' element")]
        [When(@"User scroll to '(.*)' element")]
        [Then(@"User scroll to '(.*)' element")]
        public async Task GivenUserScrollToElement(string elementLabel)
        {
            var element = _pw.Page.Locator(
                $"[aria-label='{elementLabel}'], [data-id*='{elementLabel}'], " +
                $"label:has-text('{elementLabel}')").First;
            await element.ScrollIntoViewIfNeededAsync();
            Log.Information("Scrolled to element: {Element}", elementLabel);
        }

        // ── Waits ────────────────────────────────────────────────────────────────

        [Given(@"user waits till '(.*)' '(.*)' disappears")]
        [When(@"user waits till '(.*)' '(.*)' disappears")]
        [Then(@"user waits till '(.*)' '(.*)' disappears")]
        public async Task GivenUserWaitsTillDisappears(string label, string roleType)
        {
            var locator = _pw.Page.Locator(
                $"[role='{roleType}'][aria-label*='{label}'], " +
                $"//*[@role='{roleType}' and contains(text(),'{label}')]").First;
            try
            {
                await locator.WaitForAsync(new() { State = WaitForSelectorState.Hidden, Timeout = 60_000 });
            }
            catch { }
        }

        [Given(@"user waits till app progress indicator disappears")]
        [Given(@"user waits till progress indicator disappears")]
        [Given(@"user waits till loading spinner disappears")]
        [Given(@"user waits till Spinner disappears")]
        [When(@"user waits till app progress indicator disappears")]
        [When(@"user waits till progress indicator disappears")]
        [When(@"user waits till loading spinner disappears")]
        [When(@"user waits till Spinner disappears")]
        [Then(@"user waits till app progress indicator disappears")]
        [Then(@"user waits till progress indicator disappears")]
        [Then(@"user waits till loading spinner disappears")]
        [Then(@"user waits till Spinner disappears")]
        public async Task GivenUserWaitsTillProgressIndicatorDisappears()
        {
            var indicators = new[]
            {
                "div[id='global-app-progress-indicator']",
                "div[id='appProgressIndicatorContainer']",
                "div[class*='ms-Spinner']"
            };
            foreach (var selector in indicators)
            {
                try
                {
                    var loc = _pw.Page.Locator(selector);
                    if (await loc.IsVisibleAsync())
                        await loc.WaitForAsync(new() { State = WaitForSelectorState.Hidden, Timeout = 30_000 });
                }
                catch { }
            }
        }

        [Given(@"User waits till '(.*)' disappears")]
        [When(@"User waits till '(.*)' disappears")]
        [Then(@"User waits till '(.*)' disappears")]
        public async Task GivenUserWaitsTillDisappears(string roleType)
        {
            try
            {
                var locator = _pw.Page.Locator($"[role='{roleType}']").First;
                await locator.WaitForAsync(new() { State = WaitForSelectorState.Hidden, Timeout = 30_000 });
            }
            catch { }
        }

        [Given(@"user waits till Find Hereditament dialog disappears")]
        [Given(@"User waits till Find Hereditament dialog disappears")]
        [When(@"user waits till Find Hereditament dialog disappears")]
        [When(@"User waits till Find Hereditament dialog disappears")]
        [Then(@"user waits till Find Hereditament dialog disappears")]
        [Then(@"User waits till Find Hereditament dialog disappears")]
        public async Task GivenUserWaitsTillFindHereditamentDialogDisappears()
        {
            try
            {
                var dialog = _pw.Page.Locator("[aria-label='Lookup Results'], [data-id='lookupDialogLookup']");
                await dialog.WaitForAsync(new() { State = WaitForSelectorState.Hidden, Timeout = 30_000 });
            }
            catch { }
        }

        // ── Assertions ───────────────────────────────────────────────────────────

        [Given(@"User validates the status as '(.*)'")]
        [When(@"User validates the status as '(.*)'")]
        [Then(@"User validates the status as '(.*)'")]
        public async Task ThenUserValidatesTheStatusAs(string expectedStatus)
        {
            var statusLocator = _pw.Page.Locator(
                $"[title='{expectedStatus}'], div[data-id*='statuscode'] option[selected]");
            await Assertions.Expect(statusLocator.First).ToBeVisibleAsync(new() { Timeout = 30_000 });
            Log.Information("Status validated: {Status}", expectedStatus);
        }

        [Given(@"User validate '(.*)' status of '(.*)'")]
        [When(@"User validate '(.*)' status of '(.*)'")]
        [Then(@"User validate '(.*)' status of '(.*)'")]
        public async Task ThenUserValidateStatusOf(string status, string recordType)
        {
            var statusLocator = _pw.Page.Locator($"[title='{status}']").First;
            await Assertions.Expect(statusLocator).ToBeVisibleAsync(new() { Timeout = 30_000 });
            Log.Information("Validated {RecordType} status: {Status}", recordType, status);
        }

        // ── Save / Refresh ───────────────────────────────────────────────────────

        public async Task GivenUserClickOnSaveButtonFromMenubar()
        {
            await _pw.Page.Locator("button[aria-label='Save (CTRL+S)'], button[data-id='quickCreateSaveAndCloseBtn']")
                          .First.EvaluateAsync("el => el.click()");
            await GivenUserWaitsTillProgressIndicatorDisappears();
            Log.Information("Saved record");
        }

        public async Task GivenUserClickOnSaveAndCloseButton()
        {
            await _pw.Page.Locator("button[aria-label='Save & Close'], button[data-id='saveandclose']")
                          .First.EvaluateAsync("el => el.click()");
            await GivenUserWaitsTillProgressIndicatorDisappears();
            Log.Information("Saved and closed");
        }

        [Given(@"User click on 'Refresh' button from 'menubar'")]
        [When(@"User click on 'Refresh' button from 'menubar'")]
        [Then(@"User click on 'Refresh' button from 'menubar'")]
        public async Task GivenUserClickOnRefreshButtonFromMenubar()
        {
            await _pw.Page.Locator("button[aria-label='Refresh']").First.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Refreshed page");
        }

        // ── Dialog handling ──────────────────────────────────────────────────────

        [Given(@"User closes dialog if still present")]
        [When(@"User closes dialog if still present")]
        [Then(@"User closes dialog if still present")]
        public async Task GivenUserClosesDialogIfStillPresent()
        {
            var closeBtn = _pw.Page.Locator(
                "button[aria-label='Close'], button[data-id='dialogCloseIconButton']").First;
            if (await closeBtn.IsVisibleAsync())
            {
                await closeBtn.EvaluateAsync("el => el.click()");
                Log.Information("Closed dialog");
            }
        }

        [Given(@"User clicks on '(.*)' button on '(.*)' dialog")]
        [When(@"User clicks on '(.*)' button on '(.*)' dialog")]
        [Then(@"User clicks on '(.*)' button on '(.*)' dialog")]
        public async Task GivenUserClicksOnButtonOnDialog(string buttonName, string dialogTitle)
        {
            var dialog = _pw.Page.Locator(
                $"[aria-label='{dialogTitle}'], div[role='dialog']:has-text('{dialogTitle}')").First;
            var btn = dialog.GetByRole(AriaRole.Button, new() { Name = buttonName });
            await btn.EvaluateAsync("el => el.click()");
            Log.Information("Clicked '{Button}' on '{Dialog}' dialog", buttonName, dialogTitle);
        }

        [Given(@"User clicks on '(.*)' button element")]
        [Given(@"User clicks on 'OK' button element")]
        [When(@"User clicks on '(.*)' button element")]
        [When(@"User clicks on 'OK' button element")]
        [Then(@"User clicks on '(.*)' button element")]
        [Then(@"User clicks on 'OK' button element")]
        public async Task GivenUserClicksOnButtonElement(string buttonName)
        {
            var btn = _pw.Page.GetByRole(AriaRole.Button, new() { Name = buttonName }).First;
            await btn.EvaluateAsync("el => el.click()");
            Log.Information("Clicked button element: {Button}", buttonName);
        }
    }
}
