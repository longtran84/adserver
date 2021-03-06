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

    var table = $('#creativesTable').DataTable({
			sAjaxSource: serverContext + "/creativeVideos",
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
             {   data: null,
                 "render": function (data) {
                     return '<video class="videoLink" width="400" height="255" preload="auto" controls>' +
                                  '<source src="' + data.videoLink + '" type="video/mp4"></video>';
                 }
             },
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
                     if (data.status === 'NEW') {
                         return '<a href="" class="editor_edit"><i class="fa fa-fw fa-edit"></i></a>  <a href="" class="editor_remove"><i class="fa fa-fw fa-remove"></i></a>';
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
        $('#creativeForm #title').val(data.title);
        $('#creativeForm #body').val(data.body);
        $('#creativeForm #alt').val(data.alt);
        var lastIndex = data.videoLink.lastIndexOf("/");
        $('#creativeForm #videoName').val(data.videoLink.substring(lastIndex + 1));
        $('#creativeForm #id').val(data.id);
        $('#creativeForm #status').val(data.status);
    }; 
    
    var resetForm = function () {
        $('#creativeForm')[0].reset();
        
        $('#creativeForm #id').val(null);
        
        $('#editBtn').attr('disabled', false);
        $('#activateBtn').attr('disabled', true);
    };

    // Edit record
    $('#creativesTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        $('#editBtn').attr('disabled', false);
        /*$('#createBtn').attr('disabled', true);*/
        var data = table.row( $(this).parents('tr') ).data();
        showDetails(data);
    });

    // Delete a record
    $('#creativesTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });

    $('#delete_creative').click(function(){
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: serverContext + '/deleteCreative',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#modal-delete').modal('hide');
                $('.alert-info').attr('style','display: block');
                $('#creativesTable').DataTable().ajax.reload();
                
                resetForm();
            },
            error: function(error) {
                $('#modal-delete').modal('hide');
                $('.alert-danger').attr('style','display: block');
            }
        });
    });

    $('#creativesTable tbody').on( 'click', 'tr', function () {
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
           /* $('#resetBtn').attr('disabled', true);*/
            $('#activateBtn').attr('disabled', false);
            $('#activateBtn').text('Hủy kích hoạt');
        }
        showDetails(data);
    });

    $('#activateBtn').click(function(){
        $('#modal-active-deactive').modal();
    });

    $('#active_deactive_creativeVideo').click(function(){
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/activateCreative',
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

                $('#creativesTable').DataTable().ajax.reload();
                $('#modal-active-deactive').modal('hide');
            },
            error: function(error) {
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

    $('#videoFileBtn').on('click', function(e){
        e.preventDefault();
        $('#videoFile').click();
    });

    $('#videoFile').on('change', function () {
        var files = this.files;
        if (!files.length) {
            return;
        }
        var validExtensions = ['mp4', 'mpeg'];
        var fileName = files[0].name;
        var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1).toLowerCase();
        if (($.inArray(fileNameExt, validExtensions) == -1) || (this.files[0].size/1024 > 2000)) {
            $('#modal-file-error').modal();
            return;
        }
        $('#videoName').val(fileName);
    });

});