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
        Object.size = function(obj) {
            var size = 0,
                key;
            for (key in obj) {
                if (obj.hasOwnProperty(key)) size++;
            }
            return size;
        };
        var length = Object.size(regiones)+1;
        console.log(length);
        for (let i = 0; i < length; i++) {
            if(val == i){
                console.log(regiones[i]['comunas']);
                var lengthh = Object.size(regiones[i]['comunas'])+1;
                for (let j = 0; j < lengthh; j++) {
                    console.log($("#comuna").html("<option>"+regiones[i]['comunas'][j]+"</option>"));
                    $("#comuna").html("<option>"+regiones[i]['comunas'][j]+"</option>");
                }


            }
        }
    });
});


function cargarRegiones(regiones){
    console.log(regiones);
    let regionesdiv = document.getElementById("regiones");
    regionesdiv.innerHTML="";
    for (const element in regiones) {
        console.log(element)
        regionesdiv.innerHTML+="<option value="+element+">"+ element +"</option>"
    }
}





