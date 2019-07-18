using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SICE.Models;

namespace SICE.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // This doen't count login failures towards account lockout
                // To enable password failures to trigger lockout, change to shouldLockout: true
                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);
                SqlConnection conn = new SqlConnection(connectionString: ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn.Open();
                try
                {
                    SqlCommand command = new SqlCommand("Select Habilitado from [AspNetUsers] where Email='" + Email.Text + "'", conn);
                    var res = command.ExecuteScalar().ToString();
                    if (res.Equals("0"))
                    {
                        Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
                        result = SignInStatus.Failure;
                    }
                        
                        
                }
                catch(Exception err) { }
                
                switch (result)
                {
                    case SignInStatus.Success:
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("~/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Intento de login invalido o usuario bloqueado";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
    }
}