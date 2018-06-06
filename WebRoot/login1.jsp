<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/publicLogin.jsp" %>
<html>
<head>
<title>综合管理系统--登录页面</title>
<script type="text/javascript">
/* 更换验证码 */
function changeCode(img){
	img.src="code1.action?id= " + Math.random();
}

$(function(){
	$("#form-member-add").validate({
		rules:{
			loginName:{
				required:true,
			},
			loginPassword:{
				required:true,
			},
			code:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
	});
});
</script>
</head>
<body>
<div id="container">
	<canvas id="waterfall"></canvas>
    <div class="emma flex">
		<div class="loginBox">
			<form class="form form-horizontal" id="form-member-add" action="login1.action" method="post">
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont" style="color: #FFE4E1;">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input name="loginName" type="text" placeholder="请输入账号" class="input-text size-L" value="${loginName }">
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont" style="color:#FFE4E1;">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input name="loginPassword" type="password" placeholder="请输入密码" class="input-text size-L" value="${loginPassword }">
						<label id="pwdMessagea">${meg }</label>
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont" style="color:#FFE4E1;">&#xe68f;</i></label>
					<div class="formControls col-xs-8">
						<input maxlength="4" class="input-text size-L" name="code" type="text" placeholder="验证码" style="width: 170px;">
						<img id="codeImg" title="点击图片更换验证码" src="code1.action" onclick="changeCode(this)">
						<label id="codeMessagea">${codeMessage }</label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3 mb2">
						<input type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> 
						<input type="button" id="forgot" class="btn btn-warning radius size-L" value="&nbsp;忘记密码&nbsp;"> 
					</div>
				</div>
			</form>
		</div>
	 </div>
</div>	
<script src="${ctxsty}/static/login/js/login.js"></script>
<script type="text/javascript">
$("#forgot").click(function(){
	window.open("forgotPassword.action");
});
</script>
</body>
</html>