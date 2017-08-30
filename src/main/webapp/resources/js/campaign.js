var data;
$(document).ready( function () {
    $(function () {
        var token = $("input[name='_csrf']").val();
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        $('#editBtn').attr("disabled", true);
        $('#campaignForm #startDate').val(reFormatDate($('#campaignForm #startDate').val()));
    });

    var reFormatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = $('#campaignForm #startDate').datepicker('getDate');
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

    var table = $('#campaignsTable').DataTable({
			sAjaxSource: "/campaigns",
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
             { data: "status" },
             {
                 data: null,
                 className: "center",
                 defaultContent: '<a href="" class="editor_edit">Sửa</a> / <a href="" class="editor_remove">Xóa</a>'
             }
         ]
	 });

    // Edit record
    $('#campaignsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        $('#createBtn').attr('disabled', true);
        var data = table.row( $(this).parents('tr') ).data();
        $('#campaignForm #advertiserId').val(data.advertiser.id);
        $('#campaignForm #advertiserName').val(data.advertiser.email);
        $('#campaignForm #name').val(data.name);
        $('#campaignForm #startDate').val(formatDate(data.startDate));
        $('#campaignForm #endDate').val(formatDate(data.endDate));
        $('#campaignForm #isFreCapTmp').prop('checked', data.isFreCap == 1 ? true : false);
        $('#campaignForm .icheckbox_minimal-blue').removeClass('checked');
        $('#campaignForm .icheckbox_minimal-blue').addClass(data.isFreCap == 1 ? 'checked' : '');
        $('#campaignForm #freCap').val(data.freCap);
        $('#campaignForm #freCapDuration').val(data.freCapDuration);
        $('#campaignForm #freCapType').val(data.freCapType);
    });

    // Delete a record
    $('#advertisersTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
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
});