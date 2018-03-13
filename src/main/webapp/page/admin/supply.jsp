<%--
供求
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp" flush="true"/>

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
                            <a href="/admin/supply/index?type=${param.type}">${param.type == 0 ? '供求信息' : '招商信息' }</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">${param.type == 0 ? '供求信息' : '招商信息' }${param.status == 0 ? '待审核列表' : '列表'}</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption"><i class="icon-globe"></i>${param.type == 0 ? '供求信息' : '招商信息' }${param.status == 0 ? '待审核列表' : '列表'}</div>
                        </div>

                        <div class="portlet-body">

                            <table class="table table-striped table-bordered table-hover" id="sample_1">
                                <thead>
                                <tr>
                                    <th style="width:8px;">
                                        <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" />
                                    </th>
                                    <th>标题</th>
                                    <th class="hidden-480">创建人</th>
                                    <th class="hidden-480">创建时间</th>
                                    <th class="hidden-480">最后更新时间</th>
                                    <th >操作</th>
                                </tr>

                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>${item.title}</td>
                                        <td class="hidden-480">${item.member.name}</td>
                                        <td class="hidden-480">
                                            <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </td>
                                        <td class="center hidden-480">
                                            <fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </td>
                                        <td >
                                            <a class="btn green" href="/admin/supply/input?id=${item.id}">${param.status == 0 ? '去审核' : '编辑'}</a>
                                            <a class="btn red" data-toggle = "modal" data-id= "${item.id}"  data-target="#static">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

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
    <form id="modelDeleteForm" action="/admin/supply/delete" method="post">
        <input type="hidden" name="id">
        <input type="hidden" name="type" value="${param.type}">
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
            var articleId = btnThis.data("id");
            $(this).find('input[name=id]').val(articleId);
        });

    });

    function doDelete() {
        $("#modelDeleteForm").submit();
    }

</script>
</body>
</html>
