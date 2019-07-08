using Newtonsoft.Json;
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
    public partial class ListHooks : System.Web.UI.Page
    {
        protected String data = "";

        protected JObject dataJson = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string readAreasName(String ids)
        {
            string[] areas = ids.Split(',');
            String areaNombres = "";
            foreach (string area in areas)
            {
                string url = "http://scristi.ml/api/sice/getHabitacion.php?ID=" + area;
                var webClient = new WebClient();
                var data = webClient.DownloadString(url);
                dynamic jsonObj = JsonConvert.DeserializeObject(data);
                areaNombres += jsonObj.nombre + " |";
            }

            return areaNombres;
        }


        protected void getData4Table()
        {
            string url = "http://scristi.ml/api/sice/getEventosActivos.php?evento=hooks";
            var webClient = new WebClient();
            data = webClient.DownloadString(url);
        }

        protected JObject readData()
        {
            dynamic jsonObj = JsonConvert.DeserializeObject(data);
            foreach (var obj in jsonObj)
            {
                var eID = new TableCell();
                var aList = new TableCell();
                var inicio = new TableCell();
                var termino = new TableCell();
                var flujoDeseado = new TableCell();
                var estado = new TableCell();
                var row = new TableRow();

                eID.Text = obj.event_time_id;
                aList.Text = readAreasName("" + obj.areas_afectadas_id);
                inicio.Text = obj.hora_inicio;
                termino.Text = obj.hora_termino;
                flujoDeseado.Text = (obj.modo == "1") ? "Encendido" : "Apagado";
                estado.Text = (obj.estado == "1") ? "Encendido" : "Apagado";

                row.Cells.Add(eID);
                row.Cells.Add(aList);
                row.Cells.Add(inicio);
                row.Cells.Add(termino);
                row.Cells.Add(flujoDeseado);
                row.Cells.Add(estado);

                tablaEvCal.Rows.Add(row);

            }
            
            return null;
        }


        protected void populateTable()
        {
            // :)
        }
    }
}