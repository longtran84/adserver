<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminSMA | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/iCheck/square/blue.css">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="/"><b>Admin</b>SMA</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Đăng nhập để bắt đầu phiên làm việc</p>

			<form action="${contextPath}/login" method="post">
				<div class="form-group ${error != null ? 'has-error' : ''}">
					<span>${message}</span>
					<div class="form-group has-feedback">
						<input type="email" name="username" class="form-control"
							placeholder="Email"> <span
							class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="password" class="form-control"
							placeholder="Password"> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<span class="has-error">${error}</span> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />
				</div>
				<div class="row">
					<!--<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox"> Nhớ tôi
							</label>
						</div>
					</div>-->
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">Đăng nhập</button>
					</div>
					<!-- /.col -->
				</div>
			</form>


			<a href="${contextPath}/forgotPassword">Quên mật khẩu</a><br>
			<a href="${contextPath}/registration" class="text-center">Đăng ký người dùng</a><br>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 3 -->
	<script
		src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
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
