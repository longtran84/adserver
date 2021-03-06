<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="_csrf" content="${_csrf.token}"/>
  <!-- default header name is X-CSRF-TOKEN -->
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SMA</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/iCheck/all.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/_all-skins.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@ include file = "header.jsp" %>

  <!-- Left side column. contains the logo and sidebar -->

  <%@ include file = "left_side_menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Người dùng
      </h1>
      <br>
      <div class="input-group">
        <div id="daterange-btn" class="btn btn-default pull-left">
          <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
          <span></span> <b class="caret"></b>
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <!--<div class="box-header">
              <h3 class="box-title">Hover Data Table</h3>
            </div>-->
            <!-- /.box-header -->
            <div class="box-body">
              <table id="userMobilesTable" class="table table-bordered table-hover dataTable" role="grid">
                <!-- Header Table -->
                <thead>
                <tr>
                  <th>ID người dùng</th>
                  <th>Tên đăng nhập</th>
                  <th>Giới tính</th>
                  <th>Tuổi</th>
                  <th>Địa chỉ</th>
                  <th>Trạng thái</th>
                  <th>Ngày đăng ký</th>
                  <th>Điểm tích lũy</th>
                  <th>Chuyên mục yêu thích</th>
                  <th>Số thiết bị sử dụng</th>
                  <th>Người giới thiệu</th>
                  <th>Mã giới thiệu đã dùng</th>
                  <th>Phê duyệt</th>
                </tr>
                </thead>
                <!-- Footer Table -->
                <tfoot>
                <tr>
                  <th>ID người dùng</th>
                  <th>Tên đăng nhập</th>
                  <th>Giới tính</th>
                  <th>Tuổi</th>
                  <th>Địa chỉ</th>
                  <th>Trạng thái</th>
                  <th>Ngày đăng ký</th>
                  <th>Điểm tích lũy</th>
                  <th>Chuyên mục yêu thích</th>
                  <th>Số thiết bị sử dụng</th>
                  <th>Người giới thiệu</th>
                  <th>Mã giới thiệu đã dùng</th>
                  <th>Phê duyệt</th>
                </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
    <div class="modal fade" id="modal-deactivate">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Hủy bỏ người dùng</h4>
          </div>
          <div class="modal-body">
            <p>Bạn có chắc chắn muốn hủy người dùng này?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            <button type="button" id="deactivateUserBtn" class="btn btn-primary">Hủy</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modal-activate">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Kích hoạt người dùng</h4>
          </div>
          <div class="modal-body">
            <p>Bạn có chắc chắn muốn kích hoạt người dùng này?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            <button type="button" id="activateUserBtn" class="btn btn-primary">Kích hoạt</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
  </div>
  <!-- /.content-wrapper -->
  <%@ include file = "footer.jsp" %>
</div>
<!-- ./wrapper -->
<!-- jQuery 3 -->
<script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${contextPath}/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="${contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="${contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- date-range-picker -->
<script src="${contextPath}/resources/bower_components/moment/min/moment-with-locales.min.js"></script>
<script src="${contextPath}/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- DataTables -->
<script src="${contextPath}/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script>
    var serverContext = "${pageContext.request.contextPath}";
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${contextPath}/resources/js/common.js"></script>
<script src="${contextPath}/resources/js/user_info.js"></script>
</body>
</html>
