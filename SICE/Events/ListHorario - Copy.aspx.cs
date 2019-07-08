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
    public partial class ListHorario : System.Web.UI.Page
    {
        protected String data = "";

        protected JObject dataJson = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            getData4Table();
            readData();
            populateTable();
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

        protected string getDias(String dias)
        {
            string s = Convert.ToString(int.Parse(dias), 2);
            String final = "";
            int[] bits = s.PadLeft(8, '0') // Add 0's from left
             .Select(c => int.Parse(c.ToString())) // convert each char to int
             .ToArray(); // Convert IEnumerable from select to Array
            if(bits[7] == 1)
            {
                final += "Lunes ";
            }
            if (bits[6] == 1)
            {
                final += "Martes ";
            }
            if (bits[5] == 1)
            {
                final += "Miercoles ";
            }
            if (bits[4] == 1)
            {
                final += "Jueves ";
            }
            if (bits[3] == 1)
            {
                final += "Viernes ";
            }
            if (bits[2] == 1)
            {
                final += "Sabado ";
            }
            if (bits[1] == 1)
            {
                final += "Domingo ";
            }
            return final;
        }


        protected void getData4Table()
        {
            string url = "http://scristi.ml/api/sice/getEventosActivos.php?evento=horario";
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
                var hInicio = new TableCell();
                var hFin = new TableCell();
                var diasSemana = new TableCell();
                var flujoDeseado = new TableCell();
                var estado = new TableCell();
                var row = new TableRow();

                eID.Text = obj.event_time_id;
                aList.Text = readAreasName("" + obj.areas_afectadas_id);
                hInicio.Text = obj.hora_inicio;
                hFin.Text = obj.hora_termino;
                flujoDeseado.Text = (obj.modo == "1") ? "Encendido" : "Apagado";
                estado.Text = (obj.estado == "1") ? "Encendido" : "Apagado";
                diasSemana.Text = getDias("" + obj.dias_semana);

                row.Cells.Add(eID);
                row.Cells.Add(aList);
                row.Cells.Add(hInicio);
                row.Cells.Add(hFin);
                row.Cells.Add(diasSemana);
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