<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="utf-8" />
	<title>Spring Boot + JPA + Datatables</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
	<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/resources/js/user.js"></script>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
	<h1>Users</h1>
	<table id="usersTable" class="display">
      
       <!-- Header Table -->
       <thead>
            <tr>
                <th>Id</th>
				<th>Username</th>
                <th>Edit / Delete</th>
            </tr>
        </thead>
        <!-- Footer Table -->
        <tfoot>
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Edit / Delete</th>
            </tr>
        </tfoot>
    </table>
    
</body>
</html>