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
      <h1>
        Tham số hệ thống
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
              </div>
            </div>
            <form:form id="systemParameterForm" action="${contextPath}/system/systemParameter" modelAttribute="systemParameterForm" method="post" enctype="multipart/form-data">
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="advImagePath">Đường dẫn ảnh quảng cáo *</label>
                    <form:input type="text" class="form-control" path="advImagePath" id="advImagePath" placeholder="Đường dẫn ảnh quảng cáo"/>
                    <form:errors path="advImagePath" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="advVideoPath">Đường dẫn video quảng cáo *</label>
                    <form:input type="text" class="form-control" path="advVideoPath" id="advVideoPath" placeholder="Đường dẫn video quảng cáo"/>
                    <form:errors path="advVideoPath" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="newsImagePath">Đường dẫn ảnh tin tức *</label>
                    <form:input type="text" class="form-control" path="newsImagePath" id="newsImagePath" placeholder="Đường dẫn ảnh tin tức"/>
                    <form:errors path="newsImagePath" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="contentImagePath">Đường dẫn ảnh nội dung *</label>
                    <form:input type="text" class="form-control" path="contentImagePath" id="contentImagePath" placeholder="Đường dẫn ảnh nội dung"/>
                    <form:errors path="contentImagePath" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="newsCategoryPath">Đường dẫn ảnh chuyên mục *</label>
                    <form:input type="text" class="form-control" path="newsCategoryPath" id="newsCategoryPath" placeholder="Đường dẫn ảnh chuyên mục"/>
                    <form:errors path="newsCategoryPath" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="appIconPath">Đường dẫn icon ứng dụng *</label>
                    <form:input type="text" class="form-control" path="appIconPath" id="appIconPath" placeholder="Đường dẫn icon ứng dụng"/>
                    <form:errors path="appIconPath" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="gameImagePath">Đường dẫn ảnh trò chơi *</label>
                    <form:input type="text" class="form-control" path="gameImagePath" id="gameImagePath" placeholder="Đường dẫn ảnh trò chơi"/>
                    <form:errors path="gameImagePath" cssClass="has-error"></form:errors>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="advImagePath">Thư mục ảnh quảng cáo *</label>
                    <form:input type="text" class="form-control" path="advImageFolder" id="advImageFolder" placeholder="Thư mục ảnh quảng cáo"/>
                    <form:errors path="advImageFolder" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="advVideoFolder">Thư mục video quảng cáo *</label>
                    <form:input type="text" class="form-control" path="advVideoFolder" id="advVideoFolder" placeholder="Thư mục video quảng cáo"/>
                    <form:errors path="advVideoFolder" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="newsImageFolder">Thư mục ảnh tin tức *</label>
                    <form:input type="text" class="form-control" path="newsImageFolder" id="newsImageFolder" placeholder="Thư mục ảnh tin tức"/>
                    <form:errors path="newsImageFolder" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="contentImageFolder">Thư mục ảnh nội dung *</label>
                    <form:input type="text" class="form-control" path="contentImageFolder" id="contentImageFolder" placeholder="Thư mục ảnh nội dung"/>
                    <form:errors path="contentImageFolder" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="newsCategoryFolder">Thư mục ảnh chuyên mục *</label>
                    <form:input type="text" class="form-control" path="newsCategoryFolder" id="newsCategoryFolder" placeholder="Thư mục ảnh chuyên mục"/>
                    <form:errors path="newsCategoryFolder" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="appIconFolder">Thư mục icon ứng dụng *</label>
                    <form:input type="text" class="form-control" path="appIconFolder" id="appIconFolder" placeholder="Thư mục icon ứng dụng"/>
                    <form:errors path="appIconFolder" cssClass="has-error"></form:errors>
                  </div>
                  <div class="form-group">
                    <label for="gameImageFolder">Thư mục ảnh trò chơi *</label>
                    <form:input type="text" class="form-control" path="gameImageFolder" id="gameImageFolder" placeholder="Thư mục ảnh trò chơi"/>
                    <form:errors path="gameImageFolder" cssClass="has-error"></form:errors>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <form:input type="hidden" id="id" path="id"/>
              <button type="submit" id="editBtn" class="btn btn-primary">Lưu</button>
            </div>
            </form:form>
          </div>
          <div class="box">

          </div>
        </div>
      </div>
    </section>
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
  var serverContext = "${pageContext.request.contextPath}";
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
<script src="${contextPath}/resources/js/common.js"></script>
<script src="${contextPath}/resources/js/system_parameter.js"></script>
</body>
</html>
