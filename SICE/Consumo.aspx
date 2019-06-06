<%@ Page Title="Consumo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consumo.aspx.cs" Inherits="SICE.Consumo" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-md-10" >
      <h1>Consumo</h1>
        <div style="width:50%; float:left" >
           
               <h2>Area</h2>
               <div class="col-sm-4 scroll">
                   <div class="card">
                       <div id="LArCon" >
                           <ul>

                           </ul>
                       </div>

                   </div>
               </div>
            <hr/>
            Aqui va medidor que cuente de manera aditiva en tiempo real el consumo.

          
         </div>
       <div style="width:50%; float:right" >
           
               <h2>Mes</h2>
               Aqui va una tabla sacada directamente de la base de datos parecida a esta, que de información de consumo a traves de los dias/meses/años
          
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
        var ListaAreasCon = <%= json %>;
        ListaAreasCon.map(function (arr) {

            appendLiArea(arr);
        });


        function appendLiArea(el) {
            var li = document.createElement("li");
            li.innerText = el.nombre;
            document.getElementById("LArCon").append(li);

        }
    </script>
</asp:Content>
