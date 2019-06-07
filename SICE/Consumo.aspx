<%@ Page Title="Consumo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consumo.aspx.cs" Inherits="SICE.Consumo" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-md-12" >
      <h1>Consumo</h1>
               
               <div class="col-sm-3 ">
                   <div class="card">
                       <div class="card-header"><h4 id="tituloArea">Area seleccionada: </h4></div>
                       <div id="LArCon" class="card-body scroll">
                           <ul class="list-group list-group-flush">

                           </ul>
                       </div>

                   </div>
               </div>
            
                <div class="col-sm-9 ">

                
                   <h2 class="tituloMes"><i class="fas fa-arrow-left arrowButton" onclick="restaMes()"></i> 	&nbsp; 	&nbsp;<span id="tituloMesAño"></span> 	&nbsp; 	&nbsp;<i class="fas fa-arrow-right arrowButton"  onclick="sumaMes()"></i></h2>
                   <table class="table table-hover" id="tablaConsumo">
                       <tr>
                           <th scope="col">
                               id
                           </th>
                           <th scope="col">
                               Area
                           </th>
                           <th scope="col">
                               día
                           </th>
                           <th scope="col">
                               consumo
                           </th>
                       </tr>
                   </table>
               </div>

    </div>

    <asp:Chart ID="Meses" runat="server" Width="800px" Height="400"> 
   <Series> 
      <asp:Series Name="MSeries" YValueType="Int32" ChartType="Column" ChartArea="MainChartArea"> 
         <Points> 
            <asp:DataPoint AxisLabel="Enero" YValues="17,0" /> 
            <asp:DataPoint AxisLabel="Febrero" YValues="15,0" /> 
            <asp:DataPoint AxisLabel="Marzo" YValues="6,0" /> 
            <asp:DataPoint AxisLabel="Abril" YValues="4,0" /> 
            <asp:DataPoint AxisLabel="Mayo" YValues="3,0" /> 
            <asp:DataPoint AxisLabel="Junio" YValues="2,0" /> 
            <asp:DataPoint AxisLabel="Julio" YValues="5,0" /> 
            <asp:DataPoint AxisLabel="Agosto" YValues="6,0" /> 
            <asp:DataPoint AxisLabel="Septiembre" YValues="12,0" /> 
            <asp:DataPoint AxisLabel="Octubre" YValues="13,0" /> 
            <asp:DataPoint AxisLabel="Noviembre" YValues="14,0" /> 
            <asp:DataPoint AxisLabel="Diciembre" YValues="11,0" /> 
         </Points> 
      </asp:Series> 
   </Series> 
   <ChartAreas> 
      <asp:ChartArea Name="MainChartArea"> 
          <AxisX Interval="1" Title="Meses">
            </AxisX>
          <AxisY Title="KW"></AxisY>
      </asp:ChartArea> 
   </ChartAreas> 
</asp:Chart>
    <br />Aqui va un grafico de barras parecido a este que muestre de manera grafica el consumo a traves de los dias/meses/años. Debe sacar los datos de una base de datos a traves de origen de datos.








    <script type="text/javascript" >
        
        const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
        var ListaAreasCon = <%= json %>;
        var currentSelected = Object;//Inicializamos el objeto de forma vacia.
        
        var mesVisible = new Date().getMonth() + 1;//Llamamos al mes actual para iniciar la vista.
        var yearVisible = new Date().getFullYear();//Tambien nos queremos mover entre años.
        cambiaTituloMes();//Cambiamos el texto de la fecha visible.

        changeASeleccionada(ListaAreasCon[0]);
        ListaAreasCon.map(function (arr) {

            appendLiArea(arr);
        });

        


        function changeASeleccionada(el) {
            currentSelected = el;
            document.getElementById('tituloArea').innerText = "Area seleccionada: " + currentSelected.nombre;
            clearTable();
            getConsumo();
        }



        function appendLiArea(el) {
            var li = document.createElement("li");
            li.innerHTML = '<p>' + el.nombre + '</p>';
            li.onclick = (ev) => { changeASeleccionada(el); };
            li.className = "list-group-item list-Areas";
            document.getElementById("LArCon").firstElementChild.append(li);

        }


        function cambiaTituloMes() {
            document.getElementById("tituloMesAño").innerText = monthNames[mesVisible - 1] + " del " + yearVisible;
        }

        function restaMes() {
            if (mesVisible === 1) {
                mesVisible = 12;
                yearVisible -= 1;
            }
            else
                mesVisible -= 1;
            cambiaTituloMes();
            clearTable();
            getConsumo();
        }

        function sumaMes() {
            if (mesVisible === 12) {
                mesVisible = 1;
                yearVisible += 1;
            }
            else
                mesVisible += 1;

            cambiaTituloMes();
            clearTable();
            getConsumo();
        }

        function clearTable() {
            for(var i = document.getElementById("tablaConsumo").rows.length - 1; i > 0; i--)
            {
                document.getElementById("tablaConsumo").deleteRow(i);
            }
        }

        function addCon2Table(data) {
            var table = document.getElementById("tablaConsumo");
            var newRow = table.insertRow(table.rows.length);
            if (data[0] != undefined) {
                var IdCell = newRow.insertCell(0);
                var AreaCell = newRow.insertCell(1);
                var diaCell = newRow.insertCell(2);
                var consumoCell = newRow.insertCell(3);
            
                IdCell.innerText = data[0].ID;
                AreaCell.innerText = data[0].area_ID;
                diaCell.innerText = data[0].f_inicio;
                consumoCell.innerText = data[0].consumo + " KW";
            }
                

        }

        function getDaysInMonth(m, y) {
            return m===2 ? y & 3 || !(y%25) && y & 15 ? 28 : 29 : 30 + (m+(m>>3)&1);
        }


        //Funcion que retorana string con el consumo para cada fecha.
        function getConsumo() {
            for (var i = 1; i <= getDaysInMonth(mesVisible, yearVisible); i += 1) {
                let cons = $.getJSON(`http://www.scristi.ml/api/sice/getConsumo.php?ID=${currentSelected.area_ID}&f_inicio=${yearVisible}-${mesVisible}-${i}&f_termino=${yearVisible}-${mesVisible}-${(i + 1)}`, data => {
                    addCon2Table(data);
            });
            }
            /*
            consumo = $.getJSON(`http://www.scristi.ml/api/sice/getConsumo.php?ID=${id}&f_inicio=${fecha.year}-${fecha.month}-${fecha.day}&f_termino=${fecha.month}-${fecha.day + 1}-${fecha.year}`, data => {
                if (data[0] != undefined)
                    document.getElementById('txtConsumo').innerHTML = data[0].consumo;
                else
                    document.getElementById('txtConsumo').innerHTML = 0;
            });
 
            return `<span id='txtConsumo'>...</span>Kwh *<span>consumo del ${fecha.day}/${fecha.month}/${fecha.year} desde las 14:30 en adelante</span>`;
            */
        }




    </script>
</asp:Content>
