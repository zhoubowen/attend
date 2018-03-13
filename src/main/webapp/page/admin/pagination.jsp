<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%--分页--%>
<div class="pagination pagination-right">

    <ul>
        <c:choose>
            <c:when test="${page.page == 1}">
                <li class="active"><a href="javascript:;">上一页</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="javascript:linkTo(${(page.page - 1)})">上一页</a></li>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${page.page < 6 || page.pageCount <= 10}">
                <c:forEach begin="1" end="${page.pageCount < 10 ? page.pageCount : 10}" var="p">
                    <c:choose>
                        <c:when test="${p == page.page}">
                            <li class="active"><a href="javascript:;">${p}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:linkTo(${p})">${p}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <c:forEach begin="${page.page - 5}" end="${(page.page + 4) < page.pageCount ? (page.page + 4) : page.pageCount }" var="p">
                    <c:choose>
                        <c:when test="${p == page.page}">
                            <li class="active"><a href="javascript:;">${p}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:linkTo(${p})">${p}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${page.page == page.pageCount}">
                <li class="active"><a href="javascript:;">下一页</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="javascript:linkTo(${(page.page + 1)})">下一页</a></li>
            </c:otherwise>
        </c:choose>

    </ul>

</div>

<script>
    function linkTo(p) {
        var linkUrl = window.location.href;
        var index = linkUrl.indexOf("&page");
        if(index > 0){
            linkUrl = linkUrl.substr(0, index);
        }
        linkUrl += "&page=" + p;
        window.location.href = linkUrl;
    }

</script>