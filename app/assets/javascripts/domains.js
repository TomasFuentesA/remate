var room = 1;
function education_fields(global_list) {
 
    room++;
    var objTo = document.getElementById('education_fields')
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group removeclass"+room);
	var rdiv = 'removeclass'+room;
    divtest.innerHTML = '<div class="col-sm-3 nopadding"><div class="form-group"> <select class="vendedor form-control" id="vendedor" name="vendedor[]" value="" placeholder="Vendedor"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="price" name="price[]" value="" placeholder="price" oninput = "percentage(this)"></div></div><div class="col-sm-3 nopadding"><div class="form-group"> <input type="text" class="form-control" id="percentage" name="percentage[]" value="" placeholder="percentage"></div></div><div class="col-sm-3 nopadding"><div class="form-group"><div class="input-group"><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_education_fields('+ room +');"> <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> </button></div></div></div></div><div class="clear"></div>';
    
    objTo.appendChild(divtest)
    $('.vendedor').html(global_list);
    console.log(global_list);
}
   function remove_education_fields(rid) {
	   $('.removeclass'+rid).remove();
   }