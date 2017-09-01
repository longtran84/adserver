var creativesTable = $('#creativesTable').DataTable({
    sAjaxSource: "/creatives",
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
        { data: "title" },
        { data: "advertiser.email" },
        { data: "template" },
        { data: "imageLink" },
        { data: "videoLink" },
        { data: "status" },
        {
            data: null,
            className: "center",
            defaultContent: '<a href="" class="editor_choose">Chọn</a>'
        }
    ]
});

var formatDate  = function (data) {
    if (data === null || data === '') return "";
    var date = new Date(data);
    var month = date.getMonth() + 1;
    return (date.getDate().length > 1 ? date.getDate() : "0" + date.getDate()) + "/" + (month.length > 1 ? month : "0" + month) + "/" + date.getFullYear();
}

$('#creativesTable tbody').on( 'click', 'a.editor_choose', function (e) {
    e.preventDefault();
    $('#modal-choose-creative').modal('hide');
    var data = creativesTable.row( $(this).parents('tr') ).data();
    $('#creativeId').val(data.id);
    $('#creativeTitle').val(data.title);
});

$('#modal-choose-creative').on('shown.bs.modal', function() {
    $('#creativesTable').DataTable().columns.adjust();
    $(this).find('.modal-dialog').css({width:'60%',
        height:'auto', 'max-height':'100%'});

});