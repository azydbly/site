<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>部门修改</title>
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-user-add">
		<input type="hidden" name="deptNum" value="${department.deptNum }" />
		<input type="hidden" name="id" value="${department.id }" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>部门简称：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text" value="${department.name }" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>部门全称：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text" id="fullName" value="${department.fullName }" name="fullName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上级部门：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<span class="select-box">
					<select class="select" size="1" name="pid" style="background-color: white; color: black;">
						<c:forEach items="${deptList }" var="dept">
							<option value="${dept.deptNum }" <c:if test="${department.pid == dept.deptNum }">selected</c:if>>${dept.name}</option>
						</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地址：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text" value="${department.address }" name="address">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>简介：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<textarea name="description" class="textarea">${department.description }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">备注：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<textarea name="remark" class="textarea">${department.remark }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否启用：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<span class="select-box">
					<select class="select" size="1" name="state">
						<option <c:if test="${department.state == 1 }">selected</c:if> value="1">是</option>
						<option <c:if test="${department.state == 0 }">selected</c:if> value="0">否</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-2">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				<input class="btn btn-danger radius" onclick="deleteDept(this,'${department.deptNum}')" type="button" value="&nbsp;&nbsp;删除&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-user-add").validate({
		rules:{
			name:{
				required:true,
			},
			fullName:{
				required:true,
				remote:{
                    url:"selDeparForFullname.action?id=${department.id }",
                    type:"post",
                    data: {
                    	fullName: function(){
                    		return $("#fullName").val();
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
			address:{
				required:true,
			},
			description:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "updateDept.action",
				success:function(msg){
					if(msg){
						window.parent.location.reload();
					}else{
						layer.alert('更新失败！', {
					     closeBtn: 1,    // 是否显示关闭按钮
					     anim: 1, //动画类型
					     btn: ['确定'], //按钮
					     icon: 5,    // icon
					     });
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					layer.alert(errorThrown + '服务器端异常', {
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

/*部门-删除*/
function deleteDept(obj,deptNum){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			url: 'delDept.action?deptNum=' + deptNum,
			type: 'POST',
			dataType: 'json',
			success: function(data){
				if(data.status == 200) {
					window.parent.location.reload();
				}else if(data.status == 15000) {
					layer.msg('该部门下面存在职位，删除失败!', {icon: 5});
				} else {
					layer.msg('删除失败!', {icon: 5});
				}
			},
		});		
	});
}
</script>
</body>
</html>