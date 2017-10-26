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

    $('#imageFileBtn').on('click', function(e){
        e.preventDefault();
        $('#imageFile').click();
    });

    $('#imageFile').on('change', function () {
        var files = this.files;
        if (!files.length) {
            return;
        }
        var validExtensions = ['jpg','png','gif'];
        var fileName = files[0].name;
        /*var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1).toLowerCase();
        if (($.inArray(fileNameExt, validExtensions) == -1) || (this.files[0].size/1024 > 150)) {
            $('#modal-file-error').modal();
            return;
        }*/
        //readURL(files);
        $('#imageName').val(fileName);
    });

    var contentId = $('#contentDetailForm #contentId').val();

    var table = $('#contentDetailsTable').DataTable({
			sAjaxSource: serverContext + "/contentDetails?contentId=" + contentId,
			sAjaxDataProp: "",
            responsive: true,
            paging: false,
            searching: false,
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
             { data: "order" },
             { data: null,
                 "render": function (data) {
                     return '<img src="'+ data.imageLink + '" alt="image" height="100" />';
                 }
             },
             { data: "description" },
             { data: "createdDate",
                 "type": "date",
                 "render": function (data) {
                     return formatDate(data);
                 }
             },
             {
                 data: null,
                 className: "center",
                 "render": function (data) {
                     return '<a href="" class="editor_remove"><i class="fa fa-fw fa-remove"></i></a>';
                 }
             }
         ],
        rowReorder: {
            dataSrc: 'order'
        }
    });

    table.on( 'row-reorder', function ( e, diff, edit ) {
        setTimeout(function() {
            var data = table
                .rows()
                .data();
            var contentDetailIds = '';
            for (var i = 0; i < data.length; ++i) {
                if (i == data.length - 1) {
                    contentDetailIds += data[i].id
                } else {
                    contentDetailIds += data[i].id + ',';
                }
            }
            updateImageOrder(contentDetailIds);
        }, 1000);

    } );

    function updateImageOrder(contentDetailIds) {
        $.ajax({
            type: "POST",
            url: serverContext + '/updateImageOrder?contentDetailIds=' + contentDetailIds,
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (result) {
            },
            error: function(error) {
            }
        });
    }

    var showDetails = function (data) {
        $('#contentDetailForm #description').val(data.description);
        $('#contentDetailForm #id').val(data.id);
    };
    
    var resetForm = function () {
        $('#contentDetailForm')[0].reset();
        $('#contentDetailForm #id').val(null);
        $('#editBtn').attr('disabled', false);
    };

    // Edit record
    $('#contentDetailsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#contentDetailsTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#delete_content_detail').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: serverContext + '/deleteContentDetail',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('#delete-content-detail-info').attr('style','display: block');
                $('#contentDetailsTable').DataTable().ajax.reload();
                
                resetForm();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('#delete-content-detail-error').attr('style','display: block');
            }
        });
    });

    $('#contentDetailsTable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('success') ) {
            $(this).removeClass('success');
        }
        else {
            table.$('tr.success').removeClass('success');
            $(this).addClass('success');
        }
        data = table.row(this).data();
        showDetails(data);
    });

    $('#resetBtn').click(function(){
    	resetForm();
    });

    $('#delete_content_close_info').click(function(){
        $('#delete-content-detail-info').attr('style','display: none');
    });

    $('#delete_content_close_error').click(function(){
        $('#delete-content-detail-error').attr('style','display: none');
    });

});