using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SICE.Startup))]
namespace SICE
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
