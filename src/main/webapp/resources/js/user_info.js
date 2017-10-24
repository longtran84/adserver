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
            { data: null,
                "render": function (data) {
                    return getLocation(data.location);
                }
            },
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
    function setDaterange(start, end) {
        $('#daterange-btn span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'))
        dateFrom = start.format('DD/MM/YYYY');
        dateTo = end.format('DD/MM/YYYY');
        $('#userMobilesTable').DataTable().ajax.reload();
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

    function getLocation(code) {
        var location = '';
        switch(code) {
            case 'AG':
                location = 'An Giang';
                break;
            case 'BV':
                location = 'Bà Rịa-Vũng Tàu';
                break;
            case 'BL':
                location = 'Bạc Liêu';
                break;
            case 'BK':
                location = 'Bắc Kạn';
                break;
            case 'BG':
                location = 'Bắc Giang';
                break;
            case 'BN':
                location = 'Bắc Ninh';
                break;
            case 'BT':
                location = 'Bến Tre';
                break;
            case 'BD':
                location = 'Bình Dương';
                break;
            case 'BĐ':
                location = 'Bình Định';
                break;
            case 'BP':
                location = 'Bình Phước';
                break;
            case 'BTh':
                location = 'Bình Thuận';
                break;
            case 'CM':
                location = 'Cà Mau';
                break;
            case 'CB':
                location = 'Cao Bằng';
                break;
            case 'CT':
                location = 'Cần Thơ';
                break;
            case 'ĐNa':
                location = 'Đà Nẵng';
                break;
            case 'ĐL':
                location = 'Đắk Lắk';
                break;
            case 'ĐNo':
                location = 'Đắk Nông';
                break;
            case 'ĐB':
                location = 'Điện Biên';
                break;
            case 'ĐN':
                location = 'Đồng Nai';
                break;
            case 'ĐT':
                location = 'Đồng Tháp';
                break;
            case 'GL':
                location = 'Gia Lai';
                break;
            case 'HG':
                location = 'Hà Giang';
                break;
            case 'HNA':
                location = 'Hà Nam';
                break;
            case 'HAN':
                location = 'Hà Nội';
                break;
            case 'HT':
                location = 'Hà Tĩnh';
                break;
            case 'HD':
                location = 'Hải Dương';
                break;
            case 'HP':
                location = 'Hải Phòng';
                break;
            case 'HGi':
                location = 'Hậu Giang';
                break;
            case 'HB':
                location = 'Hòa Bình';
                break;
            case 'SG':
                location = 'Thành phố Hồ Chí Minh';
                break;
            case 'HY':
                location = 'Hưng Yên';
                break;
            case 'KH':
                location = 'Khánh Hoà';
                break;
            case 'KG':
                location = 'Kiên Giang';
                break;
            case 'KT':
                location = 'Kon Tum';
                break;
            case 'LC':
                location = 'Lai Châu';
                break;
            case 'LS':
                location = 'Lạng Sơn';
                break;
            case 'LCa':
                location = 'Lào Cai';
                break;
            case 'LĐ':
                location = 'Lâm Đồng';
                break;
            case 'LA':
                location = 'Long An';
                break;
            case 'NĐ':
                location = 'Nam Định';
                break;
            case 'NA':
                location = 'Nghệ An';
                break;
            case 'NB':
                location = 'Ninh Bình';
                break;
            case 'NT':
                location = 'Ninh Thuận';
                break;
            case 'PT':
                location = 'Phú Thọ';
                break;
            case 'PY':
                location = 'Phú Yên';
                break;
            case 'QB':
                location = 'Quảng Bình';
                break;
            case 'QNa':
                location = 'Quảng Nam';
                break;
            case 'QNg':
                location = 'Quảng Ngãi';
                break;
            case 'QN':
                location = 'Quảng Ninh';
                break;
            case 'QT':
                location = 'Quảng Trị';
                break;
            case 'ST':
                location = 'Sóc Trăng';
                break;
            case 'SL':
                location = 'Sơn La';
                break;
            case 'TN':
                location = 'Tây Ninh';
                break;
            case 'TB':
                location = 'Thái Bình';
                break;
            case 'TNg':
                location = 'Thái Nguyên';
                break;
            case 'TH':
                location = 'Thanh Hoá';
                break;
            case 'TTH':
                location = 'Thừa Thiên-Huế';
                break;
            case 'TG':
                location = 'Tiền Giang';
                break;
            case 'TV':
                location = 'Trà Vinh';
                break;
            case 'TQ':
                location = 'Tuyên Quang';
                break;
            case 'VL':
                location = 'Vĩnh Long';
                break;
            case 'VP':
                location = 'Vĩnh Phúc';
                break;
            default:
                location = 'Yên Bái';
        }
        return location;
    }
});