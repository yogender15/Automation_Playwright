using Npgsql;
using Serilog;
using System.Diagnostics;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    static class DBHelper
    {
        public static Dictionary<string, string> GetDBResult(string queryKey)
        {
            string propertiesFilePath = Path.GetFullPath(
                Path.Combine(AppDomain.CurrentDomain.BaseDirectory, Config.SQLQueryPropertiesFilePath));

            if (!File.Exists(propertiesFilePath))
                throw new FileNotFoundException($"SQL queries file not found: {propertiesFilePath}");

            var reader = new PropertiesReader(propertiesFilePath);
            string? query = reader.Get(queryKey);
            if (query == null)
                throw new KeyNotFoundException($"Query key '{queryKey}' not found in SQL properties file.");

            Log.Information("Executing DB query for key: {Key}", queryKey);
            return ExecuteQuery(query);
        }

        private static Dictionary<string, string> ExecuteQuery(string query)
        {
            var result = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
            string accessToken = GetAzureAccessToken();
            string userId = "RES-PVDB_DB_User_T1_Test-US";
            string connStr = $"Server={Config.DBServer};Port={Config.DBPort};User Id={userId};Password={accessToken};Database={Config.DBName};";

            using var conn = new NpgsqlConnection(connStr);
            try
            {
                conn.Open();
                using var cmd = new NpgsqlCommand(query, conn);
                using var dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    for (int i = 0; i < dr.FieldCount; i++)
                        result[dr.GetName(i)] = dr.IsDBNull(i) ? "" : dr.GetValue(i)?.ToString() ?? "";
                }
            }
            catch (Exception ex)
            {
                Log.Error("DB query failed: {Msg}", ex.Message);
                throw;
            }
            return result;
        }

        private static string GetAzureAccessToken()
        {
            try
            {
                var process = new Process
                {
                    StartInfo = new ProcessStartInfo
                    {
                        FileName = "cmd.exe",
                        Arguments = "/c az account get-access-token --resource https://ossrdbms-aad.database.windows.net --query \"[accessToken]\" -o tsv",
                        RedirectStandardOutput = true,
                        RedirectStandardError = true,
                        UseShellExecute = false,
                        CreateNoWindow = true
                    }
                };
                process.Start();
                string token = process.StandardOutput.ReadToEnd().Trim();
                process.WaitForExit();
                Log.Information("Azure DB access token acquired (length: {Len})", token.Length);
                return token;
            }
            catch (Exception ex)
            {
                Log.Error("Failed to get Azure access token: {Msg}", ex.Message);
                throw;
            }
        }
    }
}
