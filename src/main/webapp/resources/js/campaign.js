$(document).ready( function () {
    var data;
    $(function () {
        $('#editBtn').attr("disabled", true);
        $('#activateBtn').attr('disabled', true);
    });

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        var month = date.getMonth() + 1;
        return (date.getDate() > 9 ? date.getDate() : "0" + date.getDate()) + "/" + (month > 9 ? month : "0" + month) + "/" + date.getFullYear();
    }

    var abc = {id:1,name:'abc'};
    var table = $('#campaignsTable').DataTable({
        "ajax": {
            'type': 'POST',
            'url': '/campaigns',
            'data': function() {
                return JSON.stringify(abc);
            },
            'dataType': 'json',
            'contentType': 'application/json'
             },
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
             { data: "advertiser.email" },
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
                         return '<a href="" class="editor_edit">Sửa</a> / <a href="" class="editor_remove">Xóa</a>';
                     } else if (data.status === 'INACTIVE') {
                         return '<a href="" class="editor_remove">Xóa</a>';
                     } else {
                         return '';
                     }
                 }
             }
         ]
	 });

    var showDetails = function (data) {
        $('#campaignForm #advertiserId').val(data.advertiser.id);
        $('#campaignForm #advertiserName').val(data.advertiser.email);
        $('#campaignForm #name').val(data.name);
        $('#campaignForm #startDate').val(formatDate(data.startDate));
        $('#campaignForm #endDate').val(formatDate(data.endDate));
        $('#campaignForm #isFreCap').prop('checked', data.isFreCap == 1 ? true : false);
        $('#campaignForm .icheckbox_minimal-blue').removeClass('checked');
        $('#campaignForm .icheckbox_minimal-blue').addClass(data.isFreCap == 1 ? 'checked' : '');
        $('#campaignForm #freCap').val(data.freCap);
        $('#campaignForm #freCapDuration').val(data.freCapDuration);
        $('#campaignForm #freCapType').val(data.freCapType);
        $('#campaignForm #description').val(data.description);
    }

    // Edit record
    $('#campaignsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        $('#createBtn').attr('disabled', true);
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#campaignsTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#campaignsTable tbody').on( 'click', 'tr', function () {
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
    } );

    $('#activateBtn').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: '/activateCampaign',
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
                $('#campaignsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    $("#isFreCapTmp").click( function(){
        if( $(this).is(':checked') ) alert("checked");
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
        $('#campaignForm')[0].reset();
    });

    $('#close_info').click(function(){
        $('.alert-info').attr('style','display: none');
    });

    $('#close_error').click(function(){
        $('.alert-danger').attr('style','display: none');
    });
});