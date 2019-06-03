using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace SICE.Areas
{
    public class consumo
    {
        private int ID;
        private int area_ID;
        private string f_inicio;
        private string f_termino;
        private int consum;


        [WebMethod]
        public static int getConsumo(int id, string inicio, string termino)
        {
            string json = null;
            List<consumo> csm = null;

            int totalConsumo = 0;
            string url = "http://www.scristi.ml/api/sice/getConsumo.php?ID=" + id.ToString() + "f_inicio="+inicio+"&f_termino=" + termino;
            json = new WebClient().DownloadString(url);
            csm = new JavaScriptSerializer().Deserialize<List<consumo>>(json);

            csm.ForEach(c =>
            {
                totalConsumo += c.consum;
            });

            return totalConsumo;
        }
    }
}