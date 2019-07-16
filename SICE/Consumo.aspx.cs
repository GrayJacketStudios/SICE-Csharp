using SICE.Areas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SICE
{
    public partial class Consumo : System.Web.UI.Page
    {
        protected string json = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                json = new WebClient().DownloadString("http://localhost:8080/api/sice/getHabitaciones.php");
            }
            catch(Exception error)
            {

            }

            

            //LArCon.InnerHtml += "<script type='text/javascript'> var listaAreas = JSON.parse(\"@Html.Raw(json)\"); </script>";


        }
    }
}