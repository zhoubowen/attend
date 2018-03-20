<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="../admin/header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="../admin/top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="../admin/menu.jsp?m=8" flush="true"/>

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
                            <a href="/admin/member/index">请假信息列表</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">请假信息列表</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-globe"></i>请假信息列表
                            </div>
                        </div>

                        <div class="portlet-body">
                            <a class="btn green" href="/admin/leave/input">请假申请</a>
                            <hr/>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="hidden-480">请假理由</th>
                                    <th class="hidden-480">请假时间</th>
                                    <th class="hidden-480">天数</th>
                                    <th class="hidden-480">审批状态</th>
                                </tr>

                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr class="odd gradeX">
                                        <td class="hidden-480">${item.content}</td>
                                        <td class="hidden-480">
                                            <fmt:formatDate value="${item.beginDate}" pattern="yyyy-MM-dd"/> ~
                                            <fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>
                                        </td>
                                        <td class="center hidden-480">${item.days}</td>
                                        <td class="center hidden-480">${item.status == 0 ? '待审批' : '审批通过'}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <%@include file="../admin/pagination.jsp"%>


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
