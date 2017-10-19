$(document).ready( function () {
    var data;
    $(function () {
        /*$('#editBtn').attr("disabled", true);*/
        $('#activateBtn').attr('disabled', true);
    });

    var reFormatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = $('#flightForm #startDate').datepicker('getDate');
        var month = date.getMonth() + 1;
        var day = date.getDate();
        var year = date.getFullYear();
        var formattedDate = month + '/' + day + '/' + year;
        return formattedDate;
    }

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY');
    }

    var formatFullDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

    var table = $('#flightsTable').DataTable({
			sAjaxSource: "/flights",
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
             { data: "campaign.name" },
             { data: "startDate",
                 "type": "date",
                 "render": function (data) {
                     return formatDate(data);
                 }
             },
             { data: "endDate",
                 "type": "date",
                 "render": function (data) {
                     return formatDate(data);
                 }
             },
             { data: "createdDate",
                 "type": "date",
                 "render": function (data) {
                     return formatFullDate(data);
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
    	$('#flightForm #id').val(data.id);
        $('#flightForm #campaignId').val(data.campaign.id);
        $('#flightForm #campaignName').val(data.campaign.name);
        $('#flightForm #name').val(data.name);
        $('#flightForm #startDate').val(formatDate(data.startDate));
        $('#flightForm #endDate').val(formatDate(data.endDate));
        $('#flightForm #isFreCap').prop('checked', data.isFreCap == 1 ? true : false);
        $('#flightForm .icheckbox_minimal-blue').removeClass('checked');
        $('#flightForm .icheckbox_minimal-blue').addClass(data.isFreCap == 1 ? 'checked' : '');
        $('#flightForm #freCap').val(data.freCap);
        $('#flightForm #freCapDuration').val(data.freCapDuration);
        $('#flightForm #freCapType').val(data.freCapType);
        $('#flightForm #price').val(data.price);
        $('#flightForm #status').val(data.status);
        $('#flightForm #userGender').val(data.userGender);
        $('#flightForm #userAgeFrom').val(data.userAgeFrom);
        $('#flightForm #userAgeTo').val(data.userAgeTo);
        var locations = data.userLocation.split(',');
        for (var i = 0; i < locations.length; i++) {
            $('#lstLocation option[value="' + locations[i] + '"]').attr('selected', true);
        }
    };
    
    var resetForm = function () {
        $('#flightForm')[0].reset();
        $('#flightForm #campaignId').val(null);
        $('#flightForm #id').val(null);
        
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };

    // Edit record
    $('#flightsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#flightsTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });
    
    $('#delete_flight').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            /*headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }*/
            url: '/deleteFlight',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('.alert-info').attr('style','display: block');
                
                resetForm();
                $('#flightsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('.alert-danger').attr('style','display: block');
            }
        });
    });

    $('#flightsTable tbody').on( 'click', 'tr', function () {
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
            url: '/activateFlight',
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
                $('#flightsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    $('#startDate').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy',
        language: 'vi'
    })

    $('#endDate').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy',
        language: 'vi'
    })

    $('#resetBtn').click(function(){
    	resetForm();
    });

    $('#close_info').click(function(){
        $('.alert-info').attr('style','display: none');
    });

    $('#close_error').click(function(){
        $('.alert-danger').attr('style','display: none');
    });

    // Customer target
    $('#btnRight').click(function (e) {
        var selectedOpts = $('#lstLocation1 option:selected');
        if (selectedOpts.length == 0) {
            alert("Chưa chọn địa chỉ.");
            e.preventDefault();
        }

        $('#lstLocation2').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });

    $('#btnAllRight').click(function (e) {
        var selectedOpts = $('#lstLocation1 option');
        if (selectedOpts.length == 0) {
            alert("Chưa chọn địa chỉ.");
            e.preventDefault();
        }

        $('#lstLocation2').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });

    $('#btnLeft').click(function (e) {
        var selectedOpts = $('#lstLocation2 option:selected');
        if (selectedOpts.length == 0) {
            alert("Chưa chọn địa chỉ.");
            e.preventDefault();
        }

        $('#lstLocation1').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });

    $('#btnAllLeft').click(function (e) {
        var selectedOpts = $('#lstLocation2 option');
        if (selectedOpts.length == 0) {
            alert("Nothing to move.");
            e.preventDefault();
        }

        $('#lstLocation1').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });
});