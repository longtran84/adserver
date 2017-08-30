var data;
$(document).ready( function () {
    $(function () {
        var token = $("input[name='_csrf']").val();
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $('#editBtn').attr("disabled", true);
    });
    var table = $('#advertisersTable').DataTable({
			sAjaxSource: "/advertisers",
			sAjaxDataProp: "",
            responsive: true,
			order: [[ 0, "asc" ]],
            language: {
                "zeroRecords": "Không tìm thấy bản ghi nào",
                "info": "Hiện thị trang _PAGE_ của _PAGES_",
                "lengthMenu": "Hiển thị _MENU_ bản ghi",
                "search": "Tìm kiếm",
                "paginate": {
                "first":    	"Đầu tiên",
                "previous": 	"Trước",
                "next":     	"Sau",
                "last":     	"Cuối cùng"
            }
            },
             columns: [
             { data: "email" },
             { data: "fullName" },
             { data: "companyName" },
             { data: "phone" },
             { data: "charge" },
             {
                 data: null,
                 className: "center",
                 defaultContent: '<a href="" class="editor_edit">Sửa</a> / <a href="" class="editor_remove">Xóa</a>'
             }
         ]
	 });

    // Edit record
    $('#advertisersTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        $('#createBtn').attr('disabled', true);
        var data = table.row( $(this).parents('tr') ).data();
        $('#advertiserForm #email').val(data.email);
        $('#advertiserForm #password').val(data.password);
        $('#advertiserForm #passwordConfirm').val(data.password);
        $('#advertiserForm #fullName').val(data.fullName);
        $('#advertiserForm #phone').val(data.phone);
        $('#advertiserForm #companyName').val(data.companyName);
        $('#advertiserForm #charge').val(data.charge);
        $('#advertiserForm #id').val(data.id);
    });

    // Delete a record
    $('#advertisersTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#delete_advertiser').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            /*headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }*/
            url: '/deleteAdvertiser',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('.alert-info').attr('style','display: block');
                $('#advertisersTable').DataTable().ajax.reload();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('.alert-danger').attr('style','display: block');
            }
        });
    });

    $('#searchBtn').click(function(){
        var request = {
                        email: $('#advertiserForm #email').val(),
                        fullName: $('#advertiserForm #fullName').val(),
                        phone: $('#advertiserForm #phone').val(),
                        companyName: $('#advertiserForm #companyName').val(),
                        charge: $('#advertiserForm #charge').val(),
                      };
        $.ajax({
            type: "POST",
            url: '/searchAdvertiser',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#advertisersTable').DataTable().draw();
            },
            error: function(error) {
            }
        });
    });

    $('#resetBtn').click(function(){
        $('#advertiserForm')[0].reset();
    });

    $('#close_info').click(function(){
        $('.alert-info').attr('style','display: none');
    });

    $('#close_error').click(function(){
        $('.alert-danger').attr('style','display: none');
    });
});