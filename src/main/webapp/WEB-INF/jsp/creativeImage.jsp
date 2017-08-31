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
        Định dạng quảng cáo đã được xóa thành công!
      </div>
      <div class="alert alert-danger alert-dismissible">
        <button type="button" id="close_error" class="close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-ban"></i> Thông báo!</h4>
        <span>Có lỗi xảy ra khi xóa định dạng quảng cáo.</span>
      </div>
      <h1>
        Định dạng quảng cáo
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
            <form:form id="creativeForm" action="${contextPath}/creativeImage" modelAttribute="creativeForm" method="post" enctype="multipart/form-data">
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
                    <label for="title">Tiêu đề</label>
                    <form:input type="text" class="form-control" path="title" id="title" placeholder="Tiêu đề"/>
                    <form:errors path="title"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="body">Nội dung</label>
                    <form:textarea class="form-control" path="body" id="body" rows="5" placeholder="Nội dung"/>
                    <form:errors path="body"></form:errors>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="title">Alt</label>
                    <form:input type="text" class="form-control" path="alt" id="alt" placeholder="Alt"/>
                    <form:errors path="alt"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="title">Đường dẫn ảnh</label>
                    <div class="input-group">
                      <input type="text" class="form-control" id="imageName" placeholder="Ảnh" autofocus="true" disabled="true">
                      <span class="input-group-btn">
                        <button type="button" class="btn btn-info btn-flat" id="imageFileBtn">Chọn ảnh...</button>
                      </span>
                      <form:input type="file" id="imageFile" path="imageFile"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="body">Xem trước ảnh</label>
                    <div class="input-group">
                      <img id="imagePreview" alt="Xem trước ảnh được tải lên" width="250px" height="250px"/>
                    </div>
                  </div>
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
              <table id="creativesTable" class="table table-bordered table-striped dataTable" role="grid">
                <!-- Header Table -->
                <thead>
                <tr>
                  <th>Tiêu đề</th>
                  <th>Nhà quảng cáo</th>
                  <th>Đường dẫn</th>
                  <th>Trạng thái</th>
                  <th>Sửa / Xóa</th>
                </tr>
                </thead>
                <!-- Footer Table -->
                <tfoot>
                <tr>
                  <th>Tiêu đề</th>
                  <th>Nhà quảng cáo</th>
                  <th>Đường dẫn</th>
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
            <h4 class="modal-title">Xóa định dạng quảng cáo</h4>
          </div>
          <div class="modal-body">
            <p>Bạn có chắc chắn muốn xóa định dạng quảng cáo này?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            <button type="button" id="delete_creative" class="btn btn-primary">Xóa</button>
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
            <h4 class="modal-title">Định dạng và kích thước ảnh quảng cáo được hỗ trợ</h4>
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
              <tr>
                <td>Kích thước ảnh</td>
                <td>
                  <ul>
                    <li><strong>320 x 50</strong>: Mobile leaderboard <img src="//lh5.ggpht.com/r72rVFHFrC311Whh1Kr0E6X_c1khO7i-C_0f3gM4W3w0LrAcXP9dt0bbA1FxIZghOhOTP8Y=w21" height="auto" alt="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động." title="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động."></li>
                    <li><strong>480 x 32</strong>: Mobile banner (landscape) <img src="//lh5.ggpht.com/r72rVFHFrC311Whh1Kr0E6X_c1khO7i-C_0f3gM4W3w0LrAcXP9dt0bbA1FxIZghOhOTP8Y=w21" height="auto" alt="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động." title="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động."></li>
                    <li><strong>320 x 100</strong>: Large mobile banner <img src="//lh5.ggpht.com/r72rVFHFrC311Whh1Kr0E6X_c1khO7i-C_0f3gM4W3w0LrAcXP9dt0bbA1FxIZghOhOTP8Y=w21" height="auto" alt="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động." title="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động."></li>
                    <li><strong>468 x 60</strong>: Banner <img src="//lh5.ggpht.com/r72rVFHFrC311Whh1Kr0E6X_c1khO7i-C_0f3gM4W3w0LrAcXP9dt0bbA1FxIZghOhOTP8Y=w21" height="auto" alt="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động." title="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động."></li>
                    <li><strong>728 x 90</strong>: Leaderboard <img src="//lh5.ggpht.com/r72rVFHFrC311Whh1Kr0E6X_c1khO7i-C_0f3gM4W3w0LrAcXP9dt0bbA1FxIZghOhOTP8Y=w21" height="auto" alt="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động." title="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động."></li>
                    <li><strong>300 x 250</strong>: Inline rectangle <img src="//lh5.ggpht.com/r72rVFHFrC311Whh1Kr0E6X_c1khO7i-C_0f3gM4W3w0LrAcXP9dt0bbA1FxIZghOhOTP8Y=w21" height="auto" alt="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động." title="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động."></li>
                    <li><strong>320 x 480</strong>: Smartphone interstitial (portrait) <img src="//lh5.ggpht.com/r72rVFHFrC311Whh1Kr0E6X_c1khO7i-C_0f3gM4W3w0LrAcXP9dt0bbA1FxIZghOhOTP8Y=w21" height="auto" alt="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động." title="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động."></li>
                    <li><strong>480 x 320</strong>: Smartphone interstitial (landscape) <img src="//lh5.ggpht.com/r72rVFHFrC311Whh1Kr0E6X_c1khO7i-C_0f3gM4W3w0LrAcXP9dt0bbA1FxIZghOhOTP8Y=w21" height="auto" alt="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động." title="
Biểu tượng cho thấy độ phân giải HD hoặc độ phân giải cao cho hình ảnh được sử dụng trong quảng cáo trên điện thoại di động."></li>
                  </ul>
                </td>
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
    <%@ include file = "advertiserPopup.jsp" %>
  </div>
  <!-- /.content-wrapper -->
  <%@ include file = "footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${contextPath}/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script>
  $.widget.bridge('uibutton', $.ui.button);
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
<script src="${contextPath}/resources/js/advertiserPopup.js"></script>
<script src="${contextPath}/resources/js/creativeImage.js"></script>
</body>
</html>
