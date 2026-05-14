using OfficeOpenXml;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    class ExcelTestDataUtility
    {
        private readonly string filePath;

        public ExcelTestDataUtility(string filePath)
        {
            this.filePath = filePath;
        }

        public Dictionary<string, string> GetTestDataByID(string sheetName, string testCaseID)
        {
            var testData = new Dictionary<string, string>();

            var resolvedPath = Path.GetFullPath(filePath);
            if (!File.Exists(resolvedPath))
                throw new FileNotFoundException(
                    $"TestData.xlsx not found at: {resolvedPath}");

            using var package = new ExcelPackage(new FileInfo(resolvedPath));
            var worksheet = package.Workbook.Worksheets[sheetName];

            if (worksheet == null)
            {
                var available = string.Join(", ",
                    package.Workbook.Worksheets.Select(w => w.Name));
                throw new InvalidOperationException(
                    $"Sheet '{sheetName}' not found in '{resolvedPath}'. " +
                    $"Available sheets: [{available}]");
            }

            if (worksheet.Dimension == null)
                throw new InvalidOperationException(
                    $"Sheet '{sheetName}' in '{resolvedPath}' is empty.");

            var headers = GetHeaders(worksheet);
            var row = FindRowByColumnValue(worksheet, headers, "TestDataID", testCaseID);

            int col = 0;
            foreach (var header in headers)
            {
                col++;
                if (string.IsNullOrWhiteSpace(header)) continue;
                if (testData.ContainsKey(header)) continue;
                testData.Add(header, worksheet.Cells[row, col].Value?.ToString()!);
            }

            return testData;
        }

        public string GetFieldTestData(string fieldName, string sheetName, string testCaseID)
        {
            var data = GetTestDataByID(sheetName, testCaseID);
            return data[fieldName];
        }

        private List<string?> GetHeaders(ExcelWorksheet worksheet)
        {
            var headers = new List<string?>();
            for (int i = 1; i <= worksheet.Dimension.End.Column; i++)
                headers.Add(worksheet.Cells[1, i].Value?.ToString());
            return headers;
        }

        private int FindRowByColumnValue(ExcelWorksheet worksheet, List<string?> headers,
            string columnName, string value)
        {
            var columnIndex = headers.IndexOf(columnName) + 1;
            for (int i = 2; i <= worksheet.Dimension.End.Row; i++)
            {
                if (worksheet.Cells[i, columnIndex].Value?.ToString()?.Trim() == value?.Trim())
                    return i;
            }
            throw new InvalidOperationException($"No row found with {columnName} = {value}");
        }
    }
}
