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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/_all-skins.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
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
        Voucher đã được xóa thành công!
      </div>
      <div class="alert alert-danger alert-dismissible">
        <button type="button" id="close_error" class="close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-ban"></i> Thông báo!</h4>
        <span>Có lỗi xảy ra khi xóa thẻ voucher!</span>
      </div>
      <h1>
        Voucher
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
            <form:form id="voucherForm" action="${contextPath}/loyalty/voucher" modelAttribute="voucherForm" method="post" enctype="multipart/form-data">
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">Tên *</label>
                    <form:input type="text" class="form-control" path="name" id="name" placeholder="Tên"/>
                    <form:errors path="name" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="type">Loại *</label>
                    <form:select class="form-control" path="type" id="type">
                      <option value="E_VOUCHER">E-voucher</option>
                      <option value="PHYSICAL_VOUCHER">Voucher giấy</option>
                    </form:select>
                    <form:errors path="type" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="pictureName">Ảnh *</label>
                    <div class="input-group">
                      <form:input type="text" class="form-control" id="pictureName" path="pictureName" placeholder="Ảnh" autofocus="true" readonly="true"/>
                      <span class="input-group-btn">
                        <button type="button" class="btn btn-info btn-flat" id="pictureFileBtn">Chọn ảnh...</button>
                      </span>
                      <form:input type="file" id="pictureFile" path="pictureFile"/>
                    </div>
                    <form:errors path="pictureFile" cssClass="has-error"></form:errors>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="marketPrice">Giá thị trường</label>
                    <form:input type="text" class="form-control" path="marketPrice" id="marketPrice" placeholder="Giá thị trường"/>
                    <form:errors path="marketPrice" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="price">Đơn giá </label>
                    <form:input type="text" class="form-control" path="price" id="price" placeholder="Đơn giá"/>
                    <form:errors path="price" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="quantity">Số lượng *</label>
                    <form:input type="text" class="form-control" path="quantity" id="quantity" placeholder="Số lượng"/>
                    <form:errors path="quantity" cssClass="has-error"></form:errors>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="description">Thông tin chi tiết *</label>
                    <form:textarea id="contentEditor" path="description" name="contentEditor" rows="" cols="80"/>
                    <form:errors path="description" cssClass="has-error"></form:errors>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <form:input type="hidden" id="id" path="id"/>
              <form:input type="hidden" id="status" path="status"/>
              <form:input type="hidden" id="legacyId" path="legacyId"/>
			  <button type="button" id="resetBtn" class="btn btn-success">Nhập Mới</button>	
              <button type="submit" id="editBtn" class="btn btn-primary">Lưu</button>
              <button type="button" id="activateBtn" class="btn btn-danger">Kích hoạt</button>
            </div>
            </form:form>
          </div>
          <div class="box">
            <!--<div class="box-header">
              <h3 class="box-title">Hover Data Table</h3>
            </div>-->
            <!-- /.box-header -->
            <div class="box-body">
              <table id="vouchersTable" class="table table-bordered table-hover dataTable" role="grid">
                <!-- Header Table -->
                <thead>
                <tr>
                  <th>Tên</th>
                  <th>Loại</th>
                  <th>Ảnh</th>
                  <th>Giá thị trường</th>
                  <th>Đơn giá</th>
                  <th>Số lượng</th>
                  <th>Ngày tạo</th>
                  <th>Trạng thái</th>
                  <th>Sửa / Xóa</th>
                </tr>
                </thead>
                <!-- Footer Table -->
                <tfoot>
                <tr>
                  <th>Tên</th>
                  <th>Loại</th>
                  <th>Ảnh</th>
                  <th>Giá thị trường</th>
                  <th>Đơn giá</th>
                  <th>Số lượng</th>
                  <th>Ngày tạo</th>
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
    <div class="modal fade" id="modal-delete">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Xóa voucher</h4>
          </div>
          <div class="modal-body">
            <p>Bạn có chắc chắn muốn xóa voucher này?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            <button type="button" id="delete_phoneCard" class="btn btn-primary">Xóa</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <div class="modal modal-danger fade" id="modal-file-error">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Định dạng và kích thước ảnh được hỗ trợ</h4>
          </div>
          <div class="modal-body">
            <table class="table table-bordered">
              <tr>
                <td>
                  Loại ảnh
                </td>
                <td>
                  <ul>
                    <li>.JPG</li>
                    <li>.PNG</li>
                    <li>.GIF</li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td>Độ lớn ảnh</td>
                <td>150 KB hoặc nhỏ hơn</td>
              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline" data-dismiss="modal">Đóng</button>
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
<!-- CK Editor -->
<script src="${contextPath}/resources/bower_components/ckeditor/ckeditor.js"></script>
<script>
  var serverContext = "${pageContext.request.contextPath}";
  $.widget.bridge('uibutton', $.ui.button);
  CKEDITOR.replace('contentEditor')
</script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="${contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${contextPath}/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${contextPath}/resources/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.vi.min.js"></script>
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- DataTables -->
<script src="${contextPath}/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${contextPath}/resources/bower_components/moment/min/moment-with-locales.min.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
<script src="${contextPath}/resources/js/voucher.js"></script>
</body>
</html>
