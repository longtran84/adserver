var formatDate  = function (data) {
    if (data === null || data === '') return "";
    var date = new Date(data);
    return moment(date).format('DD/MM/YYYY HH:mm:ss');
}

var advertisersTable = $('#advertisersTable').DataTable({
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
                if (data.status === 'ACTIVE') {
                    return '<a href="" class="editor_choose"><i class="fa fa-fw fa-check"></i></a>';
                } else {
                    return '';
                }
            }
        }
    ]
});

$('#advertisersTable tbody').on( 'click', 'a.editor_choose', function (e) {
    e.preventDefault();
    $('#modal-choose-advertiser').modal('hide');
    var data = advertisersTable.row( $(this).parents('tr') ).data();
    $('#advertiserId').val(data.id);
    $('#advertiserName').val(data.email);
});

$('#modal-choose-advertiser').on('shown.bs.modal', function() {
    $('#advertisersTable').DataTable().columns.adjust();
    $(this).find('.modal-dialog').css({width:'60%',
        height:'auto', 'max-height':'100%'});

});