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
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

    var table = $('#adsTable').DataTable({
			sAjaxSource: "/ads",
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
             { data: "impressions" },
             { data: "flight.name" },
             { data: "creative.title" },
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
                	 return data.status === 'ACTIVE' ? '<a href="" class="pushAd" title="Gửi quảng cáo"><i class="fa fa-fw fa-send"></i></a>' : '';
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
        $('#adForm #flightId').val(data.flight.id);
        $('#adForm #flightName').val(data.flight.name);
        $('#adForm #creativeId').val(data.creative.id);
        $('#adForm #creativeTitle').val(data.creative.title);
        $('#adForm #name').val(data.name);
        $('#adForm #impressions').val(data.impressions);
        $('#adForm #isFreCap').prop('checked', data.isFreCap == 1 ? true : false);
        $('#adForm .icheckbox_minimal-blue').removeClass('checked');
        $('#adForm .icheckbox_minimal-blue').addClass(data.isFreCap == 1 ? 'checked' : '');
        $('#adForm #freCap').val(data.freCap);
        $('#adForm #freCapDuration').val(data.freCapDuration);
        $('#adForm #freCapType').val(data.freCapType);
        $('#adForm #description').val(data.description);
        $('#adForm #id').val(data.id);
        $('#adForm #status').val(data.status);
    };
    
    var resetForm = function () {
        $('#adForm')[0].reset();
        
        $('#adForm #id').val(null);
        $('#adForm #flightId').val(null);
        $('#adForm #creativeId').val(null);
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };


    $('#adsTable tbody').on( 'click', 'a.pushAd', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-pushAd').modal();
    });

    $('#pushAdBtn').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: '/pushAd',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-pushAd').modal('hide');
                $('#push-ad-info').attr('style','display: block');
            },
            error: function(error) {
                $('#modal-pushAd').modal('hide');
                $('#push-ad-error').attr('style','display: block');
            }
        });
    });

    // Edit record
    $('#adsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#adsTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#delete_ad').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: '/deleteAd',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('#delete-ad-info').attr('style','display: block');
                $('#adsTable').DataTable().ajax.reload();
                
                resetForm();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('#delete-ad-error').attr('style','display: block');
            }
        });
    });

    $('#adsTable tbody').on( 'click', 'tr', function () {
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
            url: '/activateAd',
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
                $('#adsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    $('#resetBtn').click(function(){
    	resetForm();
    });

    $('#delete_ad_close_info').click(function(){
        $('#delete-ad-info').attr('style','display: none');
    });

    $('#delete_ad_close_error').click(function(){
        $('#delete-ad-error').attr('style','display: none');
    });

    $('#push_ad_close_info').click(function(){
        $('#push-ad-info').attr('style','display: none');
    });

    $('#push_ad_close_error').click(function(){
        $('#push-ad-error').attr('style','display: none');
    });
});