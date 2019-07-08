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
    public partial class List : System.Web.UI.Page
    {

        protected String dataFecha = "";
        protected String dataHorario = "";
        protected String dataHooks = "";

        protected JObject dataJson = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            getData4Fecha();
            readDataFecha();

            getData4Horario();
            readDataHorario();

            getData4Hooks();
            readDataHooks();
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
                areaNombres += jsonObj.nombre+" |";
            }

            return areaNombres;
        }

        protected void getData4Fecha()
        {
            string url = "http://scristi.ml/api/sice/getEventosActivos.php?evento=fecha";
            var webClient = new WebClient();
            dataFecha = webClient.DownloadString(url);
        }

        protected void getData4Horario()
        {
            string url = "http://scristi.ml/api/sice/getEventosActivos.php?evento=horario";
            var webClient = new WebClient();
            dataHorario = webClient.DownloadString(url);
        }

        protected void getData4Hooks()
        {
            string url = "http://scristi.ml/api/sice/getEventosActivos.php?evento=hooks";
            var webClient = new WebClient();
            dataHooks = webClient.DownloadString(url);
        }

        protected JObject readDataHorario()
        {
            dynamic jsonObj = JsonConvert.DeserializeObject(dataHorario);
            foreach (var obj in jsonObj)
            {
                if(obj.estado != "1")
                {
                    continue;
                }
                var eID = new TableCell();
                var aList = new TableCell();
                var tipoEvento = new TableCell();
                var estadoFlujo = new TableCell();
                var row = new TableRow();

                eID.Text = obj.event_time_id;
                aList.Text = readAreasName(""+obj.areas_afectadas_id);
                tipoEvento.Text = "Evento por horario";
                estadoFlujo.Text = (obj.modo == "1") ? "Encendido" : "Apagado";

                row.Cells.Add(eID);
                row.Cells.Add(aList);
                row.Cells.Add(tipoEvento);
                row.Cells.Add(estadoFlujo); 

                tablaEvCal.Rows.Add(row);

            }

            return null;
        }


        protected JObject readDataFecha()
        {
            dynamic jsonObj = JsonConvert.DeserializeObject(dataFecha);
            foreach (var obj in jsonObj)
            {
                if (obj.estado != "1")
                {
                    continue;
                }
                var eID = new TableCell();
                var aList = new TableCell();
                var tipoEvento = new TableCell();
                var estadoFlujo = new TableCell();
                var row = new TableRow();

                eID.Text = obj.event_date_id;
                aList.Text = readAreasName("" + obj.areas_afectadas_id);
                tipoEvento.Text = "Evento por fecha";
                estadoFlujo.Text = (obj.modo == "1")?"Encendido":"Apagado";

                row.Cells.Add(eID);
                row.Cells.Add(aList);
                row.Cells.Add(tipoEvento);
                row.Cells.Add(estadoFlujo);

                tablaEvCal.Rows.Add(row);

            }

            return null;
        }

        protected JObject readDataHooks()
        {
            dynamic jsonObj = JsonConvert.DeserializeObject(dataHooks);
            foreach (var obj in jsonObj)
            {
                if (obj.estado != "1")
                {
                    continue;
                }
                var eID = new TableCell();
                var aList = new TableCell();
                var tipoEvento = new TableCell();
                var estadoFlujo = new TableCell();
                var row = new TableRow();

                eID.Text = obj.event_hook_id;
                aList.Text = readAreasName(""+obj.areas_afectadas_id);
                tipoEvento.Text = "Evento por hooks";
                estadoFlujo.Text = (obj.modo == "1") ? "Encendido" : "Apagado";

                row.Cells.Add(eID);
                row.Cells.Add(aList);
                row.Cells.Add(tipoEvento);
                row.Cells.Add(estadoFlujo);

                tablaEvCal.Rows.Add(row);

            }

            return null;
        }



        

    }
}