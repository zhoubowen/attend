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
                <li class="active"><a href="#tab_2" data-toggle="tab" onclick="doInfo(2)"><i class="icon-leaf"></i> 供求信息</a></li>
                <li class=""><a href="#tab_3" data-toggle="tab" onclick="doInfo(3)"><i class="icon-info-sign"></i> 招商投资信息</a></li>
                <li class=""><a href="#tab_4" data-toggle="tab" onclick="doInfo(4)"><i class="icon-tasks"></i> 收到的留言</a></li>

            </ul>
        </div>

        <div class="span9 ">

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box blue" style="margin-top: 20px;">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-cogs"></i>供求基本信息</div>
                        </div>

                        <div class="portlet-body form">

                            <form action="/member/supplySave" class="form-horizontal" method="post">

                                <input type="hidden" name="id" value="${article.id}"/>
                                <input type="hidden" name="type" value="${article.type}"/>
                                <input type="hidden" name="status" value="${article.status}"/>

                                <div class="control-group">
                                    <label class="control-label">标题</label>
                                    <div class="controls">
                                        <input type="text" name="title" class="span6 m-wrap" value="${article.title}">
                                    </div>
                                </div>

                                <%--<div class="control-group">--%>
                                <%--<label class="control-label">主图</label>--%>
                                <%--<div class="controls">--%>
                                <%--<input id="pic-input" type="hidden" name="pic" value="${article.pic}">--%>
                                <%--<img id="pic-img" alt="" src="${article.pic}" width="100px" height="100px">--%>
                                <%--<input type="button" id="ke-upload-button" value="上传主图" />--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <div class="control-group">
                                    <label class="control-label">内容</label>
                                    <div class="controls">
                                        <textarea id="editor_id" name="content" style="width:90%;height:300px;">
                                            ${article.content}
                                        </textarea>
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

<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();

        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id', {
                uploadJson : '/upload/uploadForEditor',
                fileManagerJson : '/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                filePostName : 'file'
            });

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
</script>

</body>
</html>
