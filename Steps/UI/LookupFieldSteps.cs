using BSTVOAQAAutomation.Playwright.Helpers;
using Microsoft.Playwright;
using Reqnroll;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Steps.UI
{
    [Binding]
    public class LookupFieldSteps
    {
        private readonly PlaywrightHelper _pw;
        private readonly ScenarioContext _scenarioContext;

        public LookupFieldSteps(PlaywrightHelper pw, ScenarioContext scenarioContext)
        {
            _pw = pw;
            _scenarioContext = scenarioContext;
        }

        [Given(@"User looked for '(.*)' field value")]
        [When(@"User looked for '(.*)' field value")]
        [Then(@"User looked for '(.*)' field value")]
        public async Task GivenUserLookedForFieldValue(string fieldName)
        {
            var testData = GetTestData();
            if (!testData.TryGetValue(fieldName, out var value) || string.IsNullOrEmpty(value))
            {
                Log.Warning("No test data for lookup field '{Field}'", fieldName);
                return;
            }
            _scenarioContext[fieldName] = value;
            await FillLookupField(fieldName, value);
        }

        [Given(@"User looked for '(.*)' field value only when data not entered")]
        [When(@"User looked for '(.*)' field value only when data not entered")]
        [Then(@"User looked for '(.*)' field value only when data not entered")]
        public async Task GivenUserLookedForFieldValueOnlyWhenDataNotEntered(string fieldName)
        {
            var input = _pw.Page.Locator(
                $"[data-id*='{fieldName}'] input, " +
                $"input[aria-label*='{fieldName}']").First;
            try
            {
                await input.ScrollIntoViewIfNeededAsync();
                var current = await input.InputValueAsync();
                if (!string.IsNullOrEmpty(current))
                {
                    Log.Information("Lookup '{Field}' already has value '{Val}' — skipping", fieldName, current);
                    return;
                }
            }
            catch { }
            await GivenUserLookedForFieldValue(fieldName);
        }

        [Given(@"User looked for first element '(.*)' field value only when data not entered")]
        [When(@"User looked for first element '(.*)' field value only when data not entered")]
        [Then(@"User looked for first element '(.*)' field value only when data not entered")]
        public async Task GivenUserLookedForFirstElementFieldValueOnlyWhenDataNotEntered(string fieldName)
        {
            var testData = GetTestData();
            if (!testData.TryGetValue(fieldName, out var value) || string.IsNullOrEmpty(value))
                return;

            var input = _pw.Page.Locator(
                $"[data-id*='{fieldName}'] input, " +
                $"input[aria-label*='{fieldName}']").First;
            try
            {
                await input.ScrollIntoViewIfNeededAsync();
                var current = await input.InputValueAsync();
                if (!string.IsNullOrEmpty(current))
                {
                    Log.Information("Lookup '{Field}' already has value — skipping", fieldName);
                    return;
                }
            }
            catch { }

            _scenarioContext[fieldName] = value;
            await FillLookupFieldSelectFirst(fieldName, value);
        }

        [Given(@"User looked for '(.*)' field value from '(.*)' for '(.*)'")]
        [When(@"User looked for '(.*)' field value from '(.*)' for '(.*)'")]
        [Then(@"User looked for '(.*)' field value from '(.*)' for '(.*)'")]
        public async Task GivenUserLookedForFieldValueFromFor(string fieldName, string sheetName, string rowId)
        {
            var util = new ExcelTestDataUtility(Config.TestDataExcelFilePath);
            string value = util.GetFieldTestData(fieldName, sheetName, rowId);
            if (string.IsNullOrEmpty(value))
                return;
            _scenarioContext[fieldName] = value;
            await FillLookupField(fieldName, value);
        }

        [Given(@"User looked for value '(.*)' in '(.*)' field")]
        [When(@"User looked for value '(.*)' in '(.*)' field")]
        [Then(@"User looked for value '(.*)' in '(.*)' field")]
        public async Task GivenUserLookedForValueInField(string value, string fieldName)
        {
            _scenarioContext[fieldName] = value;
            await FillLookupField(fieldName, value);
        }

        // ── Shared lookup helpers ────────────────────────────────────────────────

        internal async Task FillLookupField(string fieldName, string value)
        {
            var input = _pw.Page.Locator(
                $"input[aria-label='{fieldName}'], " +
                $"input[aria-label*='{fieldName} Search'], " +
                $"[data-id*='{fieldName}'] input[role='combobox'], " +
                $"[data-id*='{fieldName}'] input").First;

            await input.ScrollIntoViewIfNeededAsync();
            await input.ClickAsync();
            await _pw.Page.Keyboard.PressAsync("Control+A");
            await input.FillAsync(value);
            await _pw.Page.WaitForTimeoutAsync(1500);

            var suggestion = _pw.Page.Locator(
                $"[aria-label='{value}'], " +
                $"li[role='option']:has-text('{value}'), " +
                $"[data-test='lookup-result']:has-text('{value}'), " +
                $"[role='listbox'] li:has-text('{value}')").First;

            bool clicked = false;
            try
            {
                await suggestion.ClickAsync(new() { Timeout = 5000 });
                clicked = true;
            }
            catch { }

            if (!clicked)
                await _pw.Page.Keyboard.PressAsync("Enter");

            Log.Information("Filled lookup '{Field}' with '{Value}'", fieldName, value);
        }

        internal async Task FillLookupFieldSelectFirst(string fieldName, string value)
        {
            var input = _pw.Page.Locator(
                $"input[aria-label='{fieldName}'], " +
                $"[data-id*='{fieldName}'] input").First;

            await input.ScrollIntoViewIfNeededAsync();
            await input.ClickAsync();
            await input.FillAsync(value);
            await _pw.Page.WaitForTimeoutAsync(1500);
            await _pw.Page.Keyboard.PressAsync("Enter");
            Log.Information("Filled lookup '{Field}' with first result for '{Value}'", fieldName, value);
        }

        private Dictionary<string, string> GetTestData()
        {
            if (_scenarioContext.TryGetValue("testData", out var td) && td is Dictionary<string, string> dict)
                return dict;
            return new Dictionary<string, string>();
        }
    }
}
