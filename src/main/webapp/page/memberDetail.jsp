<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<%@include file="nav.jsp"%>

<div class="page-container">

    <div class="space12">
        <div class="row-fluid">

                <div class="span9">
                    <div class="portlet box blue" style="margin-top: 20px; margin-left: 200px;">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-cogs"></i>发布人信息</div>
                        </div>

                        <div class="portlet-body">
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>用户名</th>
                                    <th>昵称</th>
                                    <th>邮箱</th>
                                    <th>所属公司名称</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${member.account}</td>
                                        <td>${member.name}</td>
                                        <td>${member.email}</td>
                                        <td>${member.company}</td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>

                    </div>

                    <!-- END SAMPLE TABLE PORTLET-->

                </div>

            </div>
    </div>

</div>

<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();
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
                window.location.href = "/member/info?type=0";
        }
    }
</script>

</body>
</html>
