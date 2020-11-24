/*
document.addEventListener('turbolinks:before-cache', function(){
  // $('#myTable').DataTable().destroy();
})

document.addEventListener('turbolinks:load', function(){
  // $('#myTable').DataTable();
})

var i = 0;
document.addEventListener('turbolinks:load', function () {
    console.log(i);
    i = i + 1;
})

*/

var room_v = 1;
function add_dueño(global_list) {
  room_v++;
  var objTo = document.getElementById('sellers');
  var divtest = document.createElement("div");
	divtest.setAttribute("class", "row removeclass"+room_v);
  var rdiv = 'removeclass'+room_v;

  divtest.innerHTML = '<div class="col"><select class="dueño form-control" id="dueño" name="dueño[]" value="" placeholder="Dueño" ></select></div><div class="col"><input type="text" class="form-control" id="percentage" name="percentage[]" value="" placeholder="Porcentaje" required></div><div class="col"><input class="form-control" data-provide="datepicker" data-date-format="dd-mm-yyyy" autocomplete="off" type="text" name="entrada[]" id="entrada" placeholder="Fecha de ingreso" required></div><div class="col"><button class="btn btn-danger" type="button" style="height:40px;width:200px" onclick="remove_seller('+ room_v +');"> - </button></div>';
  objTo.appendChild(divtest);
  console.log(global_list);
  $('.dueño').html(global_list);
}
function remove_dueño(rid) {
	$('.removeclass'+rid).remove();
}