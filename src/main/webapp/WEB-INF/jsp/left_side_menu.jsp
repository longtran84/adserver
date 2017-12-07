<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${userAvatar}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <p>${pageContext.request.userPrincipal.name}</p>
                </c:if>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">DANH MỤC</li>
            <li >
                <a href="${contextPath}/campaign">
                    <i class="fa fa-bullhorn"></i> <span>Chiến dịch quảng cáo</span>
                </a>
            </li>
            <li>
                <a href="${contextPath}/flight">
                    <i class="fa fa-object-group"></i>
                    <span>Nhóm quảng cáo</span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-th"></i>
                    <span>Định dạng quảng cáo</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${contextPath}/creativeVideo"><i class="fa fa-file-video-o"></i> Video</a></li>
                    <li><a href="${contextPath}/creativeImage"><i class="fa fa-file-image-o"></i> Ảnh</a></li>
                </ul>
            </li>
            <li>
                <a href="${contextPath}/ad">
                    <i class="fa fa-laptop"></i>
                    <span>Quảng cáo</span>
                </a>
            </li>
            <li>
                <a href="${contextPath}/appAd">
                    <i class="fa fa-laptop"></i>
                    <span>Quảng cáo ứng dụng</span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>Báo cáo</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${contextPath}/reportCampaign"><i class="fa fa-circle-o"></i> Chiến dịch quảng cáo</a></li>
                    <li><a href="${contextPath}/reportCost"><i class="fa fa-circle-o"></i> Chi phí</a></li>
                    <li><a href="${contextPath}/reportInventory"><i class="fa fa-circle-o"></i> Inventory</a></li>
                    <sec:authorize access="hasRole('ROLE_ADMIN') || hasRole('ROLE_SUPER_ADMIN')">
                      <li><a href="${contextPath}/reportUserInterest"><i class="fa fa-circle-o"></i> Sở thích người dùng</a></li>
                    </sec:authorize>
                    <li><a href="${contextPath}/reportApp"><i class="fa fa-circle-o"></i> Ứng dụng quảng cáo</a></li>
                </ul>
            </li>
            <sec:authorize access="hasRole('ROLE_ADMIN') || hasRole('ROLE_SUPER_ADMIN')">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i> <span>Người dùng</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${contextPath}/user/userInfo"><i class="fa  fa-info-circle"></i> Thông tin người dùng</a></li>
                    <li><a href="${contextPath}/user/userInvite"><i class="fa fa-info"></i> Thông tin giới thiệu</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>Nội dung</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${contextPath}/content/category"><i class="fa fa-circle-o"></i> Chuyên mục tin tức</a></li>
                    <li><a href="${contextPath}/content/news"><i class="fa fa-circle-o"></i> Tin tức</a></li>
                    <li><a href="${contextPath}/content"><i class="fa fa-circle-o"></i> Nội dung</a></li>
                    <li><a href="${contextPath}/game"><i class="fa fa-circle-o"></i> Trò chơi</a></li>
                </ul>
            </li>
            <li>
                <a href="${contextPath}/content/inAppMessage">
                    <i class="fa fa-laptop"></i>
                    <span>Tin nhắn</span>
                </a>
            </li>
            </sec:authorize>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-calendar-check-o"></i> <span>Sự kiện</span>
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
            </li>
            <sec:authorize access="hasRole('ROLE_ADMIN') || hasRole('ROLE_SUPER_ADMIN')">
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-book"></i> <span>Đổi thưởng</span>
                        <span class="pull-right-container">
                       <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="${contextPath}/loyalty/phoneCard"><i class="fa fa-circle-o"></i> Thẻ điện thoại</a></li>
                        <li><a href="${contextPath}/loyalty/voucher"><i class="fa fa-circle-o"></i> Voucher</a></li>
                        <li><a href="${contextPath}/loyalty/order"><i class="fa fa-circle-o"></i> Đơn hàng</a></li>
                    </ul>
                </li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN') || hasRole('ROLE_SUPER_ADMIN')">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-book"></i> <span>Quản trị hệ thống</span>
                    <span class="pull-right-container">
                       <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <sec:authorize access="hasRole('ROLE_SUPER_ADMIN')">
                       <li><a href="${contextPath}/system/admin/"><i class="fa fa-circle-o"></i> Quản trị viên</a></li>
                    </sec:authorize>
                    <li><a href="${contextPath}/system/systemParameter"><i class="fa fa-circle-o"></i> Tham số hệ thống</a></li>
                </ul>
            </li>
            </sec:authorize>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>