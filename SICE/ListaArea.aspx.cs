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
    public partial class ListaArea : System.Web.UI.Page
    {
        protected string json = null;
        protected List<areasJson> areas = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            var drawJson = "";
            try
            {
                json = new WebClient().DownloadString("http://www.scristi.ml/api/sice/getHabitaciones.php");
                areas = new JavaScriptSerializer().Deserialize<List<areasJson>>(json);
            }
            catch (Exception error) { };

            try
            {
                areas.ForEach(a => {

                    drawJson = new WebClient().DownloadString("http://www.scristi.ml/api/sice/getDimensions.php?ID=" + a.area_ID.ToString());
                    a.ad = new JavaScriptSerializer().Deserialize<areaDraw>(drawJson);


                });
            }
            catch (Exception error) { };



            try
            {

                areas.ForEach(a =>
                {
                    Lista.InnerHtml += "<div class='listArea panel panel-default'>" +
                                            "<div class='panel-heading'>" +
                                                "<div id = 'list_" + a.area_ID + "' ><p style = 'display: inline-block;' > " + a.nombre+" | Estado: <span ><h6 style='display: inline-block;'>"+((a.flujo == 1)?"Encendido":"Apagado")+"</h6> <input type = 'checkbox' onclick='clicked("+a.area_ID+", "+a.flujo+ ");' " + ((a.flujo == 1) ? "checked" : "") + "/></span></p></div>" +
                                            "</div>" +

                                       "</div>";
                });


            }catch(Exception error) { 
                Lista.InnerHtml = "FALLO EN LA CONEXION CON EL SERVIDOR";
            }



        }
    }
}