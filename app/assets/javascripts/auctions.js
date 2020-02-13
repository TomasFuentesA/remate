document.addEventListener('turbolinks:before-cache', function(){
   //$('#myTable').DataTable().destroy();
})

document.addEventListener('turbolinks:load', function(){
   //$('#myTable').DataTable();
})

var i = 0;
document.addEventListener('turbolinks:load', function () {
    console.log(i);
    i = i + 1;
})


function habilite_money(selector){
  if($(selector).find(':selected').val() == 'true'){
    $('#uf').prop('disabled', false);
    $('#pesos').prop('disabled', true);
  }else if ($(selector).find(':selected').val() == 'false'){
    $('#pesos').prop('disabled', false);
    $('#uf').prop('disabled', true);
  }else{
    $('#pesos, #uf').val("")
 }
}


 function calculo_uf(input){
   //añade la url https://mindicador.cl/api/uf/{fecha } para consulta
   var inp = $(input);
   var url = 'https://mindicador.cl/api/uf/';
   var date = $('#date').val();
   var api = url + date.toString();


   $.getJSON(api, function(data) {
     //acceso a valor de la uf a la fecha.
     var lista = data.serie;
     var uf = lista[0].valor;

     //setter de valores para calculo de uf a pesos
     if (inp.attr('id') == 'uf'){
       $('#pesos').val(inp.val() * uf)
       }else if($(input).attr('id') == 'pesos'){
         $('#uf').val(inp.val() / uf)

         } else {
           $('#pesos, #uf').val("")
           }
          });
        }


function ufApi(){

  $.getJSON('https://mindicador.cl/api', function(data) {
    var dailyIndicators = data;

    $("<p/>", {
        html: 'El valor actual de la UF es $' + dailyIndicators.uf.valor + ' CLP'
    }).appendTo("#uf");
}).fail(function() {
    console.log('Error al consumir la API!');
});

}
