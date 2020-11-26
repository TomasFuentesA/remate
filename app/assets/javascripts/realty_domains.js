var room_v = 1;

function add_seller(global_list, list) {
    
    room_v++;
    var objTo = document.getElementById('sellers');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-row removeclass"+room_v);
    var rdiv = 'removeclass'+room_v;

    divtest.innerHTML = '<div class="col-md-12 card card-body"><div class="row"><div class="col" align="center"><div class="row"><div class="col"><select class="vendedor form-control" id="vendedor" name="vendedor[]" value="" placeholder="Vendedor" ><option> Seleccione vendedor </option></select></div><div class="col"><input type="text" class="form-control" id="valor" name="valor[]" value="" placeholder="Valor" onkeyup = sumar() required></div><div class="col"><input type="text" class="form-control" id="percentage_v" name="percentage_v[]" value="" placeholder="Porcentaje" required></div><div class="col"><button class="btn btn-danger" type="button" style="height:40px;width:200px" onclick="remove_seller('+ room_v +');"> - </button></div></div></div>';
    objTo.appendChild(divtest);
    console.log(global_list);
    console.log(list);
    
    $('.vendedor').html(global_list);
}
function remove_seller(rid) {
	$('.removeclass'+rid).remove();
}
