<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="header navbar navbar-inverse navbar-fixed-top">

    <!-- BEGIN TOP NAVIGATION BAR -->

    <div class="navbar-inner">

        <div class="container">

            <!-- BEGIN LOGO -->

            <div class="brand">

                <%--<img src="/image/logo.png" alt="logo" />--%>

            </div>

            <!-- END LOGO -->

            <!-- BEGIN HORIZANTAL MENU -->

            <div class="navbar hor-menu hidden-phone hidden-tablet">

                <div class="navbar-inner">

                    <ul class="nav">

                        <li <c:if test="${type == 0}">class="active"</c:if>>
                            <a href="/?type=0">
                                <c:if test="${type == 0}">
                                    <span class="selected"></span>
                                </c:if>
                                供求信息
                            </a>
                        </li>

                        <li <c:if test="${type == 1}">class="active"</c:if>>
                            <a  href="/?type=1">
                                <c:if test="${type == 1}">
                                    <span class="selected"></span>
                                </c:if>
                                招商投资信息
                            </a>

                        </li>

                        <li <c:if test="${type != 0 && type != 1}">class="active"</c:if>>
                            <c:if test="${type != 0 && type != 1}">
                                <span class="selected"></span>
                            </c:if>
                            <a href="/member/info">会员信息管理</a>
                        </li>

                    </ul>

                </div>

            </div>

            <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                <img src="/image/menu-toggler.png" alt="" />
            </a>


            <ul class="nav pull-right">
                <c:choose>
                    <c:when test="${sessionScope.memberId == null}">
                        <li><a  href="/member/loginInput">登录/注册</a></li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="#">
                                ${sessionScope.name}
                            </a>
                        </li>
                        <li><a href="/member/logout">注销</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>

        </div>

    </div>

</div>
