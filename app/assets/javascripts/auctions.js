


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
       calculateTotalMinimum()


       }else if($(input).attr('id') == 'pesos'){
         $('#uf').val(inp.val() / uf)
         calculateTotalMinimum()

         } else {
           $('#pesos, #uf').val("")
           }


          });


        }




function calculateTotalMinimum(){
   //var inp = $(input);

   var pesos = $('#pesos').val()
   //console.log(pesos)
   var costas = $('#cost').val()
   //console.log(costas)
   $('#total_minimum').val(parseInt(pesos) + parseInt(costas));
}


function habilite_part(selector){


  //console.log($("#parte_1 option:selected").text())


  if($(selector).find(':selected').val() == 'Particular'){
    $('#auction_judgements_parts_part1').prop('disabled', false);
  }
  else {
    $("#auction_parts_part1").val($("#parte_1 option:selected").val())
    }


}


function habilite_part2(selector){


  //console.log($("#parte_2 option:selected").text())


  if($(selector).find(':selected').val() == 'Particular'){
    $('#auction_parts_part2').prop('disabled', false);
  }
  else {
    $("#auction_parts_part2").val($("#parte_2 option:selected").text())
    }


}
