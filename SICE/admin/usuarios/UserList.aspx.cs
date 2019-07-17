using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SICE.admin
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                var user = User.Identity;

                if (!Roles.IsUserInRole("Admin"))
                {
                    Response.Redirect("MapArea.aspx");
                }

            }
        }
    }
}