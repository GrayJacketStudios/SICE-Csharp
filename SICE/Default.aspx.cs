using Newtonsoft.Json;
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
    public partial class _Default : Page
    {
        protected string json = null;
        protected List<areasJson> areas = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            var drawJson = "";
            json = new WebClient().DownloadString("http://www.scristi.ml/api/sice/getHabitaciones.php");
            areas = new JavaScriptSerializer().Deserialize<List<areasJson>>(json);

            areas.ForEach( a => {
                drawJson = new WebClient().DownloadString("http://www.scristi.ml/api/sice/getDimensions.php?ID="+a.area_ID.ToString());
                a.ad = new JavaScriptSerializer().Deserialize<areaDraw>(drawJson);
            });

            areas.ForEach(a =>
            {
                MapaDiv.InnerHtml += "<div" +
                "                   id='areaMap_"+a.area_ID+"'" +
                "                    style='" +
                                    "position: absolute;" +
                                    "width: "+a.ad.size_x.ToString()+"px;" +
                                    "height: "+a.ad.size_y.ToString()+ "px;" +
                                    "left: "+a.ad.pos_x.ToString()+ "px;" +
                                    "top: "+a.ad.pos_y.ToString()+ "px;" +
                                    "background-color: "+((a.flujo == 1)? "#fd5432" : "#00ff00" )+ ";'" +
                                    "onClick='showModal("+a+")'><h4 align='center'>" + a.nombre+"</h4></div>";
            });

                
        }

    




    }
}