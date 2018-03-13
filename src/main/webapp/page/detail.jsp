<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed page-full-width">

<div class="header navbar navbar-inverse navbar-fixed-top">

    <%@include file="nav.jsp"%>

</div>


<div class="page-container row-fluid">

    <div class="span12 blog-page">

        <div class="row-fluid">

            <div class="span12 article-block">
                <h1></h1>

                    <div class="row-fluid">

                        <div class="span12 blog-article">

                            <h4>${article.title}</h4>
                            <div class="blog-img blog-tag-data">

                                <ul class="unstyled inline">

                                    <li><i class="icon-calendar"></i> <fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></li>

                                    <li><i class="icon-comments"></i> <a href="/member/info?memberId=${article.createBy}&type=1">${article.member.name}</a></li>

                                </ul>

                            </div>

                            <p>
                                ${article.content}
                            </p>



                            <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>

                            <c:if test="${article.createBy != sessionScope.memberId}">
                                <hr>
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                <div class="post-comment">
                                    <h4>我要留言</h4>
                                    <input type="hidden" name="articleId" value="${article.id}" />
                                    <textarea class="span10 m-wrap" rows="5" name="content"></textarea>
                                    <p><button class="btn blue" type="submit" onclick="addComment()">提交</button></p>
                                </div>
                            </c:if>

                        </div>

                    </div>
            </div>

        </div>

    </div>

</div>

<%@include file="footer.jsp"%>

<script>
    function addComment() {
        $.post(
                "/comment/add",
                {
                    articleId: $("input[name=articleId]").val(),
                    content : $("textarea[name=content]").val()
                },
                function(result){
                    if(result.success){
                        alert("留言成功,等待对方回复!");
                        window.location.reload();
                    }
                    console.log(result);

                }
        );
    }
</script>
</body>
</html>
