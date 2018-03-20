<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="../admin/header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="../admin/top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="../admin/menu.jsp?m=9" flush="true"/>

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
                            <a href="/admin/member/index">考勤查看</a>
                            <i class="icon-angle-right"></i>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-globe"></i>考勤列表
                            </div>
                        </div>

                        <div class="portlet-body">

                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>员工姓名</th>
                                    <th class="hidden-480">时间</th>
                                    <th class="hidden-480">状态</th>
                                </tr>

                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr class="odd gradeX">
                                        <td>${item.member.name}</td>
                                        <td class="hidden-480">
                                            <fmt:formatDate value="${item.dutyBeginDate}" pattern="yyyy-MM-dd"/>
                                            <%--~--%>
                                            <%--<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
                                        </td>
                                        <td class="center hidden-480">
                                            <c:choose>
                                                <c:when test="${item.status == 1}">
                                                    正常
                                                </c:when>
                                                <c:when test="${item.status == 2}">
                                                    迟到
                                                </c:when>
                                                <c:when test="${item.status == 3}">
                                                    旷工
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                        </td>
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
//        $('#static').on('show.bs.modal', function (event) {
//            var btnThis = $(event.relatedTarget); //触发事件的按钮
//            var memberId = btnThis.data("id");
//            $(this).find('input[name=memberId]').val(memberId);
//        });

    });

    function doDelete() {
        $("#modelDeleteForm").submit();
    }

</script>
</body>
</html>
