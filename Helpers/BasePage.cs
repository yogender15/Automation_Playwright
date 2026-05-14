using Microsoft.Playwright;

namespace BSTVOAQAAutomation.Playwright.Helpers
{
    /// <summary>
    /// Base class for all Playwright page objects.
    /// Each page object receives IPage via constructor — no static driver.
    /// </summary>
    public abstract class BasePage
    {
        protected readonly IPage _page;

        protected BasePage(IPage page)
        {
            _page = page;
        }

        // Common locator helpers used across all page objects

        protected ILocator GetByAriaLabel(string label) =>
            _page.Locator($"[aria-label='{label}']");

        protected ILocator GetByDataId(string dataId) =>
            _page.Locator($"[data-id='{dataId}']");

        protected ILocator GetButton(string name) =>
            _page.GetByRole(AriaRole.Button, new() { Name = name });

        protected ILocator GetByText(string text) =>
            _page.GetByText(text, new() { Exact = true });

        protected async Task WaitForPageReadyAsync()
        {
            await _page.WaitForLoadStateAsync(LoadState.DOMContentLoaded);
            await _page.WaitForLoadStateAsync(LoadState.NetworkIdle);
        }

        protected async Task ClickAndWaitAsync(ILocator locator)
        {
            await locator.ClickAsync();
            await WaitForPageReadyAsync();
        }
    }
}
