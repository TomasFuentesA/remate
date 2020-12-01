var dolar = 0
var uf = 0
var euro = 0

function ufApi(){

    document.getElementById("uf").innerHTML = "";
  $.getJSON('https://mindicador.cl/api', function(data) {
    var dailyIndicators = data;


    $("<p/>", {
        html: 'El valor actual de la UF es $' + dailyIndicators.uf.valor
    }).appendTo("#uf");
}).fail(function() {
    console.log('Error al consumir la API!');
});

}


function dolarApi(){

    document.getElementById("dolar").innerHTML = "";

  $.getJSON('https://mindicador.cl/api', function(data) {
    var dailyIndicators = data;


    $("<p/>", {
        html: 'El valor actual del Dolar es $' + dailyIndicators.dolar.valor
    }).appendTo("#dolar");
}).fail(function() {
    console.log('Error al consumir la API!');
});

}

function euroApi(){
    document.getElementById("euro").innerHTML = "";

  $.getJSON('https://mindicador.cl/api', function(data) {
    var dailyIndicators = data;


    $("<p/>", {
        html: 'El valor actual del Euro es $' + dailyIndicators.euro.valor
    }).appendTo("#euro");
}).fail(function() {
    console.log('Error al consumir la API!');
});

}
