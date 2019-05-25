using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SICE.Areas
{
    public class areasJson
    {
        public int area_ID { get; set; }
        public string nombre { get; set; }
        public int flujo { get; set; }
        public int gpiod { get; set; }
        public int estado { get; set; }
        public areaDraw ad { get; set; }
    }

}