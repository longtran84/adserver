$(document).ready( function () {
    var dateFrom = getCurrentDate();
    var dateTo = getCurrentDate();

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        //var month = date.getMonth() + 1;
        //return (date.getDate() > 9 ? date.getDate() : "0" + date.getDate()) + "/" + (month > 9 ? month : "0" + month) + "/" + date.getFullYear();
        return moment(date).format('DD/MM/YYYY HH:mm:ss');
    }

    function getCurrentDate() {
        var date = new Date();
        var month = date.getMonth() + 1;
        return (date.getDate() > 9 ? date.getDate() : "0" + date.getDate()) + "/" + (month > 9 ? month : "0" + month) + "/" + date.getFullYear();
    }

    var table = $('#newsTable').DataTable({
        "ajax": {
            'type': 'POST',
            'url': '/news/list',
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
                  return '<a href=' + data.link + ' class="linkOriginal"><i class="fa fa-fw fa-link"></i></a>';
              }
            },
            { data: "source" },
            { data: "newsCategory.name" },
            { data: null,
                "render": function (data) {
                    if (data.status === 'NEW') {
                        return 'Mới';
                    } else if (data.status === 'ACTIVE') {
                        return 'Hiển thị';
                    } else {
                        return 'Không hiển thị';
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
                    if (data.status === 'ACTIVE') {
                        return '<a href="" class="privateConTent" title="Không hiển thị"><i class="fa fa-fw fa-lock"></i></a>';
                    } else {
                        return '<a href="" class="publicConTent" title="Hiển thị"><i class="fa fa-fw fa-unlock-alt"></i></a>';
                    }
                }
            }
        ]
    });

    $('#newsTable tbody').on( 'click', 'a.linkOriginal', function (e) {
        e.preventDefault();
        var url = $(this).attr('href');
        window.open(url, 'Trang gốc', 'width=480,height=360,resizable=no,toolbar=no,menubar=no,location=no,status=no');
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
            $('#newsTable').DataTable().ajax.reload();
        }
    )

    // Delete a record
    $('#campaignsTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();
        data = table.row( $(this).parents('tr') ).data();
        $('#modal-delete').modal();
    });
});