using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SICE.Events
{
    public class Eventos
    {
        public int ID { get; set; }
        public String EventoNombre { get; set; }
        public String AreaList { get; set; }
        public int flujoDeseado { get; set; }//0 = cerrado | 1 = abierto
        public bool estado { get; set; }
        
        public int cambiaFlujo()
        {
            return (this.flujoDeseado = (this.flujoDeseado == 1) ? 0 : 1);
        }

    }
}