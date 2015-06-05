using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EsToDoWeb.Startup))]
namespace EsToDoWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
