<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
  <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
  <div>
    <h1>${news.title}</h1><br>
    <span id="publishDate">${news.createdDate}</span>
    <p>${news.content}</p>
  </div>
  <!-- jQuery 3 -->
  <script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
  <script src="${contextPath}/resources/bower_components/moment/min/moment-with-locales.min.js"></script>
  <script src="${contextPath}/resources/js/news_detail.js"></script>
</body>
</html>
