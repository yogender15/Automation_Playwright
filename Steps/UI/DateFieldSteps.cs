using BSTVOAQAAutomation.Playwright.Helpers;
using Microsoft.Playwright;
using Reqnroll;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Steps.UI
{
    [Binding]
    public class DateFieldSteps
    {
        private readonly PlaywrightHelper _pw;
        private readonly ScenarioContext _scenarioContext;

        public DateFieldSteps(PlaywrightHelper pw, ScenarioContext scenarioContext)
        {
            _pw = pw;
            _scenarioContext = scenarioContext;
        }

        [Given(@"User entered (.*) days before date for '(.*)' field value")]
        [When(@"User entered (.*) days before date for '(.*)' field value")]
        [Then(@"User entered (.*) days before date for '(.*)' field value")]
        public async Task GivenUserEnteredDaysBeforeDateForFieldValue(int days, string fieldName)
        {
            var date = DateTime.Today.AddDays(-days).ToString("M/d/yyyy");
            _scenarioContext[fieldName] = date;
            await EnterDateInField(fieldName, date);
        }

        [Given(@"User entered (.*) days after date for '(.*)' field value")]
        [When(@"User entered (.*) days after date for '(.*)' field value")]
        [Then(@"User entered (.*) days after date for '(.*)' field value")]
        public async Task GivenUserEnteredDaysAfterDateForFieldValue(int days, string fieldName)
        {
            var date = DateTime.Today.AddDays(days).ToString("M/d/yyyy");
            _scenarioContext[fieldName] = date;
            await EnterDateInField(fieldName, date);
        }

        [Given(@"User entered data for '(.*)' field value on dialog")]
        [When(@"User entered data for '(.*)' field value on dialog")]
        [Then(@"User entered data for '(.*)' field value on dialog")]
        public async Task GivenUserEnteredDataForFieldValueOnDialog(string fieldName)
        {
            var testData = GetTestData();
            if (!testData.TryGetValue(fieldName, out var value) || string.IsNullOrEmpty(value))
                return;
            _scenarioContext[fieldName] = value;
            await EnterDateInField(fieldName, value);
        }

        [Given(@"User entered (.*) days before date from calender for '(.*)' field value on '(.*)'")]
        [When(@"User entered (.*) days before date from calender for '(.*)' field value on '(.*)'")]
        [Then(@"User entered (.*) days before date from calender for '(.*)' field value on '(.*)'")]
        public async Task GivenUserEnteredDaysBeforeDateFromCalenderForFieldValueOn(int days, string fieldName, string roleType)
        {
            var date = DateTime.Today.AddDays(-days).ToString("M/d/yyyy");
            _scenarioContext[fieldName] = date;
            await EnterDateInField(fieldName, date, roleType);
        }

        [Given(@"User entered (.*) days before date for '(.*)' field value on '(.*)'")]
        [When(@"User entered (.*) days before date for '(.*)' field value on '(.*)'")]
        [Then(@"User entered (.*) days before date for '(.*)' field value on '(.*)'")]
        public async Task GivenUserEnteredDaysBeforeDateForFieldValueOn(int days, string fieldName, string roleType)
        {
            var date = DateTime.Today.AddDays(-days).ToString("M/d/yyyy");
            _scenarioContext[fieldName] = date;
            await EnterDateInField(fieldName, date, roleType);
        }

        [Given(@"User entered (.*) days after date for '(.*)' field value on '(.*)'")]
        [When(@"User entered (.*) days after date for '(.*)' field value on '(.*)'")]
        [Then(@"User entered (.*) days after date for '(.*)' field value on '(.*)'")]
        public async Task GivenUserEnteredDaysAfterDateForFieldValueOn(int days, string fieldName, string roleType)
        {
            var date = DateTime.Today.AddDays(days).ToString("M/d/yyyy");
            _scenarioContext[fieldName] = date;
            await EnterDateInField(fieldName, date, roleType);
        }

        [Given(@"User entered date for '(.*)' field value")]
        [When(@"User entered date for '(.*)' field value")]
        [Then(@"User entered date for '(.*)' field value")]
        public async Task GivenUserEnteredDateForFieldValue(string fieldName)
        {
            var testData = GetTestData();
            if (!testData.TryGetValue(fieldName, out var value) || string.IsNullOrEmpty(value))
                return;
            _scenarioContext[fieldName] = value;
            await EnterDateInField(fieldName, value);
        }

        [Given(@"User entered (.*) days before date for '(.*)' field value in (.*) position")]
        [When(@"User entered (.*) days before date for '(.*)' field value in (.*) position")]
        [Then(@"User entered (.*) days before date for '(.*)' field value in (.*) position")]
        public async Task GivenUserEnteredDaysBeforeDateForFieldValueInPosition(int days, string fieldName, int position)
        {
            var date = DateTime.Today.AddDays(-days).ToString("M/d/yyyy");
            _scenarioContext[fieldName] = date;
            await EnterDateInField(fieldName, date, position: position);
        }

        // ── Helpers ─────────────────────────────────────────────────────────────

        private async Task EnterDateInField(string fieldName, string date, string? roleContext = null, int position = 1)
        {
            ILocator field;
            if (roleContext is not null)
                field = _pw.Page.Locator($"[role='{roleContext}'] input[aria-label*='{fieldName}'], input[aria-label='{fieldName}']").Nth(position - 1);
            else
                field = _pw.Page.Locator($"input[aria-label='{fieldName}'], input[aria-label*='{fieldName}']").Nth(position - 1);

            await field.ScrollIntoViewIfNeededAsync();
            await field.ClickAsync();
            await _pw.Page.Keyboard.PressAsync("Control+A");
            await field.FillAsync(date);
            await _pw.Page.Keyboard.PressAsync("Tab");
            Log.Information("Entered date '{Date}' in field '{Field}'", date, fieldName);
        }

        private Dictionary<string, string> GetTestData()
        {
            if (_scenarioContext.TryGetValue("testData", out var td) && td is Dictionary<string, string> dict)
                return dict;
            return new Dictionary<string, string>();
        }
    }
}
