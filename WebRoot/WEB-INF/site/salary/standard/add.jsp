<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>薪酬标准管理添加</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-member-add">
		<input type="hidden" name="checkstate" id="checkState" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="deptId" id="session" onchange="getRoleListByOrgId();" style="color:black;">
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
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" id="paytype" name="roleId">
						<option value="">--请选择--</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>员工：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" id="marker" name="employeeId" style="color:black;">
						<option value="">--请选择--</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text" value="${employee.userName }" />
				<input type="hidden" name="registrantId" value="${employee.employeeNum }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="addtime" readonly value="${date }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>基本工资：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" id="basepay" name="basepay">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>绩效奖金：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="bonus">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>交通补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money " name="travel">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通讯补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="phone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>餐补：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="meal">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>住房补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="house">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出差补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money " name="bussiness">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>加班补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="addwork">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>薪酬总额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly="readonly" name="payroll" id="allmoney">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="remark">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" id="saveButton" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<input class="btn btn-primary radius" id="submitButton" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				<button onClick="layerClose();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-member-add").validate({
		rules:{
			deptId:{
				required:true,
			},
			marker:{
				required:true,
			},
			basepay:{
				required:true,
				isIntGtZero:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "insertSal.action",
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
    var departmentId = $("#session").val();
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
		     //skin: 'layui-layer-molv', //样式类名  自定义样式
		     closeBtn: 1,    // 是否显示关闭按钮
		     anim: 1, //动画类型
		     btn: ['确定'], //按钮
		     icon: 5,    // icon
		     });
	   	 	html += "<option value=''>--请选择--</option>";
	   	 }
	     $("#paytype").html(html);
	     
	     var roleId = $("#paytype").val();
			$.ajax({
			   type: "post",
			   url: "ajaxRoleEmployee.action",
			   data: "roleId=" + roleId,
			   success: function(msg){
			   	 //存到文本域方便职位的级联操作
			  	 $("#list").val(msg);
			   	 var list = eval("("+msg+")");
			   	 var html = "";
			     if(list.length != 0){
				     for(var i = 0;i < list.length;i++){
				     	html += "<option value='"+list[i].employeeNum+"'>"+list[i].userName+"</option>";
				     }
			   	 }else{
			   	 	layer.alert('该职位没有可以添加薪资的员工！', {
			    	 	closeBtn: 1,    // 是否显示关闭按钮
			     		anim: 1, //动画类型
			    		btn: ['确定'], //按钮
			     		icon: 5,    // icon
			     	});
			   	 	html += "<option value=''>--请选择--</option>";
			   	 }
			     $("#marker").html(html);
			   }
			});
	     }
	});
}

//选择职位获取职位编码	
$(function(){
	$("#paytype").change(function(){
		var roleId = $("#paytype").val();
		$.ajax({
		   type: "post",
		   url: "ajaxRoleEmployee.action",
		   data: "roleId=" + roleId,
		   success: function(msg){
		   	 //存到文本域方便职位的级联操作
		  	 $("#list").val(msg);
		   	 var list = eval("("+msg+")");
		   	 var html = "";
		     if(list.length != 0){
			     for(var i = 0;i < list.length;i++){
			     	html += "<option value='"+list[i].employeeNum+"'>"+list[i].userName+"</option>";
			     }
		   	 }else{
		   	 	 layer.alert('该职位没有可以添加薪资的员工！', {
			     closeBtn: 1,    // 是否显示关闭按钮
			     anim: 1, //动画类型
			     btn: ['确定'], //按钮
			     icon: 5,    // icon
			     });
		   	 	html += "<option value=''>--请选择--</option>";
		   	 }
		     $("#marker").html(html);
		   }
		});
	});
});


//当输入完金额失去焦点计算总工资
$(function() {
	$(".money").change(function() {
		var reg = /[0-9]/;
		var allMoney = $(".money");
		var sumMoney = 0;
		for ( var i = 0; i < allMoney.size(); i++) {
			if (allMoney[i].value != "" && reg.test(allMoney[i].value)) {
				sumMoney = sumMoney + parseInt(allMoney[i].value);
			} else {
				allMoney[i].value = 0;
				sumMoney = sumMoney + parseInt(allMoney[i].value);
			}
		}
		document.getElementById("allmoney").value = sumMoney;
	});
});

$(function() {
	//按保存后设置审核状态为起草1
	$("#saveButton").click(function(e) {
		$("#checkState").val(1);
		checkAndSubmit(e);
	});
	//按审核之后设置审核状态为待审核2
	$("#submitButton").click(function(e) {
		$("#checkState").val(2);
		checkAndSubmit(e);
	});
});
</script>
</body>
</html>
