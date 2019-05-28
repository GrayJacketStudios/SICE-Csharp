var modal;
var span;
var area = new Object;

window.onload = function () {
    modal = document.getElementById("modalForMap");
}

window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function getConsumo(id, fecha) {
    return `${id}Kwh *<span>consumo desde las 14:30 en adelante</span>`;
}
function cambiaFlujo(id, flujo) {
    area.flujo = flujo;
    $.post(`http://www.scristi.ml/api/sice/changeFlujo.php?ID=${id}&flujo=${flujo}`);
    renderModal();
    let areaDiv = document.getElementById(`areaMap_${id}`);
    areaDiv.style.backgroundColor = (flujo == 1) ? "#fd5432" : "#00ff00";
}

function renderModal() {
    modal.children[0].children[1].innerHTML = "Area: " + area.nombre;
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

function hideModal() {
    modal.style.display = (modal.style.display == "none") ? "block" : "none";
}