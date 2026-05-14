using BSTVOAQAAutomation.Playwright.Helpers;
using Reqnroll;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Steps.UI
{
    [Binding]
    public class InputFieldSteps
    {
        private readonly PlaywrightHelper _pw;
        private readonly ScenarioContext _scenarioContext;

        public InputFieldSteps(PlaywrightHelper pw, ScenarioContext scenarioContext)
        {
            _pw = pw;
            _scenarioContext = scenarioContext;
        }

        // ── Text input ───────────────────────────────────────────────────────────

        [Given(@"User enter data for '(.*)' field value")]
        public async Task GivenUserEnterDataForFieldValue(string fieldName)
        {
            var testData = GetTestData();
            if (!testData.TryGetValue(fieldName, out var value) || string.IsNullOrEmpty(value))
                return;
            await FillInputField(fieldName, value);
        }

        [Given(@"User enter data for '(.*)' field value only when data not entered")]
        public async Task GivenUserEnterDataForFieldValueOnlyWhenDataNotEntered(string fieldName)
        {
            var field = _pw.Page.Locator($"input[aria-label='{fieldName}'], input[aria-label*='{fieldName}']").First;
            try
            {
                await field.ScrollIntoViewIfNeededAsync();
                var current = await field.InputValueAsync();
                if (!string.IsNullOrEmpty(current))
                {
                    Log.Information("Field '{Field}' already has value '{Val}' — skipping", fieldName, current);
                    return;
                }
            }
            catch { /* field may not be visible yet — fall through to enter */ }
            await GivenUserEnterDataForFieldValue(fieldName);
        }

        // ── Textarea ─────────────────────────────────────────────────────────────

        [Given(@"User enter data for '(.*)' text area field value")]
        public async Task GivenUserEnterDataForTextAreaFieldValue(string fieldName)
        {
            var testData = GetTestData();
            if (!testData.TryGetValue(fieldName, out var value) || string.IsNullOrEmpty(value))
                return;
            var field = _pw.Page.Locator($"textarea[aria-label='{fieldName}'], textarea[aria-label*='{fieldName}']").First;
            await field.ScrollIntoViewIfNeededAsync();
            await field.FillAsync(value);
            Log.Information("Entered '{Value}' in textarea '{Field}'", value, fieldName);
        }

        // ── UPRN / context-driven ─────────────────────────────────────────────────

        [Given(@"User enters data in ""(.*)"" field")]
        public async Task GivenUserEntersDataInField(string fieldName)
        {
            // UPRN value typically comes from DB step stored in scenarioContext
            string value = "";
            if (_scenarioContext.TryGetValue("uprn", out var uprnObj))
                value = uprnObj?.ToString() ?? "";

            if (string.IsNullOrEmpty(value))
            {
                var testData = GetTestData();
                testData.TryGetValue(fieldName, out value!);
            }

            if (string.IsNullOrEmpty(value))
                return;

            await FillInputField(fieldName, value);
        }

        [Given(@"User enter data for '(.*)' field value from '(.*)' for '(.*)'")]
        public async Task GivenUserEnterDataForFieldValueFromFor(string fieldName, string sheetName, string rowId)
        {
            var util = new ExcelTestDataUtility(Config.TestDataExcelFilePath);
            string value = util.GetFieldTestData(fieldName, sheetName, rowId);
            await FillInputField(fieldName, value);
        }

        [Given(@"User enter random number for '(.*)' field value")]
        public async Task GivenUserEnterRandomNumberForFieldValue(string fieldName)
        {
            string value = new Random().Next(100000, 999999).ToString();
            _scenarioContext[fieldName] = value;
            await FillInputField(fieldName, value);
        }

        // ── Helpers ──────────────────────────────────────────────────────────────

        private async Task FillInputField(string fieldName, string value)
        {
            var field = _pw.Page.Locator($"input[aria-label='{fieldName}'], input[aria-label*='{fieldName}']").First;
            await field.ScrollIntoViewIfNeededAsync();
            await field.ClickAsync();
            await _pw.Page.Keyboard.PressAsync("Control+A");
            await field.FillAsync(value);
            Log.Information("Entered '{Value}' in field '{Field}'", value, fieldName);
        }

        private Dictionary<string, string> GetTestData()
        {
            if (_scenarioContext.TryGetValue("testData", out var td) && td is Dictionary<string, string> dict)
                return dict;
            return new Dictionary<string, string>();
        }
    }
}
