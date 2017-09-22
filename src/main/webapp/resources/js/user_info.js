$(document).ready( function () {
    var dateFrom = getCurrentDate();
    var dateTo = getCurrentDate();
    var data;

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

    function getCurrentDate() {
        var date = new Date();
        var month = date.getMonth() + 1;
        return (date.getDate() > 9 ? date.getDate() : "0" + date.getDate()) + "/" + (month > 9 ? month : "0" + month) + "/" + date.getFullYear();
    }

    var table = $('#userMobilesTable').DataTable({
        "ajax": {
            'type': 'POST',
            'url': '/user/userInfos',
            'contentType': 'application/json',
            'data': function() {
                return JSON.stringify({dateFrom: dateFrom, dateTo: dateTo});
            },
        },
        sAjaxDataProp: "",
        responsive: true,
        order: [[ 0, "asc" ]],
        scrollX: true,
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
            { data: "id" },
            { data: "username" },
            {
              data: null,
              className: "center",
              "render": function (data) {
                if (data.gender === 'MALE') {
                    return 'Nam';
                } else {
                    return 'Nữ';
                }
              }
            },
            {
              data: null,
              className: "center",
              "render": function (data) {
                return 2017 - data.dob;
              }
            },
            { data: "location" },
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
            { data: "earning",
              render: $.fn.dataTable.render.number( '.')
            },
            { data: "interests" },
            { data: "devices" },
            { data: "userInvite" },
            { data: "inviteCodeUsed" },
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

    function updateStatus() {
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: '/user/activate',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#userMobilesTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    }

    $('#userMobilesTable tbody').on( 'click', 'a.deactivateUser', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-deactivate').modal();
    });

    $('#userMobilesTable tbody').on( 'click', 'a.activateUser', function (e) {
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

    //Date range as a button
    moment.locale('vi');
    $('#daterange-btn').daterangepicker(
        {
            locale: {
                "applyLabel": "Chọn",
                "cancelLabel": "Hủy",
                "customRangeLabel": "Tùy chọn",
            },
            ranges   : {
                'Ngày hôm nay'       : [moment(), moment()],
                'Ngày hôm qua'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                '7 ngày' : [moment().subtract(6, 'days'), moment()],
                '30 ngày': [moment().subtract(29, 'days'), moment()],
                'Tháng này'  : [moment().startOf('month'), moment().endOf('month')],
                'Tháng trước'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            startDate: moment(),
            endDate  : moment()
        },
        function (start, end) {
            $('#daterange-btn span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'))
            dateFrom = start.format('DD/MM/YYYY');
            dateTo = end.format('DD/MM/YYYY');
            $('#userMobilesTable').DataTable().ajax.reload();
        }
    )
});