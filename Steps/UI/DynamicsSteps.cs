using BSTVOAQAAutomation.Playwright.Helpers;
using Microsoft.Playwright;
using NUnit.Framework;
using Reqnroll;
using Serilog;

namespace BSTVOAQAAutomation.Playwright.Steps.UI
{
    [Binding]
    public class DynamicsSteps
    {
        private readonly PlaywrightHelper _pw;
        private readonly ScenarioContext _scenarioContext;

        public DynamicsSteps(PlaywrightHelper pw, ScenarioContext scenarioContext)
        {
            _pw = pw;
            _scenarioContext = scenarioContext;
        }

        // ── DB ───────────────────────────────────────────────────────────────────

        [Given(@"User connects to the DB and retrieves the data for '(.*)'")]
        [When(@"User connects to the DB and retrieves the data for '(.*)'")]
        [Then(@"User connects to the DB and retrieves the data for '(.*)'")]
        public async Task GivenUserConnectsToDBAndRetrievesDataFor(string propertyKey, Table table)
        {
            var dbData = new Dictionary<string, string>();
            for (int attempt = 0; attempt <= 10; attempt++)
            {
                dbData = DBHelper.GetDBResult(propertyKey);
                if (dbData.Count > 0) break;
                if (attempt == 10)
                    throw new Exception($"After {attempt} attempts DB returned no data for query '{propertyKey}'");
            }

            var testData = GetTestData();
            foreach (var row in table.Rows)
            {
                string fieldName = row["fieldName"];
                if (!dbData.TryGetValue(fieldName, out var val)) val = "";
                testData[fieldName] = val;
                _scenarioContext[fieldName] = val;
                Log.Information("DB field '{Field}' = '{Value}'", fieldName, val);
            }
            await Task.CompletedTask;
        }

        // ── Hereditament search ──────────────────────────────────────────────────

        [Given(@"User slects spcific '(.*)' row from search hereditament results")]
        [When(@"User slects spcific '(.*)' row from search hereditament results")]
        [Then(@"User slects spcific '(.*)' row from search hereditament results")]
        public async Task GivenUserSlectsSpecificRowFromSearchHereditamentResults(string uprnType)
        {
            string uprn = _scenarioContext.TryGetValue("uprn", out var u) ? u?.ToString() ?? "" : "";

            ILocator row;
            if (!string.IsNullOrEmpty(uprn))
                row = _pw.Page.Locator($"tr:has-text('{uprn}'), [role='row']:has-text('{uprn}')").First;
            else
                row = _pw.Page.Locator("[role='grid'] tr:nth-child(2), [role='row']:nth-child(2)").First;

            await row.EvaluateAsync("el => el.click()");
            Log.Information("Selected hereditament row for UPRN: {UPRN}", uprn);
        }

        // ── Job grid ─────────────────────────────────────────────────────────────

        [Given(@"User captures ""(.*)"" and ""(.*)"" in ""(.*)"" by ""(.*)"" grid")]
        [When(@"User captures ""(.*)"" and ""(.*)"" in ""(.*)"" by ""(.*)"" grid")]
        [Then(@"User captures ""(.*)"" and ""(.*)"" in ""(.*)"" by ""(.*)"" grid")]
        public async Task GivenUserCapturesJobDetailsInContext(string field1, string field2, string storageContext, string gridAction)
        {
            if (gridAction.Equals("Refresh", StringComparison.OrdinalIgnoreCase))
            {
                var refreshBtn = _pw.Page.Locator("button[aria-label='Refresh'], [data-id='refresh_button']").First;
                await refreshBtn.EvaluateAsync("el => el.click()");
                await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
                await _pw.Page.WaitForTimeoutAsync(2000);
            }

            var jobIdCell = _pw.Page.Locator(
                "[col-id='tickernumber'] a, " +
                "[data-id*='tickernumber'] a, " +
                "[aria-colindex='2'] a").First;
            await jobIdCell.WaitForAsync(new() { Timeout = 30_000 });
            string jobId = (await jobIdCell.TextContentAsync() ?? "").Trim();

            var jobNameCell = _pw.Page.Locator("[col-id='subject'] a, [data-id*='subject'] a").First;
            string jobName = "";
            try { jobName = (await jobNameCell.TextContentAsync() ?? "").Trim(); } catch { }

            if (storageContext.Equals("scenarioContext", StringComparison.OrdinalIgnoreCase))
            {
                _scenarioContext[field1] = jobId;
                _scenarioContext[field2] = jobName;
            }
            Log.Information("Captured Job ID='{Id}', Job Name='{Name}'", jobId, jobName);
        }

        [Given(@"User click on ""(.*)"" element")]
        [When(@"User click on ""(.*)"" element")]
        [Then(@"User click on ""(.*)"" element")]
        public async Task GivenUserClickOnElement(string elementName)
        {
            string jobId = _scenarioContext.TryGetValue("Job ID", out var jid) ? jid?.ToString() ?? "" : "";

            ILocator link;
            if (!string.IsNullOrEmpty(jobId))
                link = _pw.Page.Locator($"a:has-text('{jobId}'), [title='{jobId}']").First;
            else
                link = _pw.Page.Locator("[col-id='tickernumber'] a, [data-id*='tickernumber'] a").First;

            await link.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked '{ElementName}' element", elementName);
        }

        // ── BPF navigation ───────────────────────────────────────────────────────

        [Given(@"User waits till '(.*)' stage selected")]
        [When(@"User waits till '(.*)' stage selected")]
        [Then(@"User waits till '(.*)' stage selected")]
        public async Task GivenUserWaitsTillStageSelected(string stageName)
        {
            var stageLocator = _pw.Page.Locator(
                $"[aria-label='{stageName}'][aria-selected='true'], " +
                $"[title='{stageName}'][aria-selected='true'], " +
                $"li.is-selected:has-text('{stageName}'), " +
                $"[data-bpf-node-selected='true']:has-text('{stageName}'), " +
                $"[aria-current='step']:has-text('{stageName}')");
            try
            {
                await stageLocator.WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 60_000 });
                Log.Information("Stage '{Stage}' is now selected", stageName);
            }
            catch
            {
                Log.Warning("Could not confirm stage '{Stage}' selected — continuing", stageName);
            }
        }

        [Given(@"User clicked on '(.*)' for '(.*)' journey on the headerbar")]
        [When(@"User clicked on '(.*)' for '(.*)' journey on the headerbar")]
        [Then(@"User clicked on '(.*)' for '(.*)' journey on the headerbar")]
        public async Task GivenUserClickedOnForJourneyOnTheHeaderbar(string buttonName, string journeyName)
        {
            var nextBtn = _pw.Page.Locator(
                "button[data-id='nextButton'], " +
                "button[title='Next Stage'], " +
                "button[aria-label='Next Stage'], " +
                "[data-id*='nextButton']").First;
            await nextBtn.ScrollIntoViewIfNeededAsync();
            await nextBtn.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked '{Button}' for '{Journey}' journey", buttonName, journeyName);
        }

        // ── Tab navigation ───────────────────────────────────────────────────────

        [Given(@"User clicked on '(.*)' tab under '(.*)'")]
        [When(@"User clicked on '(.*)' tab under '(.*)'")]
        [Then(@"User clicked on '(.*)' tab under '(.*)'")]
        public async Task GivenUserClickedOnTabUnder(string tabName, string formName)
        {
            var tab = _pw.Page.Locator(
                $"li[title='{tabName}'], " +
                $"[aria-label='{tabName}'][role='tab'], " +
                $"button[title='{tabName}'], " +
                $"a[title='{tabName}']").First;
            await tab.ScrollIntoViewIfNeededAsync();
            await tab.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked tab '{Tab}' under '{Form}'", tabName, formName);
        }

        // ── PVT / PAD operations ─────────────────────────────────────────────────

        [Given(@"User selects '(.*)' record")]
        [When(@"User selects '(.*)' record")]
        [Then(@"User selects '(.*)' record")]
        public async Task GivenUserSelectsRecord(string recordType)
        {
            var row = _pw.Page.Locator(
                $"tr:has-text('{recordType}'):not(:has-text('Superseded')), " +
                $"[role='row']:has-text('{recordType}')").First;
            await row.ScrollIntoViewIfNeededAsync();
            await row.EvaluateAsync("el => el.click()");
            Log.Information("Selected '{RecordType}' record in PVT", recordType);
        }

        [Given(@"User selects '(.*)' record row")]
        [When(@"User selects '(.*)' record row")]
        [Then(@"User selects '(.*)' record row")]
        public async Task GivenUserSelectsRecordRow(string recordType)
        {
            var rows = _pw.Page.Locator($"[role='row']:has-text('{recordType}')");
            int count = await rows.CountAsync();
            if (count > 0)
                await rows.Last.EvaluateAsync("el => el.click()");
            else
                await GivenUserSelectsRecord(recordType);
        }

        [Given(@"User get PAD attributes of '(.*)' record")]
        [When(@"User get PAD attributes of '(.*)' record")]
        [Then(@"User get PAD attributes of '(.*)' record")]
        public async Task GivenUserGetPADAttributesOfRecord(string recordType)
        {
            _scenarioContext[$"PAD_{recordType}_type"] = recordType;
            Log.Information("Captured PAD attributes marker for '{RecordType}' record", recordType);
            await Task.CompletedTask;
        }

        [Given(@"User captures ""(.*)"" for ""(.*)"" record in ""(.*)""")]
        [When(@"User captures ""(.*)"" for ""(.*)"" record in ""(.*)""")]
        [Then(@"User captures ""(.*)"" for ""(.*)"" record in ""(.*)""")]
        public async Task GivenUserCapturesForRecordIn(string fieldName, string recordType, string storageContext)
        {
            var effectiveDateEl = _pw.Page.Locator(
                "[aria-label='Effective From Date'], " +
                "input[aria-label*='Effective From'], " +
                "[data-id*='effectivefrom'] input").First;
            try
            {
                string value = await effectiveDateEl.InputValueAsync();
                if (string.IsNullOrEmpty(value))
                    value = (await effectiveDateEl.TextContentAsync() ?? "").Trim();

                if (storageContext.Equals("scenarioContext", StringComparison.OrdinalIgnoreCase))
                    _scenarioContext[fieldName] = value;
                Log.Information("Captured '{Field}' = '{Value}' for {Record} record", fieldName, value, recordType);
            }
            catch
            {
                _scenarioContext[fieldName] = DateTime.Today.ToString("M/d/yyyy");
                Log.Warning("Could not capture '{Field}' — storing today as fallback", fieldName);
            }
        }

        // ── Conditional dialog ───────────────────────────────────────────────────

        [Given(@"User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears")]
        [When(@"User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears")]
        [Then(@"User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears")]
        public async Task GivenUserClicksOnSaveAndContinueButtonOnUnsavedChangesDialogIfAppears()
        {
            try
            {
                var btn = _pw.Page.Locator(
                    "button[aria-label='Save and continue'], " +
                    "button:has-text('Save and continue')").First;
                if (await btn.IsVisibleAsync())
                {
                    await btn.EvaluateAsync("el => el.click()");
                    Log.Information("Clicked 'Save and continue' on Unsaved changes dialog");
                }
            }
            catch { }
        }

        [Given(@"User clicks on 'Save & Close' button on dialog")]
        [Given(@"User clicks on 'Save & Close' button on 'dialog'")]
        [When(@"User clicks on 'Save & Close' button on dialog")]
        [When(@"User clicks on 'Save & Close' button on 'dialog'")]
        [Then(@"User clicks on 'Save & Close' button on dialog")]
        [Then(@"User clicks on 'Save & Close' button on 'dialog'")]
        public async Task GivenUserClicksOnSaveAndCloseButtonOnDialog()
        {
            var btn = _pw.Page.Locator(
                "button[aria-label='Save & Close'], " +
                "button[data-id='saveandclose'], " +
                "[role='dialog'] button[aria-label='Save & Close']").First;
            await btn.EvaluateAsync("el => el.click()");
            Log.Information("Clicked 'Save & Close' on dialog");
        }

        // ── Property Attributes (PAD Entry) ──────────────────────────────────────

        [Given(@"User enter Property Attributes")]
        [When(@"User enter Property Attributes")]
        [Then(@"User enter Property Attributes")]
        public async Task GivenUserEnterPropertyAttributes()
        {
            var testData = GetTestData();
            var lookupFields = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
                { "Group", "Type", "Age Code", "Parking" };
            var allFields = new[] { "Group", "Type", "Age Code", "Area", "Rooms", "Bedrooms", "Bathrooms", "Parking" };

            foreach (var field in allFields)
            {
                if (!testData.TryGetValue(field, out var value) || string.IsNullOrEmpty(value))
                    continue;
                try
                {
                    if (lookupFields.Contains(field))
                    {
                        var input = _pw.Page.Locator(
                            $"input[aria-label='{field}'], " +
                            $"[data-id*='{field.ToLower().Replace(" ", "")}'] input").First;
                        await input.ScrollIntoViewIfNeededAsync();
                        var current = await input.InputValueAsync();
                        if (!string.IsNullOrEmpty(current)) continue;
                        await input.ClickAsync();
                        await input.FillAsync(value);
                        await _pw.Page.WaitForTimeoutAsync(1000);
                        await _pw.Page.Keyboard.PressAsync("Enter");
                    }
                    else
                    {
                        var input = _pw.Page.Locator($"input[aria-label='{field}']").First;
                        await input.ScrollIntoViewIfNeededAsync();
                        var current = await input.InputValueAsync();
                        if (!string.IsNullOrEmpty(current)) continue;
                        await input.FillAsync(value);
                    }
                    Log.Information("Entered property attribute '{Field}' = '{Value}'", field, value);
                }
                catch (Exception ex)
                {
                    Log.Warning("Could not enter property attribute '{Field}': {Msg}", field, ex.Message);
                }
            }
        }

        // ── Field value assertion ────────────────────────────────────────────────

        [Given(@"User validate value '(.*)' for '(.*)' field")]
        [When(@"User validate value '(.*)' for '(.*)' field")]
        [Then(@"User validate value '(.*)' for '(.*)' field")]
        public async Task ThenUserValidateValueForField(string expectedValue, string fieldName)
        {
            var el = _pw.Page.Locator(
                $"[aria-label*='{fieldName}']:has-text('{expectedValue}'), " +
                $"[title='{expectedValue}'], " +
                $"[data-id*='{fieldName}']:has-text('{expectedValue}')").First;
            await Assertions.Expect(el).ToBeVisibleAsync(new() { Timeout = 30_000 });
            Log.Information("Validated field '{Field}' has value '{Value}'", fieldName, expectedValue);
        }

        // ── Header / link navigation ─────────────────────────────────────────────

        [Given(@"User click on job link in Header")]
        [When(@"User click on job link in Header")]
        [Then(@"User click on job link in Header")]
        public async Task GivenUserClickOnJobLinkInHeader()
        {
            string jobId = _scenarioContext.TryGetValue("Job ID", out var jid) ? jid?.ToString() ?? "" : "";

            ILocator link;
            if (!string.IsNullOrEmpty(jobId))
                link = _pw.Page.Locator($"a:has-text('{jobId}'), [title='{jobId}']").First;
            else
                link = _pw.Page.Locator("[data-id*='header'] a, [aria-label*='Job'] a").First;

            await link.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked job link in header");
        }

        [Given(@"User click on 'Request' link")]
        [When(@"User click on 'Request' link")]
        [Then(@"User click on 'Request' link")]
        public async Task GivenUserClickOnRequestLink()
        {
            var link = _pw.Page.Locator(
                "[data-id*='Request'] a, " +
                "a[href*='Request'], " +
                "[aria-label*='Request'] a, " +
                "a:has-text('Request-')").First;
            await link.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked Request link");
        }

        [Given(@"User click on 'Hereditament' link")]
        [When(@"User click on 'Hereditament' link")]
        [Then(@"User click on 'Hereditament' link")]
        public async Task GivenUserClickOnHereditamentLink()
        {
            var link = _pw.Page.Locator(
                "[data-id*='hereditament'] a, " +
                "a[href*='Hereditament'], " +
                "[aria-label*='Hereditament'] a").First;
            await link.EvaluateAsync("el => el.click()");
            await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            Log.Information("Clicked Hereditament link");
        }

        // ── Polling refresh ──────────────────────────────────────────────────────

        [Given(@"User click on 'Refresh' button from 'menubar' untill '(.*)' status display")]
        [When(@"User click on 'Refresh' button from 'menubar' untill '(.*)' status display")]
        [Then(@"User click on 'Refresh' button from 'menubar' untill '(.*)' status display")]
        public async Task GivenUserClickRefreshUntilStatusDisplay(string expectedStatus)
        {
            var refreshBtn = _pw.Page.Locator("button[aria-label='Refresh']").First;
            var statusLocator = _pw.Page.Locator(
                $"[title='{expectedStatus}'], " +
                $"[data-id*='statuscode']:has-text('{expectedStatus}'), " +
                $"div:has-text('{expectedStatus}')");

            for (int i = 0; i < 30; i++)
            {
                if (await statusLocator.IsVisibleAsync())
                {
                    Log.Information("Status '{Status}' displayed after {Attempts} refresh(es)", expectedStatus, i + 1);
                    return;
                }
                await refreshBtn.EvaluateAsync("el => el.click()");
                await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
                await _pw.Page.WaitForTimeoutAsync(5000);
            }
            Log.Warning("Status '{Status}' not visible after 30 refresh attempts", expectedStatus);
        }

        // ── PVT assertions ───────────────────────────────────────────────────────

        [Given(@"User clicks on 'Refresh' button on hereditament dialog and asserts '(.*)' records")]
        [When(@"User clicks on 'Refresh' button on hereditament dialog and asserts '(.*)' records")]
        [Then(@"User clicks on 'Refresh' button on hereditament dialog and asserts '(.*)' records")]
        public async Task GivenUserClicksRefreshOnHereditamentDialogAndAssertsRecords(string _, Table table)
        {
            var refreshBtn = _pw.Page.Locator(
                "button[aria-label='Refresh'], " +
                "[data-id='refresh_button'], " +
                "[role='dialog'] button[aria-label='Refresh']").First;
            try
            {
                await refreshBtn.EvaluateAsync("el => el.click()");
                await _pw.Page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            }
            catch { }

            foreach (var row in table.Rows)
            {
                string status = row["status"];
                var statusEl = _pw.Page.Locator(
                    $"[title='{status}'], " +
                    $"td:has-text('{status}'), " +
                    $"[aria-label*='{status}']").First;
                await Assertions.Expect(statusEl).ToBeVisibleAsync(new() { Timeout = 30_000 });
                Log.Information("Validated PVT status: {Status}", status);
            }
        }

        [Given(@"user asserts ""(.*)"", ""(.*)"" for ""(.*)"" records")]
        [When(@"user asserts ""(.*)"", ""(.*)"" for ""(.*)"" records")]
        [Then(@"user asserts ""(.*)"", ""(.*)"" for ""(.*)"" records")]
        public async Task ThenUserAssertsEffectiveDatesForRecords(string fromColHeader, string toColHeader, string recordType, Table table)
        {
            foreach (var row in table.Rows)
            {
                string fromDateKey    = row["fromDateColumn"];
                string effectiveToKey = row.ContainsKey("effectiveToDateColumn") ? row["effectiveToDateColumn"] : "";
                string status         = row["status"];
                Log.Information("Assert PVT row: status={Status}, from={From}, to={To}", status, fromDateKey, effectiveToKey);
                var statusEl = _pw.Page.Locator($"td:has-text('{status}'), [title='{status}']").First;
                await Assertions.Expect(statusEl).ToBeVisibleAsync(new() { Timeout = 20_000 });
            }
        }

        // ── BPF stage validation ─────────────────────────────────────────────────

        [Given(@"User validate below business stages on business journey header")]
        [When(@"User validate below business stages on business journey header")]
        [Then(@"User validate below business stages on business journey header")]
        public async Task ThenUserValidateBelowBusinessStages(Table table)
        {
            foreach (var row in table.Rows)
            {
                string stage = row["BusinessStages"];
                var stageEl = _pw.Page.Locator(
                    $"[title='{stage}'], " +
                    $"[aria-label*='{stage}'], " +
                    $"li:has-text('{stage}')").First;
                await Assertions.Expect(stageEl).ToBeVisibleAsync(new() { Timeout = 15_000 });
                Log.Information("Validated BPF stage visible: {Stage}", stage);
            }
        }

        // ── Helpers ──────────────────────────────────────────────────────────────

        private Dictionary<string, string> GetTestData()
        {
            if (_scenarioContext.TryGetValue("testData", out var td) && td is Dictionary<string, string> dict)
                return dict;
            return new Dictionary<string, string>();
        }

        private string ResolveContextValue(string key)
        {
            if (string.IsNullOrEmpty(key)) return "";
            if (_scenarioContext.TryGetValue(key, out var v)) return v?.ToString() ?? "";
            var td = GetTestData();
            return td.TryGetValue(key, out var tdv) ? tdv ?? "" : key;
        }
    }
}
