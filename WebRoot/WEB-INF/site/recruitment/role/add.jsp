<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>职位发布登记</title>
</head>
<body>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="deptId" id="dept_name" onchange="getRoleListByOrgId();" style="color:black;">
						<option value = "">--请选择--</option>
							<c:forEach items="${departmentList }" var="dep" varStatus="status">
								<c:if test="${dep.pid != 0 && dep.state == 1}">
									<option value="${dep.deptNum }">${dep.name }</option>
								</c:if>
							</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" id="role_name" name="positionName" style="color:black;">
						<option value="">--请选择--</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位编码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly="readonly" class="input-text" id="role_Num" name="positionCode" value="${position.positionCode }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>招聘类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="recruitType">
						<option value="社会招聘">社会招聘</option>
						<option value="校园招聘">校园招聘</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>招聘人数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="recruitNum">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位分类：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  readonly id="role_Type" name="positionType" value="${position.positionType }" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly="readonly" name="registPerson" value="${sessionScope.employee.loginName }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text " readonly id="datemin" name="registDate" value="<fmt:formatDate value="${registDate }" pattern="yyyy-MM-dd"/>" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>截止时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="datemax" name="stopDate" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}' })" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="positionDescribe"></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>招聘要求：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="recruitStandard"></textarea>
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
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			department:{
				required:true,
			},
			positionName:{
				required:true,
			},
			recruitNum:{
				required:true,
				isIntGtZero:true,
			},
			stopDate:{
				required:true,
			},
			positionDescribe:{
				required:true,
			},
			recruitStandard:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "insertPosition.action",
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

//ajax二级联动
function getRoleListByOrgId(){
    var departmentId = $("#dept_name").val();
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
		      if(list.length != 0){
			     for(var i = 0;i < list.length;i++){
			     	html += "<option value='"+list[i].name+"'>"+list[i].name+"</option>";
			     }
		   	 }else{
		   	 	layer.alert('该部门没有可以选择的职位！', {
			     closeBtn: 1,    // 是否显示关闭按钮
			     anim: 1, //动画类型
			     btn: ['确定'], //按钮
			     icon: 5,    // icon
			     })
			     html = "<option value=''>--请选择--</option>";
		   	 }
		     $("#role_name").html(html);
		     
		     var roleName=$("#role_name").val();
			 var url="selectRtypeByRname.action";
			 var data = {rname:roleName };
			 $.post(url, data, function(response, status, request) {
					$("#role_Num").val(response.number);
					if(response.type == 1){
						$("#role_Type").val("管理");
					}else if(response.type == 2){
						$("#role_Type").val("技术");
					}else if(response.type == 3){
						$("#role_Type").val("实施");
					}
				}, "json");
				
				document.getElementById("orgidState").value ="true";
		   }
		});
	}else{
		$("#role_name").removeClass().addClass("error_prompt").html("请选择部门！");
		document.getElementById("orgidState").value = "false";
	}
}

$(function(){
	$("#role_name").change(function(){
		var roleName = $("#role_name").val();
		var url = "selectRtypeByRname.action";
		var data = {rname:roleName };
		$.post(url, data, function(response, status, request) {
			$("#role_Num").val(response.number);
			if(response.type == 1){
				$("#role_Type").val("管理");
			}else if(response.type == 2){
				$("#role_Type").val("技术");
			}else if(response.type == 3){
				$("#role_Type").val("实施");
			}
		}, "json");
	});
});
</script>
</body>
</html>
