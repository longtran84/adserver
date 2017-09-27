<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li>
                <a href="/advertiser">
                    <i class="fa  fa-adn"></i> <span>Nhà quảng cáo</span>
                </a>
            </li>
            </sec:authorize>
            <li >
                <a href="/campaign">
                    <i class="fa fa-bullhorn"></i> <span>Chiến dịch quảng cáo</span>
                </a>
            </li>
            <li>
                <a href="/flight">
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
                    <li><a href="/creativeVideo"><i class="fa fa-file-video-o"></i> Video</a></li>
                    <li><a href="/creativeImage"><i class="fa fa-file-image-o"></i> Ảnh</a></li>
                </ul>
            </li>
            <li>
                <a href="/ad">
                    <i class="fa fa-laptop"></i>
                    <span>Quảng cáo</span>
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
                    <li><a href="/reportCampaign"><i class="fa fa-circle-o"></i> Chiến dịch quảng cáo</a></li>
                    <li><a href="/reportCost"><i class="fa fa-circle-o"></i> Chi phí</a></li>
                    <li><a href="/reportInventory"><i class="fa fa-circle-o"></i> Inventory</a></li>
                    <li><a href="/reportUserInterest"><i class="fa fa-circle-o"></i> Sở thích người dùng</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i> <span>Người dùng</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/user/userInfo"><i class="fa  fa-info-circle"></i> Thông tin người dùng</a></li>
                    <li><a href="/user/userInvite"><i class="fa fa-info"></i> Thông tin giới thiệu</a></li>
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
                    <li><a href="/news/category"><i class="fa fa-circle-o"></i> Chuyên mục tin tức</a></li>
                    <li><a href="/news/page"><i class="fa fa-circle-o"></i> Tin tức</a></li>
                    <li><a href="/content"><i class="fa fa-circle-o"></i> Nội dung</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-calendar-check-o"></i> <span>Sự kiện</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                    <li class="treeview">
                        <a href="#"><i class="fa fa-circle-o"></i> Level One
                            <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li class="treeview">
                                <a href="#"><i class="fa fa-circle-o"></i> Level Two
                                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                </ul>
            </li>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-book"></i> <span>Quản trị hệ thống</span>
                    <span class="pull-right-container">
                       <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/system/admin"><i class="fa fa-circle-o"></i> Quản trị viên</a></li>
                </ul>
            </li>
            </sec:authorize>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>