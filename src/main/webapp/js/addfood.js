$(document).ready(function(){
	var i = 1;
    var ma = $("#txtMa").val();
    var ten = $("#txtName").val();
    var dm =  $("#txtDm").val();
    var anh = $("#uploadfile").val().substring();
    var gia = $("#txtGia").val();
    var mota = $("#txtMota").val();
    var item = `<button class="btn btn-primary btn-sm trash" id="delete" type="button" id="delete" title="Xóa" onclick="myFunction(this)">
                    <i class="fas fa-trash-alt"></i>'
                </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#update">
                    <i class="fas fa-edit"></i></button>`;
    function readURL(input, thumbimage) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
            $("#thumbimage").attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
        else { // Sử dụng cho IE
            $("#thumbimage").attr('src', input.value);
    
        }$("#thumbimage").show();
    }
	$("#btnSave").click(function(){
		var them = "<tr><td>" + ma +"</td><td>" + ten +"</td><td>"+anh +"</td><td>" + mota +"</td><td>" + gia +"</td><td>" + dm+"</td><td>"+ item+"</td></tr>";
		$("table tbody").append(them);
		$("#addfood").modal("hide");
		return true;
	});
    $('table').on('click', '#delete', function(e){
        $(this).closest('tr').remove()
     })
});