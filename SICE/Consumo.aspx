<%@ Page Title="Consumo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consumo.aspx.cs" Inherits="SICE.Consumo" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
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
                   <div class="card">
                       <canvas id="graficoConsumo" width="255" height="300" style="align-self:auto;"></canvas>
                   </div>
               </div>
            
                <div class="col-sm-9 ">

                
                   <h2 class="tituloMes"><i class="fas fa-arrow-left arrowButton" onclick="restaMes()"></i> 	&nbsp; 	&nbsp;<span id="tituloMesAño"></span> 	&nbsp; 	&nbsp;<i class="fas fa-arrow-right arrowButton"  onclick="sumaMes()"></i></h2>
                   <div id="LArCon" class="card-body scroll" style="max-height: 550px!important;">
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
                        </div>
                   </table>
               </div>

    </div>




    <div class="col-md-12">
        <canvas id="consumoAnual" width="600" height="300" style="align-self:auto;"></canvas>
    </div>


    <script>
        const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
        var ctx = document.getElementById('consumoAnual').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: monthNames,
                datasets: [{
                    label: 'KW area',
                    data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                },
                {
                    label: 'KW total',
                    data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],

                    // Cambiamos este tipo para hacerlo una linea
                    type: 'line'
                }
                ]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
    });

    var ListaAreasCon = <%= json %>;


    var graf2 = document.getElementById('graficoConsumo').getContext('2d');
    var graficoTotal = new Chart(graf2, {
            type: 'pie',
        data: {
                labels: ["Habitacion 1", "Habitacion 2", "Habitacion 3", "Habitacion 4", "Habitacion 5", "Habitacion 6", "Habitacion 7", "Habitacion 8"],
                datasets: [{
                    label: 'KW area',
                    data: [12, 5, 10, 23, 3, 34, 5, 12],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(25, 15, 154, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(25, 15, 154, 1)'
                    ],
                    borderWidth: 1
                }
                ]
            }
        });
        
        
        
        var currentSelected = Object;//Inicializamos el objeto de forma vacia.
        
        var mesVisible = new Date().getMonth() + 1;//Llamamos al mes actual para iniciar la vista.
        var yearVisible = new Date().getFullYear();//Tambien nos queremos mover entre años.
        cambiaTituloMes();//Cambiamos el texto de la fecha visible.
        getMonthConsumo();//Actualizamos la tabla general

        changeASeleccionada(ListaAreasCon[0]);
        ListaAreasCon.map(function (arr) {

            appendLiArea(arr);
        });

        


        function changeASeleccionada(el, ev) {
            console.log(ev);
            currentSelected = el;
            document.getElementById('tituloArea').innerText = "Area seleccionada: " + currentSelected.nombre;
            clearTable();
            getConsumo();
            getMonthConsumo2()
        }



        function appendLiArea(el) {
            var li = document.createElement("li");
            li.innerHTML = '<p>' + el.nombre + '</p>';
            li.onclick = (ev) => {
                changeASeleccionada(el, ev);
                li.classList.add("activa");
            };
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
                AreaCell.innerText = data[0].nombre;
                diaCell.innerText = data[0].f_inicio;
                consumoCell.innerText = data[0].consumo + " KW";
            }
                

        }

        function getDaysInMonth(m, y) {
            return m===2 ? y & 3 || !(y%25) && y & 15 ? 28 : 29 : 30 + (m+(m>>3)&1);
        }


        //Funcion que retornara string con el consumo para cada fecha.
        function getConsumo() {
            let date1;
            let date2;
            for (var i = 1; i <= getDaysInMonth(mesVisible, yearVisible); i += 1) {
                date1 = `${yearVisible}-${mesVisible}-${i}`;
                date2 = `${yearVisible}-`;
                if (i == getDaysInMonth(mesVisible, yearVisible))
                    date2 += `${(mesVisible + 1)}-1`;
                else
                    date2 += `${mesVisible}-${i+1.00}`;

                let cons = $.getJSON(`http://localhost:8080/api/sice/getConsumo.php?ID=${currentSelected.area_ID}&f_inicio=${date1}&f_termino=${date2}`, data => {
                    addCon2Table(data);
            });
            }
        }

        
        
        function actualizaTabla1(data) {
            console.log(data);
            myChart.data.datasets[1].data[data.mes-1] = data.consumo;
            myChart.update();
        }

        function actualizaTabla2(data) {
            myChart.data.datasets[0].data[data.mes-1] = data.consumo;
            myChart.update();
        }


        //Funcion que retornara la cantidad de cosumo segun el mes solicitado.
        function getMonthConsumo() {
            let date1;
            let date2;
            for (var ix = 0; ix <= 11; ix += 1) {
                if (ix < 9) {
                    date1 = `0${(ix+1)}`;
                }
                else {
                    date1 = `${(ix+1)}`;

                }
                
                $.getJSON(`http://localhost:8080/api/sice/getMonthConsumo.php?year=${yearVisible}&mes=${date1}`, data => {
                    actualizaTabla1(JSON.parse(data));
                });
            }
            
        }

        //Funcion que retornara la cantidad de cosumo segun el mes solicitado para el area.
        function getMonthConsumo2() {
            let date1;

            for (var ix = 0; ix <= 11; ix += 1) {
                if (ix < 9) {
                    date1 = `0${(ix+1)}`;
                }
                else {
                    date1 = `${(ix+1)}`;

                }

                $.getJSON(`http://localhost:8080/api/sice/getMonthConsumoArea.php?ID=${currentSelected.area_ID}&year=${yearVisible}&mes=${date1}`, data => {
                    actualizaTabla2(JSON.parse(data));
                });
            }
            
        }



    </script>
</asp:Content>
