<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>邮箱找回密码</title>
<link rel="stylesheet" href="${ctxsty}/static/login/css/forgot.css" />
</head>
<body>
<article class="page-container">
	<div id="page">
		<form class="form form-horizontal" id="form-member-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">用户名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="填写用户名" name="loginName" id="loginName">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">邮箱地址：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="填写邮箱" name="email" id="email">
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" id="sendEmail" type="submit" value="发送验证码">
				</div>
			</div>
		</form>
	</div>
</article>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function($) {
	$("#form-member-add").validate({
		rules:{
			loginName:{
				required:true,
				  remote:{
                    url:"showForgotName.action",
                    type:"post",
 					dataType: "html",
 					data: {
                    	loginName: function(){
                    		return $("#loginName").val();
                    	},
                    },
                    dataFilter: function(data, type) {
                        if (data == "true"){
                            return true;
                        }else{
                            return false;
                        }
                    }
                }
			},
			email:{
				required:true,
				email:true,
				 remote:{
                    url:"showForgotEmail.action",
                    type:"post",
 					dataType: "html",
 					data: {
                    	loginName: function(){
                    		return $("#loginName").val();
                    	},
                    },
                    dataFilter: function(data, type) {
                        if (data == "true"){
                            return true;
                        }else{
                            return false;
                        }
                    }
                }
			},
		},
		messages: {
    		loginName: {
      		 	remote: '用户名不存在'
		     },
		    email: {
		       remote: '用户名跟邮箱不匹配'
		    },
		},  
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: "post",
				url: "getEmail.action",
				data: $(form).serialize(),
				dataType: "json",
				success: function(data) {
					if(data.status == 200) {
						layer.msg('发送成功！', {time: 2000, icon:6});
						//$.Huimodalalert('发送成功！',3000);
						$("#sendEmail").val("已发送");
						/*让这个按钮不可按*/
						$("#sendEmail").attr("disabled", true)
					} else {
						//$.Huimodalalert('发送失败，请检查邮箱是否正确！',3000);
						layer.msg('发送失败，请检查邮箱是否正确！', {time: 2000, icon:5});
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					layer.alert(errorThrown, {
					     closeBtn: 1,    // 是否显示关闭按钮
					     anim: 1, //动画类型
					     btn: ['确定'], //按钮
					     icon: 5,    // icon
					     });
					return false;
				}
			});
		}
	});
});
</script>
<script src="${ctxsty}/static/login/particleground/js/jquery.particleground.min.js"></script>
<script src="${ctxsty}/static/login/js/login1.js"></script>
</body>
</html>
