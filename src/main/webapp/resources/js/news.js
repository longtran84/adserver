$(document).ready( function () {

    $('#imageFileBtn').on('click', function(e){
        e.preventDefault();
        $('#imageFile').click();
    });

    $('#imageFile').on('change', function () {
        var files = this.files;
        if (!files.length) {
            return;
        }
        var validExtensions = ['jpg','png','gif'];
        var fileName = files[0].name;
        var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1).toLowerCase();
        /*if (($.inArray(fileNameExt, validExtensions) == -1) || (this.files[0].size/1024 > 150)) {
            $('#modal-file-error').modal();
            return;
        }*/
        $('#imageName').val(fileName);
    });

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

    var table = $('#newsTable').DataTable({
        sAjaxSource: "/content/newsList",
        sAjaxDataProp: "",
        responsive: true,
        order: [[ 0, "asc" ]],
        language: {
            "zeroRecords": "Không tìm thấy bản ghi nào",
            "info": "Hiện thị trang _PAGE_ của _PAGES_",
            "infoFiltered": "",
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
            { data: null,
              "render": function (data) {
                  return '<a href=/newsDetail?newsId=' + data.id + ' class="link"><i class="fa fa-fw fa-link"></i></a>';
              }
            },
            { data: "source" },
            { data: "newsCategory.name" },
            { data: null,
                "render": function (data) {
                    if (data.status === 'NEW') {
                        return 'Mới';
                    } else if (data.status === 'ACTIVE') {
                        return 'Xuất bản';
                    } else {
                        return 'Không xuất bản';
                    }
                }
            },
            { data: "createdDate",
                "type": "date",
                "render": function (data) {
                    return formatDate(data);
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
        $('#newsForm #id').val(data.id);
        $('#newsForm #status').val(data.status);
        $('#newsForm #categoryId').val(data.newsCategory.id);
        $('#newsForm #categoryName').val(data.newsCategory.name);
        $('#newsForm #title').val(data.title);
        $('#newsForm #shortDescription').val(data.shortDescription);
        CKEDITOR.instances.contentEditor.setData(data.content);
        var lastIndex = data.imageLink.lastIndexOf("/");
        $('#newsForm #imageName').val(data.imageLink.substring(lastIndex + 1));
        $('#newsForm #source').val(data.source);
    };

    var resetForm = function () {
        $('#newsForm')[0].reset();
        $('#newsForm #id').val(null);
        $('#newsForm #categoryId').val(null);
        CKEDITOR.instances.contentEditor.setData("");
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };

    // Edit record
    $('#newsTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#newsTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#newsTable tbody').on( 'click', 'tr', function () {
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
            $('#activateBtn').text('Xuất bản');
        } else if (data.status === 'INACTIVE') {
            $('#editBtn').attr('disabled', true);
            /* $('#createBtn').attr('disabled', true);*/
            /*$('#resetBtn').attr('disabled', false);*/
            $('#activateBtn').attr('disabled', false);
        } else {
            $('#editBtn').attr('disabled', false);
            /* $('#createBtn').attr('disabled', true);*/
            /* $('#resetBtn').attr('disabled', false);*/
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Không xuất bản');
        }
        showDetails(data);
    } );

    $('#newsTable tbody').on( 'click', 'a.link', function (e) {
        e.preventDefault();
        var url = $(this).attr('href');
        var leftPosition, topPosition;
        var width = 800, height = 900
        //Allow for borders.
        leftPosition = Number((screen.width / 2) - ((width / 2) + 10));
        //Allow for title and status bars.
        topPosition = Number((screen.height / 2) - ((height / 2) + 50));
        window.open(url, 'SMA', 'width=' + width + ',height=' + height + ',resizable=no,toolbar=no,menubar=no,location=no,status=no,left='
                    + leftPosition + ',top=' + topPosition);
    });

    $('#activateBtn').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: '/activateNews',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                if (data.status === 'NEW' || data.status === 'INACTIVE') {
                    $('#activateBtn').text('Không xuất bản');
                } else {
                    $('#activateBtn').text('Xuất bản');
                }

                resetForm();

                $('#newsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    $('#delete_news').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: '/deleteNews',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('.alert-info').attr('style','display: block');
                $('#newsTable').DataTable().ajax.reload();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('.alert-danger').attr('style','display: block');
            }
        });
    });

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