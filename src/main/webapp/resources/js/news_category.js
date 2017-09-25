$(document).ready( function () {
    var data;
    $(function () {
        $('#editBtn').attr("disabled", true);
        $('#activateBtn').attr('disabled', true);
    });

    $('#imageFileBtn').on('click', function(e){
        e.preventDefault();
        $('#imageFile').click();
    });

    var readURL = function(files) {
        if (files && files[0]) {
            var _URL = window.URL || window.webkitURL;
            img = new Image();
            img.src = _URL.createObjectURL(files[0]);
            img.onload = function() {
                /*var validSizes = ['320x50','480x32','320x100','468x60','728x90','300x250','320x480','480x320'];
                var size = this.width + "x" +  this.height;
                if ($.inArray(size, validSizes) == -1) {
                    $('#modal-file-error').modal();
                    return;
                }*/
                $('#imagePreview').attr('width', this.width + 'px');
                $('#imagePreview').attr('height', this.height + 'px');
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#imagePreview').attr('src', e.target.result);
                }

                reader.readAsDataURL(files[0]);
            }
        }
    }

    $('#imageFile').on('change', function () {
        var files = this.files;
        if (!files.length) {
            return;
        }
        var validExtensions = ['jpg','png','gif'];
        var fileName = files[0].name;
        var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1).toLowerCase();
        /*if (($.inArray(fileNameExt, validExtensions) == -1) || (this.files[0].size/1024 > 150)) {
            $('#modal-file-error').modal();
            return;
        }*/
        readURL(files);
        $('#imageName').val(fileName);
    });

    var table = $('#categoriesTable').DataTable({
			sAjaxSource: "/news/categories",
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
             { data: "code" },
             { data: "name" },
             { data: null,
               "render": function (data) {
                 if (data.image !== null) {
                     return '<img src="'+ data.image + '" alt="image" height="200" />';
                 } else {
                     return '<img src="/images/no-image.png" alt="image" height="200" />';
                 }
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
                         return '<a href="" class="editor_edit"><i class="fa fa-fw fa-edit"></i></a>  <a href="" class="editor_remove"><i class="fa fa-fw fa-remove"></i></a>';
                     } else {
                         return '';
                     }
                 }
             }
         ]
	 });

    var showDetails = function (data) {
        $('#categoryForm #code').val(data.code);
        $('#categoryForm #name').val(data.name);
        $('#categoryForm #imageLink').val(data.videoLink);
        $('#categoryForm #id').val(data.id);
    }

    // Edit record
    $('#categoriesTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        $('#createBtn').attr('disabled', true);
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#categoriesTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#delete_category').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: '/news/deleteCategory',
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

    $('#categoriesTable tbody').on( 'click', 'tr', function () {
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
            $('#createBtn').attr('disabled', true);
            $('#resetBtn').attr('disabled', false);
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Kích hoạt');
        } else if (data.status === 'INACTIVE') {
            $('#editBtn').attr('disabled', true);
            $('#createBtn').attr('disabled', true);
            $('#resetBtn').attr('disabled', true);
            $('#activateBtn').attr('disabled', true);
        } else {
            $('#editBtn').attr('disabled', true);
            $('#createBtn').attr('disabled', true);
            $('#resetBtn').attr('disabled', true);
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Hủy kích hoạt');
        }
        showDetails(data);
    });

    $('#activateBtn').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: '/activateCategory',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                if (data.status === 'NEW') {
                    $('#activateBtn').text('Hủy kích hoạt');
                } else {
                    $('#activateBtn').text('Kích hoạt');
                    $('#activateBtn').attr('disabled', true);
                }
                $('#creativesTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    $('#resetBtn').click(function(){
        $('#categoryForm')[0].reset();
    });

    $('#close_info').click(function(){
        $('.alert-info').attr('style','display: none');
    });

    $('#close_error').click(function(){
        $('.alert-danger').attr('style','display: none');
    });
});