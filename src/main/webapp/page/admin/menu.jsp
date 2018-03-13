<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-sidebar nav-collapse collapse">
    <ul class="page-sidebar-menu">
        <li>
            <div class="sidebar-toggler hidden-phone"></div>
        </li>

        <li class="start active ">
            <a href="javascript:;">
                <i class="icon-cogs"></i>
                <span class="title">功能</span>
                <span class="selected"></span>
            </a>
            <ul class="sub-menu">
                <li class="${param.m == 0 ? 'active' : '' }"><a href="/admin/member/index?m=0">员工管理</a></li>
                <li class="${param.m == 1 ? 'active' : '' }"><a href="/admin/supply/index?m=1&type=1&status=0">排班管理</a></li>
                <li class="${param.m == 2 ? 'active' : '' }"><a href="/admin/supply/index?m=2&type=0&status=1">请假信息审批</a></li>
                <li class="${param.m == 3 ? 'active' : '' }"><a href="/admin/supply/index?m=3&type=0&status=1">出差信息审批</a></li>
                <li class="${param.m == 4 ? 'active' : '' }"><a href="/admin/supply/index?m=4&type=0&status=0">员工考勤管理</a></li>
                <li class="${param.m == 5 ? 'active' : '' }"><a href="/admin/member/index?m=5">报表管理</a></li>
            </ul>
        </li>

        <li class=" ">
            <a href="javascript:;">
                <i class="icon-cogs"></i>
                <span class="title">普通员工</span>
                <span class="selected"></span>
            </a>
            <ul class="sub-menu">
                <li><a href="/admin/supply/index?type=1&status=1">排班信息查看</a></li>
                <li><a href="/admin/supply/index?type=1&status=0">出差通知查看</a></li>
                <li><a href="/admin/supply/index?type=0&status=1">请假申请</a></li>
                <li><a href="/admin/supply/index?type=0&status=1">考勤信息查询</a></li>
                <li><a href="/admin/supply/index?type=0&status=0">个人信息管理</a></li>
            </ul>
        </li>

    </ul>

</div>
