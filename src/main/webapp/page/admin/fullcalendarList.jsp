<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=4" flush="true"/>

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
                            <a href="/admin/member/index">考勤审核</a>
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
                                <i class="icon-globe"></i>考勤审核列表
                            </div>
                        </div>

                        <div class="portlet-body">

                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>员工姓名</th>
                                    <th class="hidden-480">时间</th>
                                    <th class="hidden-480">状态</th>
                                    <th >操作</th>
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
                                        <td class="span3">
                                            <c:choose>
                                                <c:when test="${item.status == 0}">
                                                    <a class="btn green" href="/admin/fullcalendar/updateStatus?id=${item.id}&status=1">正常</a>
                                                    <a class="btn blue" href="/admin/fullcalendar/updateStatus?id=${item.id}&status=2">迟到</a>
                                                    <a class="btn red" href="/admin/fullcalendar/updateStatus?id=${item.id}&status=3">旷工</a>
                                                </c:when>
                                                <c:otherwise>
                                                    -
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <%@include file="pagination.jsp"%>


                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<div id="static" class="modal hide fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-body">
        <p>是否确定删除?</p>
    </div>
    <form id="modelDeleteForm" action="/admin/member/delete" method="post">
        <input type="hidden" name="memberId">
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn">否</button>
            <button type="button" data-dismiss="modal" class="btn green" onclick="doDelete()">是</button>
        </div>
    </form>
</div>


<jsp:include page="footer.jsp" flush="true"/>
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
