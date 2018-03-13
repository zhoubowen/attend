<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<%@include file="nav.jsp"%>

<div class="page-container row-fluid">

    <div class="span12 blog-page">

        <div class="row-fluid">

            <div class="span12 article-block">
                <h1></h1>

                <c:forEach items="${list}" var="item">
                    <div class="row-fluid">

                        <div class="span12 blog-article">

                            <h4><a href="/detail?id=${item.id}&type=${item.type}">${item.title}</a></h4>
                            <div class="blog-img blog-tag-data">

                                <ul class="unstyled inline">

                                    <li><i class="icon-calendar"></i> <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></li>

                                    <li><i class="icon-comments"></i> <a href="/member/info?memberId=${item.createBy}&type=1">${item.member.name}</a></li>

                                </ul>

                            </div>

                            <%--<p>--%>
                                    <%--${fn:substring(item.content, 0, 100)}--%>
                            <%--</p>--%>

                            <%--<a class="btn blue" href="/detail?id=${item.id}&type=${item.type}">--%>
                                <%--更多详情--%>
                                <%--<i class="m-icon-swapright m-icon-white"></i>--%>
                            <%--</a>--%>
                            <%--<a class="btn green" href="">--%>
                                <%--我要投标--%>
                                <%--<i class="m-icon-swapright m-icon-white"></i>--%>
                            <%--</a>--%>

                        </div>

                    </div>
                </c:forEach>

            </div>

        </div>


        <%--分页--%>
        <div class="pagination pagination-centered">

            <ul>

                <c:if test="${page.page > 1}">
                    <li><a href="/?type=${type}&page=${(page.page - 1)}">上一页</a></li>
                </c:if>

                <c:choose>
                    <c:when test="${page.page < 6 || page.pageCount <= 10}">
                        <c:forEach begin="1" end="${page.pageCount < 10 ? page.pageCount : 10}" var="p">
                            <li ${p == page.page ? 'class="active"' : ''}><a href="/?type=${type}&page=${p}">${p}</a></li>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach begin="${page.page - 5}" end="${(page.page + 4) < page.pageCount ? (page.page + 4) : page.pageCount }" var="p">
                            <li ${p == page.page ? 'class="active"' : ''}><a href="/?type=${type}&page=${p}">${p}</a></li>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

                <c:if test="${page.page < page.pageCount}">
                    <li><a href="/?type=${type}&page=${(page.page + 1)}">下一页</a></li>
                </c:if>

            </ul>

        </div>

    </div>

</div>

<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();
    });
</script>

</body>
</html>
