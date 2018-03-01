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

    var table = $('#messagesTable').DataTable({
        sAjaxSource: serverContext + "/content/inAppMessages",
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
            { data: "subject" },
            {   data: null,
                "render": function (data) {
                    if (data.type === 'PRIMARY') {
                        return 'Thường';
                    } else {
                        return 'Khuyến mại';
                    }
                }
            },
            { data: "body" },
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
                    return data.status === 'ACTIVE' ? '<a href="" class="sendMessage" title="Gửi tin nhắn"><i class="fa fa-fw fa-send"></i></a>' : '';
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
        $('#inAppMessageForm #subject').val(data.subject);
        CKEDITOR.instances.contentEditor.setData(data.body);
        $('#inAppMessageForm #id').val(data.id);
        $('#inAppMessageForm #status').val(data.status);
        $('#type option[value="' + data.type + '"]').attr('selected', true);
        $('#inAppMessageForm #userGender').val(data.userGender);
        $('#inAppMessageForm #userAgeFrom').val(data.userAgeFrom);
        $('#inAppMessageForm #userAgeTo').val(data.userAgeTo);
        if (data.userLocation) {
            var locations = data.userLocation.split(',');
            for (var i = 0; i < locations.length; i++) {
                $('#lstLocation option[value="' + locations[i] + '"]').attr('selected', true);
            }
        }
        if (data.userInterest) {
            var interests = data.userInterest.split(',');
            for (var i = 0; i < interests.length; i++) {
                $('#lstNewsCategory option[value="' + interests[i] + '"]').attr('selected', true);
            }
        }
    };

    var resetForm = function () {
        $('#inAppMessageForm')[0].reset();
        CKEDITOR.instances.contentEditor.setData("");
        $('#inAppMessageForm #id').val(null);
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };


    $('#messagesTable tbody').on( 'click', 'a.sendMessage', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-sendMessage').modal();
    });

    $('#sendMessageBtn').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: serverContext + '/content/sendMessage',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-sendMessage').modal('hide');
                $('#send-message-info').attr('style','display: block');
            },
            error: function(error) {
                $('#modal-sendMessage').modal('hide');
                $('#send-message-error').attr('style','display: block');
            }
        });
    });

    // Edit record
    $('#messagesTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#messagesTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#deleteMessageBtn').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: serverContext + '/deleteMessage',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('#delete-message-info').attr('style','display: block');
                $('#messagesTable').DataTable().ajax.reload();

                resetForm();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('#delete-ad-error').attr('style','display: block');
            }
        });
    });

    $('#messagesTable tbody').on( 'click', 'tr', function () {
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

    $('#active_deactive_in_app_message').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/content/activateMessage',
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

                $('#messagesTable').DataTable().ajax.reload();
                $('#modal-active-deactive').modal('hide');
            },
            error: function(error) {
            }
        });
    });

    $('#resetBtn').click(function(){
        resetForm();
    });

    $('#delete_message_close_info').click(function(){
        $('#delete-message-info').attr('style','display: none');
    });

    $('#delete_message_close_error').click(function(){
        $('#delete-message-error').attr('style','display: none');
    });

    $('#send_message_close_info').click(function(){
        $('#send-message-info').attr('style','display: none');
    });

    $('#send_message_close_error').click(function(){
        $('#send-message-error').attr('style','display: none');
    });
});