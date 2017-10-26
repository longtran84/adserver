<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminSMA | Registration Page</title>
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
  <!-- iCheck -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="../../index2.html"><b>Admin</b>LTE</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Đăng ký nhà quảng cáo mới</p>

    <form:form modelAttribute="advertiserForm" method="post">
      <div class="form-group has-feedback">
          <form:input type="email" path="email" class="form-control" placeholder="Email" autofocus="true"></form:input>
          <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          <form:errors path="email"></form:errors>
      </div>
      <div class="form-group has-feedback">
          <form:input type="password" path="password" class="form-control" placeholder="Mật khẩu"></form:input>
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          <form:errors path="password"></form:errors>
      </div>
      <div class="form-group has-feedback">
          <form:input type="password" path="passwordConfirm" class="form-control"
                      placeholder="Xác nhận mật khẩu"></form:input>
          <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
          <form:errors path="passwordConfirm"></form:errors>
      </div>
      <div class="form-group has-feedback">
        <form:input type="text" class="form-control" path="fullName" id="fullName" placeholder="Họ tên"/>
        <form:errors path="fullName"></form:errors>
      </div>
      <div class="form-group has-feedback">
        <form:input type="text" class="form-control" path="phone" id="phone" placeholder="Điện thoại"/>
        <form:errors path="phone"></form:errors>
      </div>
      <div class="form-group has-feedback">
        <form:input type="text" class="form-control" path="companyName" id="companyName" placeholder="Tên công ty"/>
        <form:errors path="companyName"></form:errors>
      </div>
      <div class="form-group has-feedback">
        <form:input type="text" class="form-control" path="charge" id="charge" placeholder="Tổng chi phí"/>
        <form:errors path="charge"></form:errors>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Tôi đồng ý với <a href="#">các điều khoản</a>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Đăng ký</button>
        </div>
        <!-- /.col -->
      </div>
    </form:form>
    <a href="${contextPath}/login" class="text-center">Tôi đã có tài khoản</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->
<script>
    var serverContext = "${pageContext.request.contextPath}";
</script>
<!-- jQuery 3 -->
<script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
