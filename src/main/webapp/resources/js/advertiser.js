$(document).ready( function () {
    var data;
    /*$(function () {
        $('#editBtn').attr("disabled", true);
    });*/

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

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
             { data: "createdDate",
                 "type": "date",
                 "render": function (data) {
                     return formatDate(data);
                 }
             },
             { data: null,
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
                         return '<a href="" class="editor_edit"><i class="fa fa-fw fa-edit"></i></a>   <a href="" class="editor_remove"><i class="fa fa-fw fa-remove"></i></a>';
                     } else if(data.status === 'ACTIVE') {
                         return '<a href="" class="editor_edit"><i class="fa fa-fw fa-edit"></i></a>';
                     } else {
                         return '';
                     }
                 }
             }
         ]
	 });

    // Edit record
    $('#advertisersTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        /*$('#editBtn').attr('disabled', false);*/
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        $('#advertiserForm')[0].reset();
        showDetails(data);
    });
    
    $('#advertisersTable tbody').on( 'click', 'tr', function () {
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
            $('#editBtn').attr('disabled', false);
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Hủy kích hoạt');
        }
        showDetails(data);
    });
    
    var showDetails = function (data) {
        $('#advertiserForm #email').val(data.email);
        $('#advertiserForm #password').val(data.password);
        $('#advertiserForm #passwordConfirm').val(data.password);
        $('#advertiserForm #fullName').val(data.fullName);
        $('#advertiserForm #phone').val(data.phone);
        $('#advertiserForm #companyName').val(data.companyName);
        $('#advertiserForm #charge').val(data.charge);
        $('#advertiserForm #id').val(data.id);
        $('#advertiserForm #status').val(data.status);
    }

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
                
                $('#advertiserForm')[0].reset();
                
                $('#advertisersTable').DataTable().ajax.reload();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('.alert-danger').attr('style','display: block');
            }
        });
    });

    var resetForm = function () {
        $('#advertiserForm')[0].reset();
        $('#advertiserForm #id').val(null);
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };

    $('#activateBtn').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: '/activateAdvertiser',
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

                $('#advertisersTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
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