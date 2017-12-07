$(document).ready( function () {
    var data;
    $(function () {
       /* $('#editBtn').attr("disabled", true);*/
        $('#activateBtn').attr('disabled', true);
    });

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

    $('#pictureFileBtn').on('click', function(e){
        e.preventDefault();
        $('#pictureFile').click();
    });

    $('#pictureFile').on('change', function () {
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
        $('#pictureName').val(fileName);
    });

    var table = $('#vouchersTable').DataTable({
			sAjaxSource: serverContext + "/loyalty/vouchers",
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
             { data: "name" },
             {   data: null,
                     "render": function (data) {
                         if (data.type === 'PHYSICAL_VOUCHER') {
                             return 'Voucher giấy';
                         } else {
                             return 'E-voucher';
                         }
                     }
             },
             { data: null,
                 "render": function (data) {
                     return '<img src="'+ data.picture + '" alt="picture" width="200" height="200" />';
                 }
             },
             { data: "marketPrice",
                 render: $.fn.dataTable.render.number( '.')
             },
             { data: "price",
                 render: $.fn.dataTable.render.number( '.')
             },
             { data: "quantity",
                 render: $.fn.dataTable.render.number( '.')
             },
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
                         return '<a href="" class="editor_edit"><i class="fa fa-fw fa-edit"></i></a>  <a href="" class="editor_remove"><i class="fa fa-fw fa-remove"></i></a>';
                     } else if(data.status === 'ACTIVE') {
                         return '<a href="" class="editor_edit"><i class="fa fa-fw fa-edit"></i></a>';
                     } else {
                         return '';
                     }
                 }
             }
         ]
	 });

    var showDetails = function (data) {
        $('#voucherForm #name').val(data.name);
        var lastIndex = data.picture.lastIndexOf("/");
        $('#voucherForm #pictureName').val(data.picture.substring(lastIndex + 1));
        $('#voucherForm #marketPrice').val(data.marketPrice);
        $('#voucherForm #price').val(data.price);
        $('#voucherForm #quantity').val(data.quantity);
        CKEDITOR.instances.contentEditor.setData(data.description);
        $('#voucherForm #id').val(data.id);
        $('#voucherForm #status').val(data.status);
        $('#voucherForm #legacyId').val(data.legacyId);
        $('#type option[value="' + data.type + '"]').attr('selected', true);
    };
    
    var resetForm = function () {
        $('#voucherForm')[0].reset();
        
        $('#voucherForm #id').val(null);
        $('#voucherForm #status').val(null);
        $('#voucherForm #legacyId').val(null);
        
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };

    // Edit record
    $('#vouchersTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#vouchersTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#delete_voucher').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: serverContext + '/loyalty/phoneCard/deleteVoucher',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('.alert-info').attr('style','display: block');
                $('#vouchersTable').DataTable().ajax.reload();
                
                resetForm();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('.alert-danger').attr('style','display: block');
            }
        });
    });

    $('#vouchersTable tbody').on( 'click', 'tr', function () {
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
            /*$('#createBtn').attr('disabled', true);*/
            /*$('#resetBtn').attr('disabled', false);*/
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Kích hoạt');
        } else if (data.status === 'INACTIVE') {
            $('#editBtn').attr('disabled', true);
            /*$('#createBtn').attr('disabled', true);*/
            /*$('#resetBtn').attr('disabled', true);*/
            $('#activateBtn').attr('disabled', false);
        } else {
            $('#editBtn').attr('disabled', false);
            /*$('#createBtn').attr('disabled', true);*/
            /*$('#resetBtn').attr('disabled', true);*/
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Hủy kích hoạt');
        }
        showDetails(data);
    });

    $('#activateBtn').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/loyalty/phoneCard/activateVoucher',
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
                $('#vouchersTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    $('#resetBtn').click(function(){
    	resetForm();
    });

    $('#close_info').click(function(){
        $('.alert-info').attr('style','display: none');
    });

    $('#close_error').click(function(){
        $('.alert-danger').attr('style','display: none');
    });

});