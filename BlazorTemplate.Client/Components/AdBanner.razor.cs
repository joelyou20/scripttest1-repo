using Microsoft.AspNetCore.Components;

namespace BlazorTemplate.Client.Components
{
    public partial class AdBanner
    {
        [Parameter] public string Slot { get; set; } = string.Empty;
        [Parameter] public string Style { get; set; } = string.Empty;
        [Parameter] public string Adsformat { get; set; } = "auto";

        private RenderFragment Ads { get
            {
                return new RenderFragment(b =>
                {
                    b.OpenElement(0, "ins");
                    b.AddMultipleAttributes(1, new List<KeyValuePair<string, object>>()
                {
                    new KeyValuePair<string, object>("class", "adsbygoogle"),
                    new KeyValuePair<string, object>("style", $"{Style}"),
                    new KeyValuePair<string, object>("data-ad-client", "ca-pub-1350282993400110"),
                    new KeyValuePair<string, object>("data-ad-slot", Slot),
                    new KeyValuePair<string, object>("data-ad-format", Adsformat),
                    new KeyValuePair<string, object>("data-full-width-responsive", true),
                });
                    b.CloseElement();

                    b.OpenElement(0, "script");
                    b.AddContent(3, "(adsbygoogle = window.adsbygoogle || []).push({});");
                    b.CloseElement();
                });
            }
        }
    }
}
