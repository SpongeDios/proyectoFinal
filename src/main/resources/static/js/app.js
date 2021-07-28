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

$(document).ready(function (){
    $("#region").change(function (){
        console.log(regiones)
        var val = $(this).val();
        for (let i = 0; i < Object.keys(regiones).length; i++) {
            if(val == i){
                console.log(regiones[i]['comunas']);
                $("#comuna").html("<option>"+regiones[i]['comunas']+"</option>");
            }
        }
    })
})


function cargarRegiones(regiones){
    console.log(regiones);
    let regionesdiv = document.getElementById("regiones");
    regionesdiv.innerHTML="";
    for (const element in regiones) {
        console.log(element)
        regionesdiv.innerHTML+="<option value="+element+">"+ element +"</option>"
    }
}





