var data;
$(document).ready( function () {
    $(function () {
        var token = $("input[name='_csrf']").val();
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $('#editBtn').attr("disabled", true);
        //$('#flightForm #startDate').val(reFormatDate($('#flightForm #startDate').val()));
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
        var month = date.getMonth() + 1;
        return (date.getDate().length > 1 ? date.getDate() : "0" + date.getDate()) + "/" + (month.length > 1 ? month : "0" + month) + "/" + date.getFullYear();
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
             { data: "status" },
             {
                 data: null,
                 className: "center",
                 defaultContent: '<a href="" class="editor_edit">Sửa</a> / <a href="" class="editor_remove">Xóa</a>'
             }
         ]
	 });

    // Edit record
    $('#adsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        $('#createBtn').attr('disabled', true);
        var data = table.row( $(this).parents('tr') ).data();
        $('#adForm #flightId').val(data.flight.id);
        $('#adForm #flightName').val(data.flight.name);
        $('#adForm #creativeId').val(data.creative.id);
        $('#adForm #creativeTitle').val(data.creative.title);
        $('#adForm #name').val(data.name);
        $('#adForm #impressions').val(data.impressions);
        $('#adForm #isFreCapTmp').prop('checked', data.isFreCap == 1 ? true : false);
        $('#adForm .icheckbox_minimal-blue').removeClass('checked');
        $('#adForm .icheckbox_minimal-blue').addClass(data.isFreCap == 1 ? 'checked' : '');
        $('#adForm #freCap').val(data.freCap);
        $('#adForm #freCapDuration').val(data.freCapDuration);
        $('#adForm #freCapType').val(data.freCapType);
        $('#adForm #description').val(data.description);
        $('#adForm #id').val(data.id);
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
                $('.alert-info').attr('style','display: block');
                $('#adsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('.alert-danger').attr('style','display: block');
            }
        });
    });

    $('#resetBtn').click(function(){
        $('#adForm')[0].reset();
    });

    $('#close_info').click(function(){
        $('.alert-info').attr('style','display: none');
    });

    $('#close_error').click(function(){
        $('.alert-danger').attr('style','display: none');
    });
});