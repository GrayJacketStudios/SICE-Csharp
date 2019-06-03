var modal;
var span;
var area = new Object;
//Obtenemos el objeto modal luego de que se cargue la pagina (O no funcionara)
window.onload = function () {
    modal = document.getElementById("modalForMap");
}

function getToday() {
    let today = new Date();
    let fecha = Object;
    fecha.year = today.getFullYear();
    fecha.day = (today.getDate() < 10) ? "0" + today.getDate() : today.getDate();
    fecha.month = today.getMonth()+1;
    return fecha;
         
    
}


//Funcion que retorana string con el consumo para la fecha.
function getConsumo(id) {

    let fecha = getToday();
    consumo = $.getJSON(`http://www.scristi.ml/api/sice/getConsumo.php?ID=${id}&f_inicio=${fecha.year}-${fecha.month}-${fecha.day}&f_termino=${fecha.month}-${fecha.day + 1}-${fecha.year}`, data => {
        if (data[0] != undefined)
            document.getElementById('txtConsumo').innerHTML = data[0].consumo;
        else
            document.getElementById('txtConsumo').innerHTML = 0;
    });
 
    return `<span id='txtConsumo'>...</span>Kwh *<span>consumo del ${fecha.day}/${fecha.month}/${fecha.year} desde las 14:30 en adelante</span>`;
}

//Funcion ajax que envia un HTTPDREQUEST a la API ubicada en www.scristi.ml/api/sice/... para cambiar el flujo
function cambiaFlujo(id, flujo) {
    area.flujo = flujo;
    $.post(`http://www.scristi.ml/api/sice/changeFlujo.php?ID=${id}&flujo=${flujo}`);
    renderModal();
    let areaDiv = document.getElementById(`areaMap_${id}`);
    areaDiv.style.backgroundColor = (flujo == 1) ? "#fd5432" : "#00ff00";
    areaDiv.onclick = function () { showModal(area.id,area.nombre,flujo) };
}

//Funcion que nos muestra el texto correspondiente segun el area en el modal. se puede llamar para actualizar segun estado.
function renderModal() {
    modal.children[0].children[1].innerHTML = "Area: " + area.nombre;
    modal.children[0].style.backgroundColor = (area.flujo == 1) ? "#fd5432" : "#00ff00";
    modal.children[1].innerHTML = `<p class='text-flujo'>Estado del flujo: ${((area.flujo == "1") ? "Cerrado" : "Abierto")} <div>   
                                            
                                                <label class="switch">
                                                    <input type="checkbox" onchange="cambiaFlujo(${area.id},${parseInt(area.flujo - 1) * (-1)})" ${(area.flujo == "1") ? "checked" : ""}/>
                                                    <span class="slider round"></span>
                                                </label>
                                            
                                        </div></p>`+
                                     `<p>Consumo energetico del día:<p>
                                       <div class="lista-consumo">${getConsumo(area.id, new Date())}</div>
                                        `;

}

//Llamamos a esta función cuando apretamos sobre el area para mostrar el modal, asignamos el objeto area.
function showModal(id, nombre, flujo) {
    if (modal.style.display == "block") {
        modal.style.display ="none";
    }
    else {
        modal.style.display = "block";
        area.id = id;
        area.nombre = nombre;
        area.flujo = flujo;
        renderModal(area);
    }
    
    
}
//Funcion para ocultar el modal
function hideModal() {
    modal.style.display = "none";
}