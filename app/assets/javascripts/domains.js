var room = 1;
function education_fields(global_list) {
 
    room++;
    var objTo = document.getElementById('education_fields')
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "row removeclass"+room);
    var rdiv = 'removeclass'+room;

    divtest.innerHTML = '<div class="col"><select class="vendedor form-control" id="vendedor" name="vendedor[]" value="" placeholder="Vendedor" required></select></div><div class="col"><input type="text" class="form-control" id="price" name="price[]" value="" placeholder="price" required></div><div class="col"><input type="text" class="form-control" id="percentage" name="percentage[]" value="" placeholder="percentage" required></div><div class="col"><button class="btn btn-danger" type="button" onclick="remove_education_fields('+ room +');"> Eliminar </button></div>';
    objTo.appendChild(divtest);
    console.log(global_list);
    $('.vendedor').html(global_list);
}
   function remove_education_fields(rid) {
	   $('.removeclass'+rid).remove();
   }