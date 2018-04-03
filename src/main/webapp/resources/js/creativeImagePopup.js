var creativeImagesTable = $('#creativeImagesTable').DataTable({
    sAjaxSource: serverContext + "/creativeImages",
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
        { data: "template" },
        { data: null,
            "render": function (data) {
                if (data.imageLink) {
                    return '<div><a href="#" data-image=' + data.imageLink + ' class="adImage">' + data.imageLink + '</a></div>';
                } else {
                    return '';
                }
            }
        },
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

var formatDate  = function (data) {
    if (data === null || data === '') return "";
    var date = new Date(data);
    return moment(date).format('DD/MM/YYYY HH:mm:ss');
}

$('#creativeImagesTable tbody').on( 'click', 'a.editor_choose', function (e) {
    e.preventDefault();
    $('#modal-choose-creative').modal('hide');
    var data = creativeImagesTable.row( $(this).parents('tr') ).data();
    $('#creativeId').val(data.id);
    $('#creativeTitle').val(data.title);
});

$('#modal-choose-creative').on('shown.bs.modal', function() {
    $('#creativeImagesTable').DataTable().columns.adjust();
    $(this).find('.modal-dialog').css({width:'80%',
        height:'auto', 'max-height':'100%'});

});

$('#creativeImagesTable').on('mouseenter', '.adImage', function() {
    var image_name=$(this).data('image');
    var imageTag='<div style="position:absolute;">'+'<img id="imagePreviewHover" src="' + image_name + '" alt="image" height="200" />'+'</div>';
    $(this).parent('div').append(imageTag);
    img = new Image();
    img.src = image_name;
    img.onload = function() {
        $('#imagePreviewHover').attr('width', this.width + 'px');
        $('#imagePreviewHover').attr('height', this.height + 'px');
    }
});

$('#creativeImagesTable').on('mouseleave', '.adImage', function() {
    $(this).parent('div').children('div').remove();
});