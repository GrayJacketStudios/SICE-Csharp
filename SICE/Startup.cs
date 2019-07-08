using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using SICE.Models;
using System.Web.Security;

[assembly: OwinStartupAttribute(typeof(SICE.Startup))]
namespace SICE
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
            createRolesandUsers();
        }

        private void createRolesandUsers()
        {
            ApplicationDbContext context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));



            if (!Roles.RoleExists("Admin"))
            {

                //  Crear rol de administrador     
                Roles.CreateRole("Admin");
                
                
                //Crear usuario administrador                
                var user = new ApplicationUser();
                user.UserName = "Admin@SICE.com";
                user.Email = "Admin@SICE.com";
                string userPWD = "Admin12#";
                var chkUser = UserManager.Create(user, userPWD);

                //Asigna rol  
                if (chkUser.Succeeded)
                {
                    Roles.AddUserToRole(user.UserName, "Admin");
                }
            }

            // Crear rol usuario   
            if (!Roles.RoleExists("Usuario"))
            {
                Roles.CreateRole("Usuario");
                
            }
        }

    }
}
