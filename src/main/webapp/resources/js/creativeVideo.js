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

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        var month = date.getMonth() + 1;
        return (date.getDate().length > 1 ? date.getDate() : "0" + date.getDate()) + "/" + (month.length > 1 ? month : "0" + month) + "/" + date.getFullYear();
    }

    var table = $('#creativesTable').DataTable({
			sAjaxSource: "/creativeVideos",
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
             { data: "title" },
             { data: "advertiser.email" },
             { data: "videoLink" },
             { data: "status" },
             {
                 data: null,
                 className: "center",
                 defaultContent: '<a href="" class="editor_edit">Sửa</a> / <a href="" class="editor_remove">Xóa</a>'
             }
         ]
	 });


    // Edit record
    $('#creativesTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        $('#createBtn').attr('disabled', true);
        var data = table.row( $(this).parents('tr') ).data();
        $('#creativeForm #advertiserId').val(data.advertiser.id);
        $('#creativeForm #advertiserName').val(data.advertiser.email);
        $('#creativeForm #title').val(data.title);
        $('#creativeForm #body').val(data.body);
        $('#creativeForm #alt').val(data.alt);
        $('#creativeForm #videoLink').val(data.videoLink);
        $('#creativeForm #id').val(data.id);
    });

    // Delete a record
    $('#creativesTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#delete_creative').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: '/deleteCreative',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('.alert-info').attr('style','display: block');
                $('#creativesTable').DataTable().ajax.reload();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('.alert-danger').attr('style','display: block');
            }
        });
    });
});