<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header class="main-header">
    <!-- Logo -->
    <a href="index.html" class="logo">
        <span class="logo-lg"><b>SMA</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${userAvatar}" class="user-image" alt="User Image">
                        <span class="hidden-xs">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    ${pageContext.request.userPrincipal.name}
                </c:if>
              </span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="${userAvatar}" class="img-circle" alt="User Image">
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <p>${pageContext.request.userPrincipal.name}</p>
                            </c:if>
                        </li>
                        <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                   <a href="/admin_profile" class="btn btn-default btn-flat">Thông tin tài khoản</a>
                                </sec:authorize>
                                <sec:authorize access="!hasRole('ROLE_ADMIN')">
                                    <a href="/advertiser_profile" class="btn btn-default btn-flat">Thông tin tài khoản</a>
                                </sec:authorize>
                            </div>
                            <div class="pull-right">
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </form>
                                    <a onclick="document.forms['logoutForm'].submit()" class="btn btn-default btn-flat">Đăng xuất</a>
                                </c:if>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>