<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>修改员工</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-member-add">
		<input type="hidden" class="input-text" id="number" name="employeeNum" value="${user.employeeNum }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登录账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly="readonly" class="input-text" id="url" name="url" value="${user.loginName }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="userName" id="userName" value="${user.userName }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" id="department" name="deptId" onchange="getRoleListByOrgId();">
						<c:forEach items="${deptList }" var="department">
								<c:if test="${department.pid != 0 && department.state == 1 }">
									<option
										<c:if test="${user.deptId == department.deptNum }">selected</c:if>
									 value="${department.deptNum }">${department.name}</option>
								</c:if>
							</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属职位：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" id="position" name="roleId">
						<c:forEach items="${roleList }" var="role">
							<c:if test="${role.deptId == user.deptId }">
								<option
									<c:if test="${user.roleId == role.number }">selected="selected"</c:if>
								 		value="${role.number }">${role.name }
								</option>
							</c:if>
						</c:forEach> 
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="18" class="input-text" name="idCard" id="idCard" value="${user.idCard }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="11" class="input-text" name="telphone" id="telphone" value="${user.telphone }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="email" id="email" value="${user.email }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">联系地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="address" value="${user.address }">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				<button onClick="layerClose();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){

    $("#email").emailsuggest();

	$("#form-member-add").validate({
		rules:{
			userName:{
				required:true,
				isChinese:true,
			},
			idCard:{
				required:true,
				isIdCardNo:true,
			},
			telphone:{
				required:true,
				isMobile:true,
			},
			email:{
				required:true,
				email:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			 $(form).ajaxSubmit({
				type: 'post',
				url: "updateEmployee.action",
				data: $(form).serialize(),
				dataType: "json",
				success: function(data) {
					if(data.status == 200) {
						var message = '更新成功!';
						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引,隐藏layer层和shade
						parent.$('#layui-layer'+index).css({'display':'none'});
	                    parent.$('#layui-layer-shade'+index).css({'display':'none'});
	                    parent.reloadTable(); //再刷新DT
						parent.showSuccessMessage(message, null, function() {
							parent.layer.close(index); //然后执行关闭     
						});
					} else {
						var message = '更新失败!';
						parent.showFailMessage(message);
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

//ajax二级联动
function getRoleListByOrgId(){
    var departmentId = $("#department").val();
	if(departmentId != 0){
		$.ajax({
		   type: "post",
		   url: "ajaxDeptment.action",
		   data: "departmentId=" + departmentId,
		   success: function(msg){
		   	 //存到文本域方便职位的级联操作
		  	 $("#list").val(msg);
		   	 var list = eval("("+msg+")");
		   	 var html = "";
		     for(var i = 0;i < list.length;i++){
		     	html += "<option value='"+list[i].number+"'>"+list[i].name+"</option>";
		     }
		     $("#position").html(html);
		     document.getElementById("departmentId").removeClass().innerHTML = "";
		     document.getElementById("orgidState").value ="true";
		   }
		});
	}else{
		$("#departmentId").removeClass().addClass("error_prompt").html("请选择部门！");
		document.getElementById("orgidState").value = "false";
	}
}
</script>
</body>
</html>
