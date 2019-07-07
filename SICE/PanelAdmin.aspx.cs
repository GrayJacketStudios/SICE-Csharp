using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SICE.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SICE
{
    public partial class PanelAdmin : System.Web.UI.Page
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