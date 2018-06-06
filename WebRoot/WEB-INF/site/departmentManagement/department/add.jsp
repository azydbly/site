<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>部门管理</title>
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-user-add">
		<input type="hidden" name="createDate" value="${createDate }" />
		<input type="hidden" value="${deptNum }" id="deptNum" name="deptNum">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>部门简称：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>部门全称：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text" id="fullName" name="fullName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上级部门：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<span class="select-box">
					<select class="select" size="1" name="pid" style="background-color: white; color: black;">
						<c:forEach items="${deptList }" var="department">
							<option value="${department.deptNum }">${department.name}</option>
						</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地址：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<input type="text" class="input-text" name="address">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>简介：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<textarea name="description" class="textarea"></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">备注：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<textarea name="remark" class="textarea"></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否启用：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<span class="select-box">
					<select class="select" size="1" name="state">
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-2">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
                    url:"selDeparForFullname.action",
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
				url: "insertDept.action",
				success:function(msg){
					if(msg){
						window.parent.location.reload();
					}
				}
			});
		}
	});
});
</script>
</body>
</html>