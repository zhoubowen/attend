<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=0" flush="true"/>

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
                            <a href="/admin/member/index">员工信息</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">员工列表</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption"><i class="icon-globe"></i>员工列表</div>
                        </div>

                        <div class="portlet-body">

                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>账号</th>
                                    <th class="hidden-480">邮箱</th>
                                    <th class="hidden-480">姓名</th>
                                    <th class="hidden-480">手机号码</th>
                                    <th class="hidden-480">参与排班</th>
                                    <th >操作</th>
                                </tr>

                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr class="odd gradeX">
                                        <td>${item.account}</td>
                                        <td class="hidden-480"><a href="mailto:shuxer@gmail.com">${item.email}</a></td>
                                        <td class="hidden-480">${item.name}</td>
                                        <td class="center hidden-480">${item.phone}</td>
                                        <td class="center hidden-480">${item.joinSchedue == 1 ? '是' : '否'}</td>
                                        <td >
                                            <a class="btn green" href="/admin/member/input?memberId=${item.id}">编辑</a>
                                            <a class="btn red" data-toggle = "modal" data-id= "${item.id}" data-target="#static">删除</a>
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
        $('#static').on('show.bs.modal', function (event) {
            var btnThis = $(event.relatedTarget); //触发事件的按钮
            var memberId = btnThis.data("id");
            $(this).find('input[name=memberId]').val(memberId);
        });

    });

    function doDelete() {
        $("#modelDeleteForm").submit();
    }

</script>
</body>
</html>
