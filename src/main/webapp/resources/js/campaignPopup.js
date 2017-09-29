var abc = {id:1,name:'abc'};
var campaignsTable = $('#campaignsTable').DataTable({
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
        { data: "status" },
        {
            data: null,
            className: "center",
            "render": function (data) {
                if (data.status === 'ACTIVE') {
                    return '<a href="" class="editor_choose"><i class="fa fa-fw fa-check"></i></a>';
                } else {
                    return '';
                }
            }
        }
    ]
});

var formatDate  = function (data) {
    if (data === null || data === '') return "";
    var date = new Date(data);
    var month = date.getMonth() + 1;
    return (date.getDate().length > 1 ? date.getDate() : "0" + date.getDate()) + "/" + (month > 9 ? month : "0" + month) + "/" + date.getFullYear();
}

$('#campaignsTable tbody').on( 'click', 'a.editor_choose', function (e) {
    e.preventDefault();
    $('#modal-choose-campaign').modal('hide');
    var data = campaignsTable.row( $(this).parents('tr') ).data();
    $('#campaignId').val(data.id);
    $('#campaignName').val(data.name);
});

$('#modal-choose-campaign').on('shown.bs.modal', function() {
    $('#campaignsTable').DataTable().columns.adjust();
    $(this).find('.modal-dialog').css({width:'60%',
        height:'auto', 'max-height':'100%'});

});