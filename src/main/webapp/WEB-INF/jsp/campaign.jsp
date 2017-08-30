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
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
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
      <div class="alert alert-info alert-dismissible">
        <button type="button" id="close_info" class="close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-info"></i> Thông báo!</h4>
        Chiến dịch quảng cáo đã được xóa thành công!
      </div>
      <div class="alert alert-danger alert-dismissible">
        <button type="button" id="close_error" class="close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-ban"></i> Thông báo!</h4>
        <span>Có lỗi xảy ra khi xóa chiến dịch quảng cáo.</span>
      </div>
      <h1>
        Chiến dịch quảng cáo
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Thông tin</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <!--<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>-->
              </div>
            </div>
            <form:form id="campaignForm" action="${contextPath}/campaign" modelAttribute="campaignForm" method="post">
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">

                <div class="col-md-6">
                  <div class="form-group">
                    <label for="advertiserName">Nhà quảng cáo</label>
                    <div class="input-group">
                      <input type="text" class="form-control" id="advertiserName" placeholder="Nhà quảng cáo" autofocus="true" disabled="true">
                      <form:input type="hidden" path="advertiser.id" id="advertiserId"/>
                      <form:errors path="advertiser.id"></form:errors>
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#modal-choose-advertiser">...</button>
                    </span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="name">Tên</label>
                    <form:input type="text" class="form-control" path="name" id="name" placeholder="Tên"/>
                    <form:errors path="name"></form:errors>
                  </div>
                  <div class="form-group">
                    <fieldset class="scheduler-border">
                      <legend class="scheduler-border">Định kỳ</legend>
                      <div class="control-group">
                        <label>
                          <form:checkbox class="minimal" path="isFreCapTmp" id="isFreCapTmp"/>
                          Chạy định kỳ
                        </label>
                      </div>
                      <div class="form-horizontal">
                        <label for="name" class="control-label col-sm-5">Hiển thị các quảng cáo từ chiến dịch này</label>
                        <div class="col-sm-2">
                          <form:input type="text" class="form-control" path="freCap" id="freCap"/>
                        </div>
                        <label for="name" class="control-label col-sm-1">lần</label>
                        <div class="col-sm-2">
                          <form:input type="text" class="form-control" path="freCapDuration" id="freCapDuration"/>
                        </div>
                        <div class="col-sm-2">
                          <form:select class="form-control" path="freCapType" id="freCapType">
                            <option value="HOUR">Giờ</option>
                            <option value="DAY">Ngày</option>
                            <option value="WEEK">Tuần</option>
                          </form:select>
                        </div>
                        <form:errors path="freCapDuration"></form:errors>
                      </div>
                    </fieldset>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="startDate">Ngày bắt đầu</label>
                    <div class="input-group date">
                      <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                      </div>
                      <form:input type="text" class="form-control pull-right" path="startDate" id="startDate" placeholder="Ngày bắt đầu"/>
                      <form:errors path="startDate"></form:errors>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="endDate">Ngày kết thúc</label>
                    <div class="input-group date">
                      <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                      </div>
                      <form:input type="text" class="form-control pull-right" path="endDate" id="endDate" placeholder="Ngày kết thúc"/>
                      <form:errors path="endDate"></form:errors>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="name">Mô tả</label>
                    <form:textarea class="form-control" path="description" id="description" rows="4" placeholder="Mô tả"/>
                    <form:errors path="description"></form:errors>
                  </div>
                  <!-- /.form-group -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <form:input type="hidden" id="id" path="id"/>
              <button type="submit" id="createBtn" class="btn btn-primary">Thêm</button>
              <button type="submit" id="editBtn" class="btn btn-primary">Sửa</button>
              <button type="button" id="resetBtn" class="btn bg-orange">Hủy</button>
            </div>
            </form:form>
          </div>
          <div class="box">
            <!--<div class="box-header">
              <h3 class="box-title">Hover Data Table</h3>
            </div>-->
            <!-- /.box-header -->
            <div class="box-body">
              <table id="campaignsTable" class="table table-bordered">
                <!-- Header Table -->
                <thead>
                <tr>
                  <th>Tên</th>
                  <th>Nhà quảng cáo</th>
                  <th>Ngày bắt đầu</th>
                  <th>Ngày kết thúc</th>
                  <th>Trạng thái</th>
                  <th>Sửa / Xóa</th>
                </tr>
                </thead>
                <!-- Footer Table -->
                <tfoot>
                <tr>
                  <th>Tên</th>
                  <th>Nhà quảng cáo</th>
                  <th>Ngày bắt đầu</th>
                  <th>Ngày kết thúc</th>
                  <th>Trạng thái</th>
                  <th>Sửa / Xóa</th>
                </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@ include file = "advertiserPopup.jsp" %>
  <%@ include file = "footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${contextPath}/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="${contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
<script>
  $.widget.bridge('uibutton', $.ui.button);
  $(function () {
      //iCheck for checkbox and radio inputs
      $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
          checkboxClass: 'icheckbox_minimal-blue',
          radioClass   : 'iradio_minimal-blue'
      })
  })
</script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="${contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${contextPath}/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${contextPath}/resources/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.vi.min.js"></script>
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}/resources/js/advertiserPopup.js"></script>
<script src="${contextPath}/resources/js/campaign.js"></script>
</body>
</html>
