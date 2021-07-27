// let regiones = {};
// function cargarRegiones(listaRegiones){
//     regiones = listaRegiones;
//     console.log(regiones);
//     let json = JSON.stringify(regiones);
//     console.log(json);
//     for (const region in regiones) {
//         console.log(region);
//     }
// }
//
function cargarJson(regiones){
    return regiones;
}

function cargarRegiones(regiones){
    console.log(regiones);
    let regionesdiv = document.getElementById("regiones");
    regionesdiv.innerHTML="";
    for (const element in regiones) {
        console.log(element)
        regionesdiv.innerHTML+="<option value="+element+">"+ element +"</option>"
    }
}

function cargarComunas(region){
    console.log(region)
    let comunas = document.getElementById("comunas");
    regiones = cargarJson();
    comunas.innerHTMl = "";
    for (const element in comunas) {

    }
}




