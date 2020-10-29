// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.


//= require gmaps/google
//= require underscore
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require arctic_admin/base
//= require activestorage
//= require turbolinks
//= require dropzone

//= require_tree .
//= require select2

function numberFormated(){
    const numbers = document.querySelectorAll('.number_formated');

    for (num of numbers) {
        num.addEventListener('keyup', (e) => {
            const element = e.target;
            const value = element.value;
            element.value = number_format(value,0);
        });
    } 
}

function number_format(amount) {

    amount += ''; 
    amount = amount.replaceAll('.', ',').replace(/[^0-9\.]/g, ''); 
 
    if (isNaN(amount) || amount === 0) 
        return 0

    amount = '' + amount

    var amount_parts = amount.split('.'),
        regexp = /(\d+)(\d{3})/;

    while (regexp.test(amount_parts[0]))
        amount_parts[0] = amount_parts[0].replace(regexp, '$1' + ',' + '$2');

    return amount_parts.join('.').replaceAll(',', '.');
}