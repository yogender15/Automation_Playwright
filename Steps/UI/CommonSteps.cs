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
        public void GivenUserUsesTestDataWithIDFromSheet(string testCaseID, string sheetName)
        {
            var excelUtil = new ExcelTestDataUtility(Config.TestDataExcelFilePath);
            var testData = excelUtil.GetTestDataByID(sheetName, testCaseID);
            _scenarioContext["testData"] = testData;
            Log.Information("Test data loaded: {ID} from sheet {Sheet}", testCaseID, sheetName);
        }

        // ── Navigation ───────────────────────────────────────────────────────────

        [Given(@"User click on '(.*)' under '(.*)' section")]
        public async Task GivenUserClickOnUnderSection(string menuItem, string sectionName)
        {
            // Selector mirrors old NavigateToMenuItem_new:
            // ul[aria-label='sectionName'] li[aria-label='menuItem']
            // Uses JS click (EvaluateAsync) same as old ClickUsingJavascript.
            var locator = _pw.Page.Locator(
                $"ul[aria-label='{sectionName}'] li[aria-label='{menuItem}'], " +
                $"[aria-label='{menuItem}'][role='treeitem']").First;

            await locator.WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 30_000 });
            await locator.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked '{Item}' under '{Section}'", menuItem, sectionName);
        }

        [Given(@"User click on '(.*)' button from 'menubar'")]
        public async Task GivenUserClickOnButtonFromMenubar(string buttonName)
        {
            // Save and Save & Close handled by dedicated methods below
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
            await locator.ClickAsync();
            await _pw.Page.WaitForLoadStateAsync(LoadState.NetworkIdle);
            Log.Information("Clicked '{Button}' from menubar", buttonName);
        }

        [Given(@"User clicked on '(.*)' button")]
        [When(@"User clicked on '(.*)' button")]
        public async Task GivenUserClickedOnButton(string buttonName)
        {
            await _pw.Page.GetByRole(AriaRole.Button, new() { Name = buttonName })
                          .First.ClickAsync();
            Log.Information("Clicked button: {Button}", buttonName);
        }

        [Given(@"User click on '(.*)' button from 'dialog'")]
        public async Task GivenUserClickOnButtonFromDialog(string buttonName)
        {
            var dialog = _pw.Page.Locator("[role='dialog']");
            await dialog.GetByRole(AriaRole.Button, new() { Name = buttonName })
                        .First.ClickAsync();
            Log.Information("Clicked '{Button}' on dialog", buttonName);
        }

        [Given(@"User click on '(.*)' tab from '(.*)'")]
        public async Task GivenUserClickOnTabFrom(string tabName, string formName)
        {
            await _pw.Page.Locator($"li[title='{tabName}'], [aria-label='{tabName}']")
                          .First.ClickAsync();
            Log.Information("Clicked tab: {Tab}", tabName);
        }

        [Given(@"User scroll to '(.*)' element")]
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
        public async Task GivenUserWaitsTillDisappears(string label, string roleType)
        {
            // Playwright auto-waits — explicitly wait for the saving indicator to go
            var locator = _pw.Page.Locator(
                $"[role='{roleType}'][aria-label*='{label}'], " +
                $"//*[@role='{roleType}' and contains(text(),'{label}')]").First;
            try
            {
                await locator.WaitForAsync(new() { State = WaitForSelectorState.Hidden, Timeout = 60_000 });
            }
            catch { /* element may never have appeared — that's fine */ }
        }

        [Given(@"user waits till app progress indicator disappears")]
        [Given(@"user waits till progress indicator disappears")]
        [Given(@"user waits till loading spinner disappears")]
        [Given(@"user waits till Spinner disappears")]
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

        [Then(@"User validates the status as '(.*)'")]
        public async Task ThenUserValidatesTheStatusAs(string expectedStatus)
        {
            var statusLocator = _pw.Page.Locator(
                $"[title='{expectedStatus}'], div[data-id*='statuscode'] option[selected]");
            await Assertions.Expect(statusLocator.First).ToBeVisibleAsync(new() { Timeout = 30_000 });
            Log.Information("Status validated: {Status}", expectedStatus);
        }

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
                          .First.ClickAsync();
            await GivenUserWaitsTillProgressIndicatorDisappears();
            Log.Information("Saved record");
        }

        public async Task GivenUserClickOnSaveAndCloseButton()
        {
            await _pw.Page.Locator("button[aria-label='Save & Close'], button[data-id='saveandclose']")
                          .First.ClickAsync();
            await GivenUserWaitsTillProgressIndicatorDisappears();
            Log.Information("Saved and closed");
        }

        [Given(@"User click on 'Refresh' button from 'menubar'")]
        public async Task GivenUserClickOnRefreshButtonFromMenubar()
        {
            await _pw.Page.Locator("button[aria-label='Refresh']").First.ClickAsync();
            await _pw.Page.WaitForLoadStateAsync(LoadState.NetworkIdle);
            Log.Information("Refreshed page");
        }

        // ── Dialog handling ──────────────────────────────────────────────────────

        [Given(@"User closes dialog if still present")]
        public async Task GivenUserClosesDialogIfStillPresent()
        {
            var closeBtn = _pw.Page.Locator(
                "button[aria-label='Close'], button[data-id='dialogCloseIconButton']").First;
            if (await closeBtn.IsVisibleAsync())
            {
                await closeBtn.ClickAsync();
                Log.Information("Closed dialog");
            }
        }

        [Given(@"User clicks on '(.*)' button on '(.*)' dialog")]
        public async Task GivenUserClicksOnButtonOnDialog(string buttonName, string dialogTitle)
        {
            var dialog = _pw.Page.Locator(
                $"[aria-label='{dialogTitle}'], div[role='dialog']:has-text('{dialogTitle}')").First;
            await dialog.GetByRole(AriaRole.Button, new() { Name = buttonName }).ClickAsync();
            Log.Information("Clicked '{Button}' on '{Dialog}' dialog", buttonName, dialogTitle);
        }

        [Given(@"User clicks on '(.*)' button element")]
        [Given(@"User clicks on 'OK' button element")]
        public async Task GivenUserClicksOnButtonElement(string buttonName)
        {
            await _pw.Page.GetByRole(AriaRole.Button, new() { Name = buttonName })
                          .First.ClickAsync();
            Log.Information("Clicked button: {Button}", buttonName);
        }
    }
}
