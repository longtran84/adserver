$(document).ready( function () {
    var dateFrom = getCurrentDate();
    var dateTo = getCurrentDate();

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

    var table = $('#ordersTable').DataTable({
        "ajax": {
            'type': 'POST',
            'url': serverContext + '/loyalty/orders',
            'contentType': 'application/json',
            'data': function() {
                return JSON.stringify({dateFrom: dateFrom, dateTo: dateTo});
            },
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
            { data: "id"},
            { data: "userMobile.username"},
            {   data: null,
                "render": function (data) {
                    if (data.voucher) {
                        return data.voucher.name;
                    } else if (data.phoneCard) {
                        return data.phoneCard.name;
                    } if (data.gameCard) {
                        return data.gameCard.name;
                    } else {
                        return data.giftCode.name;
                    }
                }
            },
            { data: "quantity",
              render: $.fn.dataTable.render.number( '.')
            },
            { data: "price",
                render: $.fn.dataTable.render.number( '.')
            },
            { data: "total",
                render: $.fn.dataTable.render.number( '.')
            },
            { data: "customerName"},
            { data: "address"},
            { data: "phone"},
            {   data: null,
                "render": function (data) {
                    if (data.status === 'NEW') {
                        return 'Mới';
                    } else if (data.status === 'PROCESSING') {
                        return 'Đang xử lý';
                    } else if (data.status === 'SUCCESS') {
                        return 'Đã giao thành công';
                    } else {
                        return 'Đã đóng';
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
                        return '<a href="" class="editor_process" title="Xử lý"><i class="fa fa-fw fa-hand-paper-o"></i></a>';
                    } else if(data.status === 'PROCESSING') {
                        return '<a href="" class="editor_success" title="Giao hàng"><i class="fa fa-fw fa-mail-forward"></i></a>';
                    } else if(data.status === 'SUCCESS') {
                        return '<a href="" class="editor_close" title="Đóng"><i class="fa fa-fw fa-power-off"></i></a>';
                    } else {
                        return '';
                    }
                }
            }
        ]
    });

    // Process an order
    $('#ordersTable tbody').on( 'click', 'a.editor_process', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + 'order/process',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#ordersTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    // Ship success an order
    $('#ordersTable tbody').on( 'click', 'a.editor_success', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        var request = {id: data.id, status: data.status, total:data.total};
        $.ajax({
            type: "POST",
            url: serverContext + 'order/success',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#ordersTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    // Close an order
    $('#ordersTable tbody').on( 'click', 'a.editor_close', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        var request = {id: data.id, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + 'order/close',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                $('#ordersTable').DataTable().ajax.reload();
            },
            error: function(error) {
                alert(error);
            }
        });
    });

    //Date range as a button
    moment.locale('vi');
    function setDaterange(start, end) {
        $('#daterange-btn span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'))
        dateFrom = start.format('DD/MM/YYYY');
        dateTo = end.format('DD/MM/YYYY');
        $('#ordersTable').DataTable().ajax.reload();
    }

    var start = moment();
    var end = moment();

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
            startDate: start,
            endDate  : end
        },
        setDaterange
    )
    setDaterange(start, end);
});