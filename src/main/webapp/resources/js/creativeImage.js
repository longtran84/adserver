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
                var validSizes = ['320x50','480x32','320x100','468x60','728x90','300x250','320x480','480x320'];
                var size = this.width + "x" +  this.height;
                if ($.inArray(size, validSizes) == -1) {
                    $('#modal-file-error').modal();
                    return;
                }
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

    var showImageFile = function() {
        var _URL = window.URL || window.webkitURL;
        img = new Image();
        img.src = _URL.createObjectURL(files[0]);
        img.onload = function() {
            var validSizes = ['320x50','480x32','320x100','468x60','728x90','300x250','320x480','480x320'];
            var size = this.width + "x" +  this.height;
            if ($.inArray(size, validSizes) == -1) {
                $('#modal-file-error').modal();
                return;
            }
            $('#imagePreview').attr('width', this.width + 'px');
            $('#imagePreview').attr('height', this.height + 'px');
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#imagePreview').attr('src', e.target.result);
            }

            reader.readAsDataURL(files[0]);
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
        if (($.inArray(fileNameExt, validExtensions) == -1) || (this.files[0].size/1024 > 150)) {
            $('#modal-file-error').modal();
            return;
        }
        readURL(files);
        $('#imageName').val(fileName);
    });

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        var month = date.getMonth() + 1;
        return (date.getDate().length > 1 ? date.getDate() : "0" + date.getDate()) + "/" + (month.length > 1 ? month : "0" + month) + "/" + date.getFullYear();
    }

    var table = $('#creativesTable').DataTable({
			sAjaxSource: "/creativeImages",
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
             { data: "imageLink" },
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
        $('#creativeForm #imageLink').val(data.imageLink);
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