namespace BSTVOAQAAutomation.Playwright.Helpers
{
    class PropertiesReader
    {
        private readonly Dictionary<string, string> _properties;

        public PropertiesReader(string filePath)
        {
            _properties = new Dictionary<string, string>();

            foreach (var line in File.ReadAllLines(filePath))
            {
                if (line.Trim().Length == 0 || line.StartsWith("#"))
                    continue;

                var separatorIndex = line.IndexOf('=');
                if (separatorIndex > 0)
                {
                    var key   = line.Substring(0, separatorIndex).Trim();
                    var value = line.Substring(separatorIndex + 1).Trim();
                    _properties[key] = value;
                }
            }
        }

        public string? Get(string key) =>
            _properties.TryGetValue(key, out var value) ? value : null;
    }
}
