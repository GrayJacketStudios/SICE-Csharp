using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SICE.Events
{
    public partial class ListCal : System.Web.UI.Page
    {
        protected String data = "";

        protected JObject dataJson = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            getData4Table();
            
            populateTable();
        }

        protected void getData4Table()
        {
            string url = "http://www.scristi.ml/api/sice/getHabitaciones.php";
            var webClient = new WebClient();
            data = webClient.DownloadString(url);
        }

        protected JObject readData()
        {
            
            return null;
        }


        protected void populateTable()
        {
            // :)
        }
    }
}