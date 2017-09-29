$(document).ready( function () {
    var data;
    $(function () {
        /*$('#editBtn').attr("disabled", true);*/
        $('#activateBtn').attr('disabled', true);
    });

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

    var table = $('#contentsTable').DataTable({
			sAjaxSource: "/contents",
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
             { data: "originalLink" },
             { data: "createdDate",
                 "type": "date",
                 "render": function (data) {
                     return formatDate(data);
                 }
             },
             {   data: null,
                 "render": function (data) {
                     if (data.status === 'NEW') {
                         return 'Mới';
                     } else if (data.status === 'ACTIVE') {
                         return 'Đang hoạt động';
                     } else {
                         return 'Không hoạt động';
                     }
                 }
             },
             {
                 data: null,
                 className: "center",
                 "render": function (data) {
                     if (data.status === 'NEW') {
                         return '<a href="" class="editor_edit"><i class="fa fa-fw fa-edit"></i></a>   <a href="" class="editor_remove"><i class="fa fa-fw fa-remove"></i></a>  <a href="" class="editor_add"><i class="fa fa-fw fa-plus"></i></a>';
                     } else if (data.status === 'ACTIVE') {
                         return '<a href="" class="editor_edit"><i class="fa fa-fw fa-edit"></i></a>   <a href="" class="editor_remove"><i class="fa fa-fw fa-plus"></i></a>';
                     } else {
                         return '';
                     }
                 }
             }
         ]
	 });

    var showDetails = function (data) {
        $('#contentForm #title').val(data.title);
        $('#contentForm #originalLink').val(data.originalLink);
        $('#contentForm #id').val(data.id);
        $('#contentForm #status').val(data.status);
    };
    
    var resetForm = function () {
        $('#contentForm')[0].reset();
        $('#contentForm #id').val(null);
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };

    // Edit record
    $('#contentsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#contentsTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#contentsTable tbody').on( 'click', 'a.editor_add', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        window.location = 'contentDetail?contentId=' + data.id;
    });

    $('#delete_content').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: '/deleteContent',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('#delete-content-info').attr('style','display: block');
                $('#contentsTable').DataTable().ajax.reload();
                
                resetForm();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('#delete-content-error').attr('style','display: block');
            }
        });
    });

    $('#contentsTable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('success') ) {
            $(this).removeClass('success');
        }
        else {
            table.$('tr.success').removeClass('success');
            $(this).addClass('success');
        }
        data = table.row(this).data();
        if (data.status === 'NEW') {
            $('#editBtn').attr('disabled', false);
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Kích hoạt');
        } else if (data.status === 'INACTIVE') {
            $('#editBtn').attr('disabled', true);
            $('#activateBtn').attr('disabled', false);
        } else {
            $('#editBtn').attr('disabled', true);
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Hủy kích hoạt');
        }
        showDetails(data);
    });

    $('#activateBtn').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: '/activateContent',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                if (data.status === 'NEW' || data.status === 'INACTIVE') {
                    $('#activateBtn').text('Hủy kích hoạt');
                } else {
                    $('#activateBtn').text('Kích hoạt');
                }

                resetForm();
                $('#contentsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    $('#resetBtn').click(function(){
    	resetForm();
    });

    $('#delete_content_close_info').click(function(){
        $('#delete-content-info').attr('style','display: none');
    });

    $('#delete_content_close_error').click(function(){
        $('#delete-content-error').attr('style','display: none');
    });

});