<%--
供求编辑
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<styl>
    #editor {overflow:scroll; max-height:300px}
</styl>
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
                            <a href="/admin/supply/index?type=${article.type}&status=${article.status}">${article.type == 0 ? '供求信息' : '招商信息'}</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">${article.type == 0 ? '供求信息' : '招商信息'}${article.status == 0 ? '审核' : '编辑'}</a></li>
                    </ul>
                </div>
            </div>
            <div class="row-fluid">

                <div class="span12">

                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-reorder"></i>${article.type == 0 ? '供求基本信息' : '招商基本信息'}${article.status == 0 ? '审核' : ''}</div>
                        </div>
                        <div class="portlet-body form">

                            <form action="/admin/supply/save" class="form-horizontal" method="post">

                                <input type="hidden" name="id" value="${article.id}"/>
                                <input type="hidden" name="type" value="${article.type}"/>
                                <c:if test="${article.status == 0}">
                                    <input type="hidden" name="status" value="1"/>
                                </c:if>

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
                                        <textarea id="editor_id" name="content" style="width:700px;height:300px;">
                                            ${article.content}
                                        </textarea>
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <button type="submit" class="btn blue">${article.status == 1 ? '保存' : '审核通过'}</button>
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

        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id', {
                uploadJson : '/upload/uploadForEditor',
                fileManagerJson : '/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                filePostName : 'file'
            });

        });

//        KindEditor.ready(function(K) {
//            var uploadbutton = K.uploadbutton({
//                button : K('#ke-upload-button')[0],
//                url : '/upload/uploadForEditor',
//                afterUpload : function(data) {
//                    if (data.error === 0) {
//                        $("#pic-img").attr("src", data.url);
//                        $("#pic-input").val(data.url);
//                    } else {
//                        alert(data.message);
//                    }
//                }
//            });
//            uploadbutton.fileBox.change(function(e) {
//                uploadbutton.submit();
//            });
//        });


    });

</script>
</body>
</html>
