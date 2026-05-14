using BSTVOAQAAutomation.Playwright.Helpers;
using Microsoft.Playwright;
using Reqnroll;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Steps.UI
{
    [Binding]
    public class SelectFieldSteps
    {
        private readonly PlaywrightHelper _pw;
        private readonly ScenarioContext _scenarioContext;

        public SelectFieldSteps(PlaywrightHelper pw, ScenarioContext scenarioContext)
        {
            _pw = pw;
            _scenarioContext = scenarioContext;
        }

        // ── Dropdown selection ───────────────────────────────────────────────────

        [Given(@"User select '(.*)' value from '(.*)' dropdown")]
        public async Task GivenUserSelectValueFromDropdown(string value, string fieldName)
        {
            await SelectDropdownValue(fieldName, value);
        }

        [Given(@"User clicks on '(.*)' dropdown and select '(.*)' value")]
        public async Task GivenUserClicksOnDropdownAndSelectValue(string fieldName, string value)
        {
            await SelectDropdownValue(fieldName, value);
        }

        [Given(@"User selects '(.*)' value for '(.*)' dropdown")]
        public async Task GivenUserSelectsValueForDropdown(string value, string fieldName)
        {
            await SelectDropdownValue(fieldName, value);
        }

        [Given(@"User selects '(.*)' value for '(.*)' dropdown field")]
        public async Task GivenUserSelectsValueForDropdownField(string value, string fieldName)
        {
            await SelectDropdownValue(fieldName, value);
        }

        // ── Command bar sub-menu ─────────────────────────────────────────────────

        [Given(@"User clicks on '(.*)' under '(.*)'")]
        public async Task GivenUserClicksOnUnder(string menuOption, string commandBarMenu)
        {
            // Open the command bar button (e.g., "Request Action")
            var menuBtn = _pw.Page.Locator(
                $"button[aria-label='{commandBarMenu}'], " +
                $"li[aria-label='{commandBarMenu}'], " +
                $"[data-id='{commandBarMenu}']").First;
            await menuBtn.ClickAsync();
            await _pw.Page.WaitForTimeoutAsync(500);

            // Click the sub-menu option (e.g., "Validate Request")
            var menuItem = _pw.Page.Locator(
                $"button[aria-label='{menuOption}'], " +
                $"li[aria-label='{menuOption}'], " +
                $"[aria-label='{menuOption}'], " +
                $"span:has-text('{menuOption}')").First;
            await menuItem.ClickAsync();
            await _pw.Page.WaitForLoadStateAsync(LoadState.NetworkIdle);
            Log.Information("Clicked '{Option}' under '{Menu}'", menuOption, commandBarMenu);
        }

        // ── Toggle buttons ───────────────────────────────────────────────────────

        [Given(@"User click on '(.*)' toggle button")]
        public async Task GivenUserClickOnToggleButton(string toggleName)
        {
            var toggle = _pw.Page.Locator(
                $"button[aria-label*='{toggleName}'], " +
                $"[aria-label*='{toggleName}'][role='checkbox'], " +
                $"[title*='{toggleName}']").First;
            await toggle.ScrollIntoViewIfNeededAsync();
            await toggle.ClickAsync();
            Log.Information("Clicked toggle: {Toggle}", toggleName);
        }

        // ── Helpers ──────────────────────────────────────────────────────────────

        private async Task SelectDropdownValue(string fieldName, string value)
        {
            // First try a <select> element (option-set in Dynamics)
            var selectEl = _pw.Page.Locator($"select[aria-label='{fieldName}'], select[aria-label*='{fieldName}']").First;
            if (await selectEl.IsVisibleAsync(new() { Timeout = 2000 }))
            {
                await selectEl.SelectOptionAsync(new SelectOptionValue { Label = value });
                Log.Information("Selected '{Value}' from select '{Field}'", value, fieldName);
                return;
            }

            // Fallback: button-based flyout dropdown
            var btn = _pw.Page.Locator(
                $"button[aria-label='{fieldName}'], " +
                $"button[aria-label*='{fieldName}'], " +
                $"[data-id*='{fieldName}'] button").First;
            await btn.ScrollIntoViewIfNeededAsync();
            await btn.ClickAsync();
            await _pw.Page.WaitForTimeoutAsync(500);

            var option = _pw.Page.Locator(
                $"[role='option']:has-text('{value}'), " +
                $"li:has-text('{value}'), " +
                $"option:has-text('{value}')").First;
            await option.ClickAsync();
            Log.Information("Selected '{Value}' from flyout '{Field}'", value, fieldName);
        }
    }
}
