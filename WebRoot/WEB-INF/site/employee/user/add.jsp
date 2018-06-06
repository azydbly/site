<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>添加员工</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-member-add">
		<input type="hidden" value="${sessionScope.employee.employeeNum }" name="entryMan" />
		<input type="hidden" name="createDate" value="${createDate }" />
		<input type="hidden" class="input-text" id="employeeNum" value="${empNum }" name="employeeNum">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登录账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="loginName" id="number">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="userName" id="userName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" name="loginPassword" id="loginPassword">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" id="department" name="deptId" onchange="getRoleListByOrgId();" style="color:black;">
							<option value="">--请选择--</option>
							<c:forEach items="${deptList }" var="department">
								<c:if test="${department.pid != 0 && department.state == 1 }">
									<option value="${department.deptNum }">${department.name}</option>
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
					<select  class="select" id="position" size="1" name="roleId" style="color:black;">
						<option value="">--请选择--</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input maxlength="18" type="text" class="input-text" name="idCard" id="idCard">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input maxlength="11" type="text" class="input-text" name="telphone" id="phone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="email" id="email">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">联系地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="address" id="address">
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
//ajax二级联动
function getRoleListByOrgId(){
    var departmentId = $("#department").val();
	$.ajax({
	   type: "post",
	   url: "ajaxDeptment.action",
	   data: "departmentId=" + departmentId,
	   success: function(msg){
	   	 //存到文本域方便职位的级联操作
	  	 $("#list").val(msg);
	   	 var list = eval("("+msg+")");
	   	 var html = "";
	      if(list.length != 0){
		     for(var i = 0;i < list.length;i++){
		     	html += "<option value='"+list[i].number+"'>"+list[i].name+"</option>";
		     }
	   	 }else{
	   	 	 layer.alert('该部门没有可以选择的职位！', {
			     closeBtn: 1,    // 是否显示关闭按钮
			     anim: 1, //动画类型
			     btn: ['确定'], //按钮
			     icon: 5,    // icon
			 });
	   	 	html += "<option value=''>--请选择--</option>";
	   	 }
	     $("#position").html(html);
	   }
	});
}

$(function($) {

    $("#email").emailsuggest();

	$("#form-member-add").validate({
		rules:{
			loginName:{
				required:true,
				  remote:{
                    url:"showLoginName.action",
                    type:"post",
                    data: {
                    	menuname: function(){
                    		return $("#number").val();
                    	},
                    },
 					dataType: "html",
                    dataFilter: function(data, type) {
                        if (data == "true"){
                            return true;
                        }else{
                            return false;
                        }
                    }
                }
			},
			userName:{
				required:true,
				isChinese:true,
			},
			loginPassword:{
				required:true,
				minlength:6,
				maxlength:15,
			},
			deptId:{
				required:true,
			},
			roleId:{
				required:true,
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
				type: "post",
				url: "insEmp.action",
				data: $(form).serialize(),
				dataType: "json",
				success: function(data) {
					if(data.status == 200) {
						var message = '添加成功!';
						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引,隐藏layer层和shade
						parent.$('#layui-layer'+index).css({'display':'none'});
				        parent.$('#layui-layer-shade'+index).css({'display':'none'});
				        parent.reloadTable(); //再刷新DT
						parent.showSuccessMessage(message, null, function() {
							parent.layer.close(index); //然后执行关闭     
						});
					} else {
						var message = '添加失败!';
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
</script>
</body>
</html>