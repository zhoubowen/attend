<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<%@include file="nav.jsp"%>

<div class="page-container">

    <div class="space12">
        <div class="span3 sidebar-content ">
            <ul class="ver-inline-menu tabbable margin-bottom-25">
                <li class=""><a href="#tab_1" data-toggle="tab" onclick="doInfo(1)"><i class="icon-group"></i> 个人信息</a></li>
                <li class=""><a href="#tab_2" data-toggle="tab" onclick="doInfo(2)"><i class="icon-leaf"></i> 供求信息</a></li>
                <li class="active"><a href="#tab_3" data-toggle="tab" onclick="doInfo(3)"><i class="icon-info-sign"></i> 招商投资信息</a></li>
                <li class=""><a href="#tab_4" data-toggle="tab" onclick="doInfo(4)"><i class="icon-tasks"></i> 收到的留言</a></li>

            </ul>
        </div>

        <div class="span9 ">

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box blue" style="margin-top: 20px;">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-cogs"></i>招商投资信息</div>
                            <div class="tools">
                                <a href="/member/supplyInput?type=1" class="add" title="发布招商投资"></a>
                            </div>
                        </div>

                        <div class="portlet-body">
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <th>标题</th>
                                    <th>创建人</th>
                                    <th>状态</th>
                                    <th>创建时间</th>
                                    <th>最后更新时间</th>
                                    <th>操作</th>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${list}">
                                        <tr>
                                            <td>${item.title}</td>
                                            <td class="hidden-480">${item.member.name}</td>
                                            <td class="hidden-480">${item.status == 1 ? '审核通过' : '待审核'}</td>
                                            <td class="hidden-480">
                                                <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                            <td class="center hidden-480">
                                                <fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                            <td >
                                                <a class="btn green" href="/member/supplyInput?id=${item.id}">编辑</a>
                                                <a class="btn red" data-toggle = "modal" data-id= "${item.id}"  data-target="#static">删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>

                    </div>

                    <!-- END SAMPLE TABLE PORTLET-->

                    <div class="pagination pagination-centered">

                        <ul>

                            <c:if test="${page.page > 1}">
                                <li><a href="/member/supply?type=${ptype}&page=${(page.page - 1)}">上一页</a></li>
                            </c:if>

                            <c:choose>
                                <c:when test="${page.page < 6 || page.pageCount <= 10}">
                                    <c:forEach begin="1" end="${page.pageCount < 10 ? page.pageCount : 10}" var="p">
                                        <li ${p == page.page ? 'class="active"' : ''}><a href="/member/supply?type=${ptype}&page=${p}">${p}</a></li>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach begin="${page.page - 5}" end="${(page.page + 4) < page.pageCount ? (page.page + 4) : page.pageCount }" var="p">
                                        <li ${p == page.page ? 'class="active"' : ''}><a href="/member/supply?type=${ptype}&page=${p}">${p}</a></li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${page.page < page.pageCount}">
                                <li><a href="/member/supply?type=${ptype}&page=${(page.page + 1)}">下一页</a></li>
                            </c:if>

                        </ul>

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
    <form id="modelDeleteForm" action="/member/supplyDelete" method="post">
        <input type="hidden" name="id">
        <input type="hidden" name="type" value="${param.type}">
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn">否</button>
            <button type="button" data-dismiss="modal" class="btn green" onclick="doDelete()">是</button>
        </div>
    </form>
</div>



<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();
        $('#static').on('show.bs.modal', function (event) {
            var btnThis = $(event.relatedTarget); //触发事件的按钮
            var articleId = btnThis.data("id");
            $(this).find('input[name=id]').val(articleId);
        });
    });
    
    function doInfo(i) {
        switch(i)
        {
            case 1:
                window.location.href = "/member/info";
                break;
            case 2:
                window.location.href = "/member/supply?type=0";
                break;
            case 3:
                window.location.href = "/member/supply?type=1";
                break;
            case 4:
                window.location.href = "/comment/list";
                break;
            default:
                window.location.href = "/member/supply?type=0";
        }
    }


    function doDelete() {
        $("#modelDeleteForm").submit();
    }
</script>

</body>
</html>
