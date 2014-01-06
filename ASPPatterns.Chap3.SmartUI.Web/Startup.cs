using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ASPPatterns.Chap3.SmartUI.Web.Startup))]
namespace ASPPatterns.Chap3.SmartUI.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
