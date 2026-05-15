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
            // 1 — Standard HTML <select> (Dynamics option-set fields)
            var selectEl = _pw.Page.Locator(
                $"select[aria-label='{fieldName}'], " +
                $"select[aria-label*='{fieldName}'], " +
                $"select[title*='{fieldName}']").First;
            if (await selectEl.IsVisibleAsync())
            {
                await selectEl.SelectOptionAsync(new SelectOptionValue { Label = value });
                Log.Information("Selected '{Value}' from <select> '{Field}'", value, fieldName);
                return;
            }

            // 2 — Fluent UI ms-Dropdown (e.g. "Search By" in Find Hereditament dialog).
            //     These are div/button triggers, NOT aria-label-based. Find the trigger by:
            //     a) direct aria-label match
            //     b) role=listbox / role=combobox with label contains
            //     c) a div with ms-Dropdown class that is adjacent to a label containing the text
            var trigger = _pw.Page.Locator(
                $"[aria-label='{fieldName}'], " +
                $"[aria-label*='{fieldName}'][role='listbox'], " +
                $"[aria-label*='{fieldName}'][role='combobox'], " +
                $"div[class*='ms-Dropdown'][role='listbox']:near(label:has-text('{fieldName}')), " +
                $"button[aria-label*='{fieldName}'], " +
                $"[data-id*='{fieldName.ToLower().Replace(" ", "")}'] button").First;

            await trigger.ScrollIntoViewIfNeededAsync();
            await trigger.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForTimeoutAsync(600);

            // 3 — Click the option in the opened callout / listbox
            var option = _pw.Page.Locator(
                $"[role='option']:has-text('{value}'), " +
                $"[role='listbox'] button:has-text('{value}'), " +
                $"[class*='ms-Dropdown-item']:has-text('{value}'), " +
                $"li:has-text('{value}')").First;
            await option.EvaluateAsync("el => el.click()");
            Log.Information("Selected '{Value}' from Fluent UI dropdown '{Field}'", value, fieldName);
        }
    }
}
