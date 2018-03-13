<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="brand" href="index.html">
                <img src="/image/logo.png" alt="logo"/>
            </a>
            <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                <img src="/image/menu-toggler.png" alt=""/>
            </a>
            <ul class="nav pull-right">
                <li class="dropdown user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img alt="" src="/image/avatar1_small.jpg"/>
                        <span class="username">${sessionScope.name}</span>
                        <i class="icon-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <%--<li><a href="extra_profile.html"><i class="icon-user"></i> My Profile</a></li>--%>
                        <%--<li class="divider"></li>--%>
                        <li><a href="/admin/logout"><i class="icon-key"></i> Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

</div>

