$(document).ready( function () {
    var data;
    $(function () {
        /*$('#editBtn').attr("disabled", true);*/
        $('#activateBtn').attr('disabled', true);
    });

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
             { data: "createdDate",
                 "type": "date",
                 "render": function (data) {
                     return formatFullDate(data);
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

    var showDetails = function (data) {
    	$('#campaignForm #id').val(data.id);
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
        $('#campaignForm #status').val(data.status);
    };
    
    var resetForm = function () {
        $('#campaignForm')[0].reset();
        $('#campaignForm #id').val(null);
        $('#campaignForm #advertiserId').val(null);
        
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };

    // Edit record
    $('#campaignsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
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
            /*$('#createBtn').attr('disabled', true);*/
            /*$('#resetBtn').attr('disabled', false);*/
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Kích hoạt');
        } else if (data.status === 'INACTIVE') {
            $('#editBtn').attr('disabled', true);
           /* $('#createBtn').attr('disabled', true);*/
            /*$('#resetBtn').attr('disabled', false);*/
            $('#activateBtn').attr('disabled', false);
        } else {
            $('#editBtn').attr('disabled', true);
           /* $('#createBtn').attr('disabled', true);*/
           /* $('#resetBtn').attr('disabled', false);*/
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
                if (data.status === 'NEW' || data.status === 'INACTIVE') {
                    $('#activateBtn').text('Hủy kích hoạt');
                } else {
                    $('#activateBtn').text('Kích hoạt');
                }
                
                resetForm();
                
                $('#campaignsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });
    
    $('#delete_campaign').click(function() {
    	 $.ajax({
             type: "DELETE",
             url: '/deleteCampaign/'+data.id,
             success: function (result) {
                 if (data.status === 'NEW') {
                     $('#activateBtn').text('Hủy kích hoạt');
                 } else {
                     $('#activateBtn').text('Kích hoạt');
                     $('#activateBtn').attr('disabled', true);
                 }
                 
                 location.reload();
             },
             error: function(error) {
            	 $('.alert-danger').attr('style','display: block');
                 /*alert(error);*/
             }
         });
    	 
    	 $('#modal-delete').modal('hide');
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
    	resetForm();
    });

    $('#close_info').click(function(){
        $('.alert-info').attr('style','display: none');
    });

    $('#close_error').click(function(){
        $('.alert-danger').attr('style','display: none');
    });
});