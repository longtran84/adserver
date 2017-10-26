$(document).ready( function () {
    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

    var table = $('#adminsTable').DataTable({
        sAjaxSource: serverContext + "/system/admins",
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
            { data: "username" },
            { data: null,
                "render": function (data) {
                    if (data.status === 'ACTIVE') {
                        return 'Đang hoạt động';
                    } else {
                        return 'Không hoạt động';
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
                    if (data.role.name == 'ROLE_SUPER_ADMIN') {
                        return '<input name="superAdmin" type="checkbox" checked>';
                    } else {
                        return '<input name="superAdmin" type="checkbox">';
                    }
                }
            },
            {
                data: null,
                className: "center",
                "render": function (data) {
                    if (data.status === 'ACTIVE') {
                        return '<a href="" class="deactivateUser" title="Hủy bỏ"><i class="fa fa-fw fa-user-times"></i></a>';
                    } else {
                        return '<a href="" class="activateUser" title="Kích hoạt"><i class="fa fa-fw fa-user"></i></a>';
                    }
                }
            }
        ]
    });

    $('#adminsTable tbody').on( 'click', 'input[name="superAdmin"]', function (e) {
        var isChecked = $(this).is(":checked");
        var data = table.row( $(this).parents('tr') ).data();
        var role;
        if (isChecked) {
            role = 'ROLE_SUPER_ADMIN';
        } else {
            role = 'ROLE_ADMIN';
        }
        var request = {username: data.username, role:role};
        $.ajax({
            type: "POST",
            url: serverContext + '/system/updateUserRole',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#update-role-info').attr('style','display: block');
            },
            error: function(error) {
                $('#update-role-error').attr('style','display: block');
            }
        });
    });

    function updateStatus() {
        var request = {username: data.username, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/system/activateUser',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#adminsTable').DataTable().ajax.reload();
                $('#update-status-info').attr('style','display: block');
            },
            error: function(error) {
                $('#update-status-error').attr('style','display: block');
            }
        });
    }

    $('#adminsTable tbody').on( 'click', 'a.deactivateUser', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-deactivate').modal();
    });

    $('#adminsTable tbody').on( 'click', 'a.activateUser', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-activate').modal();
    });

    $('#deactivateUserBtn').click(function(){
        $('#modal-deactivate').modal('hide');
        updateStatus();
    });

    $('#activateUserBtn').click(function(){
        $('#modal-activate').modal('hide');
        updateStatus();
    });

    $('#update_role_close_info').click(function(){
        $('#update-role-info').attr('style','display: none');
    });

    $('#update_role_close_error').click(function(){
        $('#update-role-error').attr('style','display: none');
    });

    $('#update_status_close_info').click(function(){
        $('#update-status-info').attr('style','display: none');
    });

    $('#update_status_close_error').click(function(){
        $('#update-status-error').attr('style','display: none');
    });
});