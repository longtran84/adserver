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
      <div id="send-mesage-info" class="alert alert-info alert-dismissible">
        <button type="button" id="send_mesage_close_info" class="close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-info"></i> Thông báo!</h4>
        Tin nhắn đã được gửi thành công!
      </div>
      <div id="send-mesage-error" class="alert alert-danger alert-dismissible">
        <button type="button" id="send_mesage_close_error" class="close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-ban"></i> Thông báo!</h4>
        <span>Có lỗi xảy ra khi gửi tin nhắn!</span>
      </div>
      <div id="delete-message-info" class="alert alert-info alert-dismissible">
        <button type="button" id="delete_message_close_info" class="close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-info"></i> Thông báo!</h4>
        Tin nhắn đã được xóa thành công!
      </div>
      <div id="delete-message-error" class="alert alert-danger alert-dismissible">
        <button type="button" id="delete_message_close_error" class="close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-ban"></i> Thông báo!</h4>
        <span>Có lỗi xảy ra khi xóa tin nhắn!</span>
      </div>
      <h1>
        Tin nhắn người dùng
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
            <form:form id="inAppMessageForm" action="${contextPath}/content/inAppMessage" modelAttribute="inAppMessageForm" method="post">
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <!-- /.col -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="subject">Chủ đề *</label>
                    <form:input type="text" class="form-control" path="subject" id="subject" placeholder="Chủ đề"/>
                    <form:errors path="subject" cssClass="has-error"></form:errors>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>
                      Loại
                    </label>
                    <form:select id='type' path="type" class="form-control" >
                      <option value="PRIMARY">Thường</option>
                      <option value="PROMOTION">Khuyến mại</option>
                    </form:select>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="body">Nội dung *</label>
                    <form:textarea id="contentEditor" path="body" name="contentEditor" rows="" cols="80"/>
                    <form:errors path="body" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <fieldset class="scheduler-border">
                      <legend class="scheduler-border">Người dùng mục tiêu</legend>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label>
                            Giới tính
                          </label>
                          <form:select id='userGender' path="userGender" class="form-control">
                            <option value=""></option>
                            <option value="MALE">Nam</option>
                            <option value="FEMALE">Nữ</option>
                          </form:select>
                        </div>
                        <div class="form-group">
                          <label>
                            Địa chỉ người dùng
                          </label>
                          <form:select multiple="true" id='lstLocation' path="userLocation" class="form-control" >
                            <option value="AG">An Giang</option>
                            <option value="BV">Bà Rịa-Vũng Tàu</option>
                            <option value="BL">Bạc Liêu</option>
                            <option value="BK">Bắc Kạn</option>
                            <option value="BG">Bắc Giang</option>
                            <option value="BN">Bắc Ninh</option>
                            <option value="BT">Bến Tre</option>
                            <option value="BD">Bình Dương</option>
                            <option value="BĐ">Bình Định</option>
                            <option value="BP">Bình Phước</option>
                            <option value="BTh">Bình Thuận</option>
                            <option value="CM">Cà Mau</option>
                            <option value="CB">Cao Bằng</option>
                            <option value="CT">Cần Thơ</option>
                            <option value="ĐNa">Đà Nẵng</option>
                            <option value="ĐL">Đắk Lắk</option>
                            <option value="ĐNo">Đắk Nông</option>
                            <option value="ĐB">Điện Biên</option>
                            <option value="ĐN">Đồng Nai</option>
                            <option value="ĐT">Đồng Tháp</option>
                            <option value="GL">Gia Lai</option>
                            <option value="HG">Hà Giang</option>
                            <option value="HNA">Hà Nam</option>
                            <option value="HAN">Hà Nội</option>
                            <option value="HT">Hà Tĩnh</option>
                            <option value="HD">Hải Dương</option>
                            <option value="HP">Hải Phòng</option>
                            <option value="HGi">Hậu Giang</option>
                            <option value="HB">Hòa Bình</option>
                            <option value="SG">Thành phố Hồ Chí Minh</option>
                            <option value="HY">Hưng Yên</option>
                            <option value="KH">Khánh Hoà</option>
                            <option value="KG">Kiên Giang</option>
                            <option value="KT">Kon Tum</option>
                            <option value="LC">Lai Châu</option>
                            <option value="LS">Lạng Sơn</option>
                            <option value="LCa">Lào Cai</option>
                            <option value="LĐ">Lâm Đồng</option>
                            <option value="LA">Long An</option>
                            <option value="NĐ">Nam Định</option>
                            <option value="NA">Nghệ An</option>
                            <option value="NB">Ninh Bình</option>
                            <option value="NT">Ninh Thuận</option>
                            <option value="PT">Phú Thọ</option>
                            <option value="PY">Phú Yên</option>
                            <option value="QB">Quảng Bình</option>
                            <option value="QNa">Quảng Nam</option>
                            <option value="QNg">Quảng Ngãi</option>
                            <option value="QN">Quảng Ninh</option>
                            <option value="QT">Quảng Trị</option>
                            <option value="ST">Sóc Trăng</option>
                            <option value="SL">Sơn La</option>
                            <option value="TN">Tây Ninh</option>
                            <option value="TB">Thái Bình</option>
                            <option value="TNg">Thái Nguyên</option>
                            <option value="TH">Thanh Hoá</option>
                            <option value="TTH">Thừa Thiên-Huế</option>
                            <option value="TG">Tiền Giang</option>
                            <option value="TV">Trà Vinh</option>
                            <option value="TQ">Tuyên Quang</option>
                            <option value="VL">Vĩnh Long</option>
                            <option value="VP">Vĩnh Phúc</option>
                            <option value="YB">Yên Bái</option>
                          </form:select>
                        </div>
                      </div>
                      <!--<div class="subject-info-arrows text-center">
                        <input type="button" id="btnAllRight" value=">>" class="btn btn-default" /><br />
                        <input type="button" id="btnRight" value=">" class="btn btn-default" /><br />
                        <input type="button" id="btnLeft" value="<" class="btn btn-default" /><br />
                        <input type="button" id="btnAllLeft" value="<<" class="btn btn-default" />
                      </div>-->
                      <div class="col-md-6">
                        <div class="form-group">
                          <label>
                            Độ tuổi
                          </label>
                          <div class="col-md-12">
                            <div class="col-md-4">
                              <div class="form-group">
                                <form:input type="text" class="form-control" id="userAgeFrom" path="userAgeFrom" placeholder="từ"/>
                              </div>
                            </div>
                            <div class="col-md-1">
                              <div class="form-group">
                                -
                              </div>
                            </div>
                            <div class="col-md-4">
                              <div class="form-group">
                                <form:input type="text" class="form-control" id="userAgeTo" path="userAgeTo" placeholder="đến"/>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label>
                            Chuyên mục tin tức yêu thích
                          </label>
                          <form:select multiple="true" id='lstNewsCategory' path="userInterest" items = "${newsCategoryList}" class="form-control"/>
                      </div>
                      </div>
                    </fieldset>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <form:input type="hidden" id="status" path="status"/>		
              <form:input type="hidden" id="id" path="id"/>
              <!-- <button type="submit" id="createBtn" class="btn btn-primary">Thêm</button> -->
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
              <table id="messagesTable" class="table table-bordered table-hover dataTable" role="grid">
                <!-- Header Table -->
                <thead>
                <tr>
                  <th>Chủ đề</th>
                  <th>Loại</th>
                  <th>Nội dung</th>
                  <th>Ngày tạo</th>
                  <th>Trạng thái</th>
                  <th>Gửi</th>
                  <th>Sửa / Xóa</th>
                </tr>
                </thead>
                <!-- Footer Table -->
                <tfoot>
                <tr>
                  <th>Chủ đề</th>
                  <th>Loại</th>
                  <th>Nội dung</th>
                  <th>Ngày tạo</th>
                  <th>Trạng thái</th>
                  <th>Gửi</th>
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
            <h4 class="modal-title">Xóa tin nhắn</h4>
          </div>
          <div class="modal-body">
            <p>Bạn có chắc chắn muốn xóa tin nhắn này?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            <button type="button" id="deleteMessageBtn" class="btn btn-primary">Xóa</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modal-sendMessage">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Gửi tin nhắn</h4>
          </div>
          <div class="modal-body">
            <p>Bạn có chắc chắn muốn gửi tin nhắn này?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            <button type="button" id="sendMessageBtn" class="btn btn-primary">Gửi</button>
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
<!-- CK Editor -->
<script src="${contextPath}/resources/bower_components/ckeditor/ckeditor.js"></script>
<script>
    var serverContext = "${pageContext.request.contextPath}";
    $.widget.bridge('uibutton', $.ui.button);
    CKEDITOR.replace('contentEditor')
    CKEDITOR.config.language = 'vi';
    CKEDITOR.config.basicEntities = false;
    CKEDITOR.config.entities = false;
    CKEDITOR.config.entities_greek = false;
    CKEDITOR.config.entities_latin = false;
    CKEDITOR.config.htmlEncodeOutput = false;
    CKEDITOR.config.entities_processNumerical = false;
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
<script src="${contextPath}/resources/js/in_app_message.js"></script>
</body>
</html>
