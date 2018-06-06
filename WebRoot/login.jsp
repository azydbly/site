<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicMeta.jsp" %>
<html>
<head>
<title>综合管理系统--登录页面</title>
<!-- ico 图标  -->
<link rel="Bookmark" href="${ctxsty}/favicon/favicon.ico" >
<link rel="Shortcut Icon" href="${ctxsty}/favicon/favicon.ico" />
<link rel="stylesheet" href="${ctxsty}/static/login/css/login1.css" />
<script type="text/javascript" src="${ctxsty}/lib/jquery/1.9.1/jquery.min.js"></script>
<script src="${ctxsty}/static/login/particleground/js/jquery.particleground.min.js"></script>
<script src="${ctxsty}/static/login/js/login1.js"></script>
</head>
<body>
<form action="login.action" method="post">
	<dl class="admin_login">
		<dt>
			<strong>综合后台管理系统</strong> <em>Management System</em>
		</dt>
		<dd class="user_icon">
			<input type="text" name="loginName" placeholder="账号" class="login_txtbx" value="${loginName }" />
		</dd>
		<dd class="pwd_icon">
			<input type="password" name="loginPassword" placeholder="${messagePassword != null?messagePassword:'密码'}" class="login_txtbx" value="${loginPassword }" />
		</dd>
		<dd class="val_icon">
			<div class="checkcode">
				<input type="text" id="J_codetext" name="code" placeholder="${messageCode != null?messageCode:'验证码'}" maxlength="4" class="login_txtbx" />
			</div>
			<img class="J_codeimg" src="code.action" id="kaptchaImage" onclick="changeCode(this)" />
		</dd>
		<dd>
			<input type="submit" value="立即登陆" class="submit_btn" />
			<input type="button" id="forgot" value="忘记密码" class="submit_btn1" />
		</dd>
		<dd>
			<p>© 2017 某某有限公司 版权所有</p>
			<p>
				<span id="showsectime"></span>
			</p>
		</dd>
	</dl>
</form>
<script type="text/javascript">
/* 忘记密码 */
$("#forgot").click(function(){
	window.open("forgotPassword.action");
});
</script>
</body>
</html>
