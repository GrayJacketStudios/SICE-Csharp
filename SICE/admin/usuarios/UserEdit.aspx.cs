using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SICE.admin.usuarios
{
    public partial class UserEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ID.Value = Request["Id"];
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var roleManager = Request.GetOwinContext().Get<RoleManager<IdentityRole>>();
            var user = manager.FindById(Request["Id"]);
            if(user == null)
            {
                Response.Redirect("/admin/usuarios/UserList");
            }

            email.Value = user.Email;
            
            rolSelect.SelectedValue = "0";
            
            username.Value = user.UserName;
            habilitado.Checked = (getHabilitado(Request["Id"]) == "1") ? true:false ;
        }

        protected String getHabilitado(String userId)
        {

            SqlConnection conn = new SqlConnection(connectionString: ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();

            SqlCommand command = new SqlCommand("Select Habilitado from [AspNetUsers] where Id='"+ userId + "'", conn);
            return  command.ExecuteScalar().ToString();
        }

        protected void guardarDatos(object sender, EventArgs e)
        {
            if (IsValid)
            {
                






            }

        }


    }
}