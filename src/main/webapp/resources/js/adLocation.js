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

    var table = $('#adLocationsTable').DataTable({
			sAjaxSource: serverContext + "/adLocations",
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
             { data: "flight.name" },
             { data: "creative.title" },
             { data: "lng" },
             { data: "lat" },
             { data: "address" },
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

    var showDetails = function (data) {
        $('#adLocationForm #flightId').val(data.flight.id);
        $('#adLocationForm #flightName').val(data.flight.name);
        $('#adLocationForm #creativeId').val(data.creative.id);
        $('#adLocationForm #creativeTitle').val(data.creative.title);
        $('#adLocationForm #name').val(data.name);
        $('#adLocationForm #lng').val(data.lng);
        $('#adLocationForm #lat').val(data.lat);
        $('#adLocationForm #address').val(data.address);
        $('#adLocationForm #adContent').val(data.adContent);
        $('#adLocationForm #id').val(data.id);
        $('#adLocationForm #status').val(data.status);
    };
    
    var resetForm = function () {
        $('#adLocationForm')[0].reset();
        $('#adLocationForm #id').val(null);
        $('#adLocationForm #flightId').val(null);
        $('#adLocationForm #creativeId').val(null);
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };

    // Edit record
    $('#adLocationsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#adLocationsTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#delete_adLocation').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: serverContext + '/deleteAdLocation',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('#delete-ad-info').attr('style','display: block');
                $('#adLocationsTable').DataTable().ajax.reload();
                
                resetForm();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('#delete-ad-error').attr('style','display: block');
            }
        });
    });

    $('#adLocationsTable tbody').on( 'click', 'tr', function () {
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
            $('#activateBtn').text('Kích hoạt');
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
        $('#modal-active-deactive').modal();
    });

    $('#active_deactive_adLocation').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/activateAdLocation',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                if (data.status === 'ACTIVE') {
                    $('#editBtn').attr('disabled', true);
                    $('#activateBtn').attr('disabled', false);
                    $('#activateBtn').text('Kích hoạt');
                } else {
                    $('#editBtn').attr('disabled', false);
                    $('#activateBtn').attr('disabled', false);
                    $('#activateBtn').text('Hủy kích hoạt');
                }

                resetForm();

                $('#adLocationsTable').DataTable().ajax.reload();
                $('#modal-active-deactive').modal('hide');
            },
            error: function(error) {
            }
        });
    });

    $('#resetBtn').click(function(){
    	resetForm();
    });

    $('#delete_adLocation_close_info').click(function(){
        $('#delete-adLocation-info').attr('style','display: none');
    });

    $('#delete_adLocation_close_error').click(function(){
        $('#delete-adLocation-error').attr('style','display: none');
    });
});