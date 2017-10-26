var adTypesTable = $('#adTypesTable').DataTable({
    sAjaxSource: serverContext + "/adTypes",
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
        { data: "id" },
        { data: "name" },
        { data: "width" },
        { data: "height"},
        {
            data: null,
            className: "center",
            "render": function (data) {
                return '<a href="" class="editor_choose"><i class="fa fa-fw fa-check"></i></a>';
            }
        }
    ]
});


$('#adTypesTable tbody').on( 'click', 'a.editor_choose', function (e) {
    e.preventDefault();
    $('#modal-choose-adType').modal('hide');
    var data = adTypesTable.row( $(this).parents('tr') ).data();
    $('#adTypeId').val(data.id);
    $('#adTypeName').val(data.name);
});

$('#modal-choose-adType').on('shown.bs.modal', function() {
    $('#adTypesTable').DataTable().columns.adjust();
    $(this).find('.modal-dialog').css({width:'40%',
        height:'auto', 'max-height':'100%'});

});