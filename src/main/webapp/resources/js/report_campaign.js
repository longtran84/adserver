$(document).ready( function () {
    var data;
    var campaignId;
    var dateFrom = getCurrentDate();
    var dateTo = getCurrentDate();
    var impressionsChart;
    var clicksChart;
    var ctrChart;
    var viewsChart;
    var charts = {};
    var rowIndex = 0;

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

    var table = $('#campaignReportsTable').DataTable({
        "ajax": {
            'type': 'POST',
            'url': '/campaignReports',
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
            { data: "campaign.name" },
            { data: "campaign.advertiser.email" },
            { data: "campaign.startDate",
                "type": "date",
                "render": function (data) {
                    return formatDate(data);
                }
            },
            { data: "campaign.endDate",
                "type": "date",
                "render": function (data) {
                    return formatDate(data);
                }
            },
            { data: "campaign.status",
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
            { data: "impressions" },
            { data: "clicks" },
            { data: "ctr" },
            { data: "views" }
        ],
        "initComplete": function(settings, json) {
            $('#campaignReportsTable tbody tr:eq(0)').click();
        },
        /*"drawCallback": function( settings ) {
            //$('#loadingIcon').attr('style', "display:none");
            $('#campaignReportsTable tbody tr:eq(0)').click();
        }*/
    });

    var lineChartConfig = {
        type: 'line',
        data: {
            labels: [dateFrom],
            datasets: [{
                label: '',
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
            }]
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

    var ctrChartConfig = {
        type: 'line',
        data: {
            labels: [dateFrom],
            datasets: [{
                label: '',
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
            }]
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
                        stepSize: 1,
                        callback: function(value) {
                            return value + '%';
                        }
                    }
                }]
            }
        }
    }

    function getImpressionsChart() {
        $.ajax({
            type: "POST",
            url: '/impressionReport',
            data: JSON.stringify({dateFrom: dateFrom, dateTo: dateTo, campaignId: campaignId}),
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (result) {
                lineChartConfig.data.labels = [getCurrentDate()];
                lineChartConfig.data.datasets[0].data = [0];
                for (var i = 0; i < result.length; i++) {
                    lineChartConfig.data.labels[i] = result[i].date;
                    lineChartConfig.data.datasets[0].data[i] = result[i].impressions;
                }
                lineChartConfig.data.datasets[0].label = 'Lượt hiển thị';
                if (impressionsChart == undefined) {
                    var impressionsChartCanvas  = $('#impressionsChart').get(0).getContext('2d');
                    impressionsChart            = new Chart(impressionsChartCanvas, lineChartConfig);
                } else {
                    impressionsChart.config = lineChartConfig;
                    impressionsChart.update();
                }
            },
            error: function(error) {
            }
        });
        return impressionsChart;
    }

    function getClicksChart() {
        $.ajax({
            type: "POST",
            url: '/clickReport',
            data: JSON.stringify({dateFrom: dateFrom, dateTo: dateTo, campaignId: campaignId}),
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (result) {
                lineChartConfig.data.labels = [getCurrentDate()];
                lineChartConfig.data.datasets[0].data = [0];
                for (var i = 0; i < result.length; i++) {
                    lineChartConfig.data.labels[i] = result[i].date;
                    lineChartConfig.data.datasets[0].data[i] = result[i].clicks;
                }
                lineChartConfig.data.datasets[0].label = 'Lượt click';
                if (clicksChart == undefined) {
                    var clicksChartCanvas = $('#clicksChart').get(0).getContext('2d');
                    clicksChart           = new Chart(clicksChartCanvas, lineChartConfig);
                } else {
                    clicksChart.config = lineChartConfig;
                    clicksChart.update();
                }
            },
            error: function(error) {
            }
        });
        return clicksChart;
    }

    function getCTRChart() {
        $.ajax({
            type: "POST",
            url: '/ctrReport',
            data: JSON.stringify({dateFrom: dateFrom, dateTo: dateTo, campaignId: campaignId}),
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (result) {
                ctrChartConfig.data.labels = [getCurrentDate()];
                ctrChartConfig.data.datasets[0].data = [0];
                if (result.length > 0) {
                    for (var i = 0; i < result.length; i++) {
                        ctrChartConfig.data.labels[i] = result[i].date;
                        ctrChartConfig.data.datasets[0].data[i] = result[i].ctr;
                    }
                }
                ctrChartConfig.data.datasets[0].label = 'CTR';
                if (ctrChart == undefined) {
                    var ctrChartCanvas = $('#ctrChart').get(0).getContext('2d');
                    ctrChart           = new Chart(ctrChartCanvas, ctrChartConfig);
                } else {
                    ctrChart.config = ctrChartConfig;
                    ctrChart.update();
                }
            },
            error: function(error) {
            }
        });
        return ctrChart;
    }

    function getViewsChart() {
        $.ajax({
            type: "POST",
            url: '/viewReport',
            data: JSON.stringify({dateFrom: dateFrom, dateTo: dateTo, campaignId: campaignId}),
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (result) {
                lineChartConfig.data.labels = [getCurrentDate()];
                lineChartConfig.data.datasets[0].data = [0];
                for (var i = 0; i < result.length; i++) {
                    lineChartConfig.data.labels[i] = result[i].date;
                    lineChartConfig.data.datasets[0].data[i] = result[i].views;
                }
                lineChartConfig.data.datasets[0].label = 'Lượt xem video';
                if (viewsChart == undefined) {
                    var viewsChartCanvas = $('#viewsChart').get(0).getContext('2d');
                    viewsChart           = new Chart(viewsChartCanvas, lineChartConfig);
                } else {
                    viewsChart.config = lineChartConfig;
                    viewsChart.update();
                }
            },
            error: function(error) {
            }
        });
        return viewsChart;
    }

    $('#campaignReportsTable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('success') ) {
            $(this).removeClass('success');
        }
        else {
            table.$('tr.success').removeClass('success');
            $(this).addClass('success');
        }
        rowIndex = table.row( this ).index();
        data = table.row(this).data();
        charts = {};
        campaignId = data.campaign.id;
        charts[currentTab] = graph(currentTab);
    } );

    var currentTab = 'impressions';
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        currentTab = $(e.target).attr('href').slice(1);
        var previousTab = $(e.relatedTarget).attr('href').slice(1),
            chart = $('#' + currentTab).find('.chart');
        if (charts[previousTab]) {
            charts[previousTab] = null;
        }
        if (chart) {
            charts[currentTab] = graph(currentTab);
        }
    });

    function graph(currentTab) {
        var newChart;
        if (currentTab === 'clicks') {
            newChart = getClicksChart();
        } else if (currentTab === 'ctr') {
            newChart = getCTRChart();
        } else if (currentTab === 'views') {
            newChart = getViewsChart();
        } else {
            newChart = getImpressionsChart();
        }
        return newChart;
    }

    function save() {
        //var request = [{name:'abc', image:'link1'}, {name:'def', image:'link2'}];
        var request = [{title:'abc', shortDescription:'abcdefgh', link:'link1', newsCategoryId: 1}, {title:'abc1', shortDescription:'abcdefgh', link:'link2', newsCategoryId: 2}];
        $.ajax({
            type: "POST",
            url: '/news/saveNews',
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json",
            success: function (result) {
                alert(result);
            },
            error: function (error) {
                alert(error);
            }
        });
    }

    //Date range as a button
    moment.locale('vi');
    function setDaterange(start, end) {
        $('#daterange-btn span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'))
        dateFrom = start.format('DD/MM/YYYY');
        dateTo = end.format('DD/MM/YYYY');
        charts = {};
        $('#loadingIcon').attr('style', "display:block");
        //$('#campaignReportsTable').DataTable().ajax.reload();
        table.ajax.reload( function (json) {
            $('#campaignReportsTable tbody tr:eq(0)').click();
        });
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