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
        [When(@"User select '(.*)' value from '(.*)' dropdown")]
        [Then(@"User select '(.*)' value from '(.*)' dropdown")]
        public async Task GivenUserSelectValueFromDropdown(string value, string fieldName)
        {
            await SelectDropdownValue(fieldName, value);
        }

        [Given(@"User clicks on '(.*)' dropdown and select '(.*)' value")]
        [When(@"User clicks on '(.*)' dropdown and select '(.*)' value")]
        [Then(@"User clicks on '(.*)' dropdown and select '(.*)' value")]
        public async Task GivenUserClicksOnDropdownAndSelectValue(string fieldName, string value)
        {
            await SelectDropdownValue(fieldName, value);
        }

        [Given(@"User selects '(.*)' value for '(.*)' dropdown")]
        [When(@"User selects '(.*)' value for '(.*)' dropdown")]
        [Then(@"User selects '(.*)' value for '(.*)' dropdown")]
        public async Task GivenUserSelectsValueForDropdown(string value, string fieldName)
        {
            await SelectDropdownValue(fieldName, value);
        }

        [Given(@"User selects '(.*)' value for '(.*)' dropdown field")]
        [When(@"User selects '(.*)' value for '(.*)' dropdown field")]
        [Then(@"User selects '(.*)' value for '(.*)' dropdown field")]
        public async Task GivenUserSelectsValueForDropdownField(string value, string fieldName)
        {
            await SelectDropdownValue(fieldName, value);
        }

        // ── Command bar sub-menu ─────────────────────────────────────────────────

        [Given(@"User clicks on '(.*)' under '(.*)'")]
        [When(@"User clicks on '(.*)' under '(.*)'")]
        [Then(@"User clicks on '(.*)' under '(.*)'")]
        public async Task GivenUserClicksOnUnder(string menuOption, string commandBarMenu)
        {
            var menuBtn = _pw.Page.Locator(
                $"button[aria-label='{commandBarMenu}'], " +
                $"li[aria-label='{commandBarMenu}'], " +
                $"[data-id='{commandBarMenu}']").First;
            await menuBtn.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForTimeoutAsync(500);

            var menuItem = _pw.Page.Locator(
                $"button[aria-label='{menuOption}'], " +
                $"li[aria-label='{menuOption}'], " +
                $"[aria-label='{menuOption}'], " +
                $"span:has-text('{menuOption}')").First;
            await menuItem.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked '{Option}' under '{Menu}'", menuOption, commandBarMenu);
        }

        // ── Toggle buttons ───────────────────────────────────────────────────────

        [Given(@"User click on '(.*)' toggle button")]
        [When(@"User click on '(.*)' toggle button")]
        [Then(@"User click on '(.*)' toggle button")]
        public async Task GivenUserClickOnToggleButton(string toggleName)
        {
            var toggle = _pw.Page.Locator(
                $"button[aria-label*='{toggleName}'], " +
                $"[aria-label*='{toggleName}'][role='checkbox'], " +
                $"[title*='{toggleName}']").First;
            await toggle.ScrollIntoViewIfNeededAsync();
            await toggle.EvaluateAsync("el => el.click()");
            Log.Information("Clicked toggle: {Toggle}", toggleName);
        }

        // ── Helpers ──────────────────────────────────────────────────────────────

        private async Task SelectDropdownValue(string fieldName, string value)
        {
            var selectEl = _pw.Page.Locator(
                $"select[aria-label='{fieldName}'], select[aria-label*='{fieldName}']").First;
            if (await selectEl.IsVisibleAsync())
            {
                await selectEl.SelectOptionAsync(new SelectOptionValue { Label = value });
                Log.Information("Selected '{Value}' from select '{Field}'", value, fieldName);
                return;
            }

            var btn = _pw.Page.Locator(
                $"button[aria-label='{fieldName}'], " +
                $"button[aria-label*='{fieldName}'], " +
                $"[data-id*='{fieldName}'] button").First;
            await btn.ScrollIntoViewIfNeededAsync();
            await btn.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForTimeoutAsync(500);

            var option = _pw.Page.Locator(
                $"[role='option']:has-text('{value}'), " +
                $"li:has-text('{value}'), " +
                $"option:has-text('{value}')").First;
            await option.EvaluateAsync("el => el.click()");
            Log.Information("Selected '{Value}' from flyout '{Field}'", value, fieldName);
        }
    }
}
