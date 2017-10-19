var categoriesTable = $('#categoriesTable').DataTable({
    sAjaxSource: "/content/categories",
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
        { data: "code" },
        { data: "name" },
        { data: null,
            "render": function (data) {
                if (data.image !== null) {
                    return '<img src="'+ data.image + '" alt="image" height="200" />';
                } else {
                    return '<img src="/images/no-image.png" alt="image" height="200" />';
                }
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
                if (data.status === 'ACTIVE') {
                    return '<a href="" class="editor_choose"><i class="fa fa-fw fa-check"></i></a>';
                } else {
                    return '';
                }
            }
        }
    ]
});

$('#categoriesTable tbody').on( 'click', 'a.editor_choose', function (e) {
    e.preventDefault();
    $('#modal-choose-category').modal('hide');
    var data = categoriesTable.row( $(this).parents('tr') ).data();
    $('#categoryId').val(data.id);
    $('#categoryName').val(data.name);
});

$('#modal-choose-category').on('shown.bs.modal', function() {
    $('#categoriesTable').DataTable().columns.adjust();
    $(this).find('.modal-dialog').css({width:'60%',
        height:'auto', 'max-height':'100%'});

});