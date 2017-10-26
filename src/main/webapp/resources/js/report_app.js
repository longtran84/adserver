$(document).ready( function () {
    var data;
    var dateFrom = getCurrentDate();
    var dateTo = getCurrentDate();
    var installsChart;
    var rowIndex = 0;

    var formatDate  = function (data) {
        if (data === null || data === '') return "";
        var date = new Date(data);
        return moment(date).format('DD/MM/YYYY');
    }

    function getCurrentDate() {
        var date = new Date();
        return moment(date).format('DD/MM/YYYY');
    }

    var table = $('#appReportsTable').DataTable({
        "ajax": {
            'type': 'POST',
            'url': serverContext + '/appReports',
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
            { data: "appAd.name" },
            { data: "appAd.campaign.name" },
            { data: "appAd.campaign.startDate",
                "type": "date",
                "render": function (data) {
                    return formatDate(data);
                }
            },
            { data: "appAd.campaign.endDate",
                "type": "date",
                "render": function (data) {
                    return formatDate(data);
                }
            },
            { data: "appAd.status",
                "render": function (data) {
                    if (data === 'NEW') {
                        return 'Mới';
                    } else if (data === 'ACTIVE') {
                        return 'Đang hoạt động';
                    } else {
                        return 'Không hoạt động';
                    }
                }
            },
            { data: "installs" }
        ],
        "initComplete": function(settings, json) {
            $('#appReportsTable tbody tr:eq(0)').click();
        }
    });

    var lineChartConfig = {
        type: 'line',
        data: {
            labels: [dateFrom],
            datasets: [
              {
                label: 'iOS',
                fill: false,
                borderColor: "red",
                pointBorderColor: "red",
                pointBackgroundColor: "red",
                pointHoverBackgroundColor: "red",
                pointHoverBorderColor: "red",
                pointBorderWidth: 2,
                pointHoverRadius: 10,
                pointHoverBorderWidth: 1,
                pointRadius: 3,
                data: [0]
              },
              {
                label: 'Android',
                fill: false,
                borderColor: "#80b6f4",
                pointBorderColor: "#80b6f4",
                pointBackgroundColor: "#80b6f4",
                pointHoverBackgroundColor: "#80b6f4",
                pointHoverBorderColor: "#80b6f4",
                pointBorderWidth: 2,
                pointHoverRadius: 10,
                pointHoverBorderWidth: 1,
                pointRadius: 3,
                data: [0]
              }
            ]
        },
        options: {
            responsive: true,
            tooltips: {
                mode: 'index',
                intersect: false,
            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                    gridLines: {
                        display:false
                    }
                }],
                yAxes: [{
                    gridLines: {
                        display:false
                    },
                    ticks: {
                        beginAtZero:true,
                        callback: function(value) {if (value % 1 === 0) {return value;}}
                    }
                }]
            }
        }
    }

    function getInstallsChart(appId) {
        $.ajax({
            type: "POST",
            url: serverContext + '/installReport',
            data: JSON.stringify({dateFrom: dateFrom, dateTo: dateTo, appId: appId}),
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (result) {
                lineChartConfig.data.labels = [getCurrentDate()];
                lineChartConfig.data.datasets[0].data = [0];
                lineChartConfig.data.datasets[1].data = [0];
                //iOS
                var iOSResult = result[0];
                for (var i = 0; i < iOSResult.length; i++) {
                    lineChartConfig.data.labels[i] = iOSResult[i].date;
                    lineChartConfig.data.datasets[0].data[i] = iOSResult[i].installs;
                }
                //Android
                var iOSResult = result[1];
                for (var i = 0; i < iOSResult.length; i++) {
                    lineChartConfig.data.labels[i] = iOSResult[i].date;
                    lineChartConfig.data.datasets[1].data[i] = iOSResult[i].installs;
                }
                if (installsChart == undefined) {
                    var installsChartCanvas  = $('#installsChart').get(0).getContext('2d');
                    installsChart               = new Chart(installsChartCanvas, lineChartConfig);
                } else {
                    installsChart.config = lineChartConfig;
                    installsChart.update();
                }
            },
            error: function(error) {
            }
        });
    }

    $('#appReportsTable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('success') ) {
            $(this).removeClass('success');
        }
        else {
            table.$('tr.success').removeClass('success');
            $(this).addClass('success');
        }
        rowIndex = table.row( this ).index();
        data = table.row(this).data();
        appId = data.appAd.id;
        getInstallsChart(appId);
    } );

    //Date range as a button
    moment.locale('vi');
    function setDaterange(start, end) {
        $('#daterange-btn span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'))
        dateFrom = start.format('DD/MM/YYYY');
        dateTo = end.format('DD/MM/YYYY');
        $('#appReportsTable').DataTable().ajax.reload();
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