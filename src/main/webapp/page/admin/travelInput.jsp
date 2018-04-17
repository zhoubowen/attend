<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<styl>
    #editor {overflow:scroll; max-height:300px}
</styl>
<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=3" flush="true"/>

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
                            <a href="javascript:;">发布出差信息</a>
                            <%--<i class="icon-angle-right"></i>--%>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row-fluid">

                <div class="span12">

                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-reorder"></i>出差信息表单</div>
                        </div>
                        <div class="portlet-body form">

                            <form action="/admin/leave/save" class="form-horizontal" method="post">
                                <input type="hidden" name="type" value="${type}">
                                <div class="control-group">
                                    <label class="control-label">出差时间</label>
                                    <div class="controls">
                                        <input type="text" name="beginDate" class="m-wrap" value=""  id="beginDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'endDate\')}'})" class="Wdate" >
                                        <input type="text" name="endDate" class="m-wrap" value="" id="endDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',  minDate:'#F{$dp.$D(\'beginDate\')}'})" class="Wdate">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">出差人员</label>
                                    <div class="controls">
                                        <select name="userId">
                                            <c:forEach items="${members}" var="member">
                                                <option value="${member.id}">${member.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">天数</label>
                                    <div class="controls">
                                        <input type="text" name="days" class="m-wrap" value="">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">出差事由</label>
                                    <div class="controls">
                                        <textarea name="content" rows="5" cols="20"></textarea>
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
