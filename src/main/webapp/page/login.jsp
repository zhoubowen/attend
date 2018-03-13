<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>


<body class="login">

<!-- BEGIN LOGO -->

<div class="logo">

    <img src="/image/logo-big.png" alt=""/>

</div>

<!-- END LOGO -->

<!-- BEGIN LOGIN -->

<div class="content">

    <!-- BEGIN LOGIN FORM -->

    <form class="form-vertical login-form" action="/member/login" method="post" novalidate="novalidate" style="display: block;">

        <h3 class="form-title">登录</h3>

        <div class="alert alert-error hide">

            <button class="close" data-dismiss="alert"></button>

            <span>输入用户名密码.</span>

        </div>

        <div class="control-group">

            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

            <label class="control-label visible-ie8 visible-ie9">用户名</label>

            <div class="controls">

                <div class="input-icon left">

                    <i class="icon-user"></i>

                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="Username" name="account">

                </div>

            </div>

        </div>

        <div class="control-group">

            <label class="control-label visible-ie8 visible-ie9">密码</label>

            <div class="controls">

                <div class="input-icon left">

                    <i class="icon-lock"></i>

                    <input class="m-wrap placeholder-no-fix" type="password" placeholder="Password" name="password">

                </div>

            </div>

        </div>

        <div class="form-actions">

            <button type="submit" class="btn green pull-right">

                登录 <i class="m-icon-swapright m-icon-white"></i>

            </button>

        </div>

        <div class="create-account">
            <p>
                还没有账号 ?&nbsp;
                <a href="javascript:;" id="register-btn" class="">注册新用户</a>

            </p>

        </div>

    </form>

    <!-- END LOGIN FORM -->

    <!-- BEGIN REGISTRATION FORM -->

    <form class="form-vertical register-form"  method="post" action="/member/register" novalidate="novalidate" style="display: none;">

        <h3 class="">注册新用户</h3>

        <p>请输入以下注册信息:</p>

        <div class="control-group error">

            <label class="control-label visible-ie8 visible-ie9">用户名</label>

            <div class="controls">

                <div class="input-icon left">

                    <i class="icon-user"></i>

                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="用户名" name="account">

                </div><label for="username" class="help-inline help-small no-left-padding">用户名必填.</label>

            </div>

        </div>

        <div class="control-group error">

            <label class="control-label visible-ie8 visible-ie9">昵称</label>

            <div class="controls">

                <div class="input-icon left">

                    <i class="icon-user"></i>

                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="昵称" name="name">

                </div><label for="name" class="help-inline help-small no-left-padding">昵称必填.</label>

            </div>

        </div>


        <div class="control-group error">

            <label class="control-label visible-ie8 visible-ie9">密码</label>

            <div class="controls">

                <div class="input-icon left">

                    <i class="icon-lock"></i>

                    <input class="m-wrap placeholder-no-fix" type="password" id="register_password" placeholder="密码" name="password">

                </div><label for="register_password" class="help-inline help-small no-left-padding">密码必填.</label>

            </div>

        </div>

        <div class="control-group">

            <label class="control-label visible-ie8 visible-ie9">再次输入密码</label>

            <div class="controls">

                <div class="input-icon left">

                    <i class="icon-ok"></i>

                    <input class="m-wrap placeholder-no-fix valid" type="password" placeholder="再次输入密码" name="rpassword">

                </div>

            </div>

        </div>

        <div class="control-group error">

            <label class="control-label visible-ie8 visible-ie9">邮箱</label>

            <div class="controls">

                <div class="input-icon left">

                    <i class="icon-envelope"></i>

                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="Email" name="email">

                </div><label for="email" class="help-inline help-small no-left-padding">邮箱必填.</label>

            </div>

        </div>

        <div class="control-group error">

            <label class="control-label visible-ie8 visible-ie9">所属公司名称</label>

            <div class="controls">

                <div class="input-icon left">

                    <i class="icon-user-md"></i>

                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="所属公司名称" name="company">

                </div><label for="company" class="help-inline help-small no-left-padding">公司名称必填.</label>

            </div>

        </div>


        <div class="form-actions">

            <button id="register-back-btn" type="button" class="btn">

                <i class="m-icon-swapleft"></i>  返回

            </button>

            <button type="submit" id="register-submit-btn" class="btn green pull-right">

                注册 <i class="m-icon-swapright m-icon-white"></i>

            </button>

        </div>

    </form>

</div>

<%@include file="footer.jsp"%>
<script>

    jQuery(document).ready(function () {

        App.init();

        Login.init();

    });

</script>

</body>

</html>
