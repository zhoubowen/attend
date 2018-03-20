<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="../admin/header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="../admin/top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="../admin/menu.jsp?m=10" flush="true"/>

    <div class="page-content">

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
                            <a href="/admin/member/index">员工基本信息</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">员工基本信息</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-globe"></i>员工基本信息
                            </div>
                        </div>

                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="hidden-480">账号</th>
                                    <th class="hidden-480">姓名</th>
                                    <th class="hidden-480">邮箱</th>
                                    <th class="hidden-480">手机号码</th>
                                    <th class="hidden-480">操作</th>
                                </tr>

                                </thead>

                                <tbody>
                                    <tr class="odd gradeX">
                                        <td class="hidden-480">${member.account}</td>
                                        <td class="hidden-480">${member.name}</td>
                                        <td class="center hidden-480">${member.email}</td>
                                        <td class="center hidden-480">${member.phone}</td>
                                        <td class="center hidden-480"><a class="btn green" href="/admin/member/input?memberId=${memberId}&type=1">修改</a></td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

</div>



<jsp:include page="../admin/footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();

    });

</script>
</body>
</html>
