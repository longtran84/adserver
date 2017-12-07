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
                    } else if (data.status === 'APPROVED') {
                        return 'Đã phê duyệt';
                    } else if (data.status === 'SUCCESSFUL') {
                        return 'Đã giao thành công';
                    } else if (data.status === 'FAIL') {
                        return 'Giao không thành công';
                    } else if (data.status === 'CANCELLED') {
                        return 'Đã hủy';
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
                    if(data.status === 'NEW') {
                        return '<a href="" class="editor_process" title="Xử lý"><i class="fa fa-fw fa-hand-lizard-o"></i></a>';
                    } else if(data.status === 'PROCESSING') {
                        return '<a href="" class="editor_approve" title="Phê duyệt"><i class="fa fa-fw fa-hand-paper-o"></i></a> | <a href="" class="editor_cancel" title="Hủy"><i class="fa fa-fw fa-ban"></i></a>';
                    } else if(data.status === 'CANCELLED') {
                        return '<a href="" class="editor_close" title="Đóng"><i class="fa fa-fw fa-power-off"></i></a>';
                    } else if(data.status === 'APPROVED') {
                        return '<a href="" class="editor_shipsuccess" title="Giao thành công"><i class="fa fa-fw fa-car"></i></a> | <a href="" class="editor_shipfail" title="Giao không thành công"><i class="fa fa-fw fa-hand-paper-o"></i></a>';
                    } else if(data.status === 'SUCCESSFUL' || data.status === 'FAIL') {
                        return '<a href="" class="editor_close" title="Đóng"><i class="fa fa-fw fa-power-off"></i></a>';
                    } else {
                        return '';
                    }
                }
            }
        ]
    });

    // Approve an order
    $('#ordersTable tbody').on( 'click', 'a.editor_approve', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        var request = {id: data.id, processInstanceId: data.processInstanceId, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/loyalty/order/approve',
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

    // Cancel an order
    $('#ordersTable tbody').on( 'click', 'a.editor_cancel', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        var request = {id: data.id, processInstanceId: data.processInstanceId, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/loyalty/order/cancel',
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
    $('#ordersTable tbody').on( 'click', 'a.editor_shipsuccess', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        var request = {id: data.id, processInstanceId: data.processInstanceId, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/loyalty/order/shipSuccess',
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
    $('#ordersTable tbody').on( 'click', 'a.editor_shipfail', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        var request = {id: data.id, processInstanceId: data.processInstanceId, status: data.status};
        $.ajax({
            type: "POST",
            url: serverContext + '/loyalty/order/shipFail',
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
    $('#ordersTable tbody').on( 'click', 'a.editor_process', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        var request = {id: data.id};
        $.ajax({
            type: "POST",
            url: serverContext + '/loyalty/order/process',
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
        var request = {id: data.id, processInstanceId: data.processInstanceId, status: data.status};
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