<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<styl>
    #editor {overflow:scroll; max-height:300px}
</styl>
<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=8" flush="true"/>

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
                            <a href="javascript:;">请假申请</a>
                            <i class="icon-angle-right"></i>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row-fluid">

                <div class="span12">

                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-reorder"></i>请假申请表单</div>
                        </div>
                        <div class="portlet-body form">

                            <form action="/admin/leave/save" class="form-horizontal" method="post">

                                <div class="control-group">
                                    <label class="control-label">请假时间</label>
                                    <div class="controls">
                                        <input type="text" name="beginDate" class="m-wrap" value=""  id="beginDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'endDate\')}'})" class="Wdate" >
                                        <input type="text" name="endDate" class="m-wrap" value="" id="endDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',  minDate:'#F{$dp.$D(\'beginDate\')}'})" class="Wdate">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">天数</label>
                                    <div class="controls">
                                        <input type="text" name="days" class="m-wrap" value="">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">请假理由</label>
                                    <div class="controls">
                                        <textarea name="content" rows="5" cols="20"></textarea>
                                    </div>
                                </div>


                                <div class="form-actions">
                                    <button type="submit" class="btn blue">提交申请</button>
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
