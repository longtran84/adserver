$(document).ready( function () {
    var dateFrom = getCurrentDate();
    var dateTo = getCurrentDate();

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        var month = date.getMonth() + 1;
        return (date.getDate() > 9 ? date.getDate() : "0" + date.getDate()) + "/" + (month > 9 ? month : "0" + month) + "/" + date.getFullYear();
    }

    function getCurrentDate() {
        var date = new Date();
        var month = date.getMonth() + 1;
        return (date.getDate() > 9 ? date.getDate() : "0" + date.getDate()) + "/" + (month > 9 ? month : "0" + month) + "/" + date.getFullYear();
    }

    var table = $('#inventoryReportsTable').DataTable({
        "ajax": {
            'type': 'POST',
            'url': serverContext + '/inventoryReports',
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
            { data: "date",
                "type": "date",
                "render": function (data) {
                    return formatDate(data);
                }
            },
            { data: "totalImpressions",
              render: $.fn.dataTable.render.number( '.')
            },
            { data: "contentImpressions",
              render: $.fn.dataTable.render.number( '.')
            },
            { data: "contentClicks",
                render: $.fn.dataTable.render.number( '.')
            },
            { data: "contentCTR"},
            { data: "adImpressions",
              render: $.fn.dataTable.render.number( '.')
            },
            { data: "cpcImpressions",
              render: $.fn.dataTable.render.number( '.')
            },
            { data: "cpcCTR"},
            { data: "cpvImpressions",
              render: $.fn.dataTable.render.number( '.')
            },
            { data: "cpvCTR"},
            { data: "cpiImpressions",
              render: $.fn.dataTable.render.number( '.')
            },
            { data: "cpeImpressions",
                render: $.fn.dataTable.render.number( '.')
            }
        ]
    });

    //Date range as a button
    moment.locale('vi');
    function setDaterange(start, end) {
        $('#daterange-btn span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'))
        dateFrom = start.format('DD/MM/YYYY');
        dateTo = end.format('DD/MM/YYYY');
        $('#inventoryReportsTable').DataTable().ajax.reload();
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