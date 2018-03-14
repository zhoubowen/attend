<%--
会员编辑
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=0" flush="true"/>

    <div class="page-content">

        <!-- BEGIN PAGE CONTAINER-->

        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="#">功能</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="/admin/member/index">员工信息</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">员工信息编辑</a></li>
                    </ul>
                </div>
            </div>
            <div class="row-fluid">

                <div class="span12">

                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-reorder"></i>员工基本信息</div>
                        </div>
                        <div class="portlet-body form">

                            <form action="/admin/member/save" class="form-horizontal" method="post">

                                <input type="hidden" name="id" value="${member.id}"/>

                                <div class="control-group">
                                    <label class="control-label">账号</label>
                                    <div class="controls">
                                        <input type="text" name="account" class="m-wrap" value="${member.account}">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">密码</label>
                                    <div class="controls">
                                        <input type="password" name="password" class="m-wrap" value="${member.password}">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">姓名</label>
                                    <div class="controls">
                                        <input type="text" name="name" class="m-wrap" value="${member.name}">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">手机号</label>
                                    <div class="controls">
                                        <input class="m-wrap" name="phone" type="text" value="${member.phone}" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">邮箱</label>
                                    <div class="controls">
                                        <div class="input-icon left">
                                            <i class="icon-envelope"></i>
                                            <input class="m-wrap " name="email" type="text" value="${member.email}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <button type="submit" class="btn blue">保存</button>
                                    <a class="btn" href="javascript:history.go(-1)">返回</a>
                                </div>

                            </form>

                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>

</div>


<jsp:include page="footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();
    });

</script>
</body>
</html>
