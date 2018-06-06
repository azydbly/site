<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>薪酬标准管理修改</title>
</head>
<body>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
		<input type="hidden" name="checkstate" id="checkState" value="${salary.checkstate }" />
		<input type="hidden" id="xid" name="id" value="${salary.id }" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly="readonly" name="section" value="${salary.department.fullName }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly="readonly" class="input-text" name="paytype" value="${salary.role.name }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>员工：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text" value="${salary.employee.userName }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly="readonly" class="input-text" name="registrant" value="${entry }" />
				<input type="hidden" name="registrantId" value="${employee.employeeNum }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="addtime" readonly value="<fmt:formatDate value='${salary.addtime }' pattern='yyyy-MM-dd' />" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>基本工资：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="basepay" value="${salary.basepay }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>绩效奖金：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="bonus" value="${salary.bonus }" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>交通补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money " name="travel" value="${salary.travel }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通讯补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="phone" value="${salary.phone }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>餐补：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="meal" value="${salary.meal }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>住房补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="house" value="${salary.house }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出差补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="bussiness" value="${salary.bussiness }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>加班补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text money" name="addwork" value="${salary.addwork }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>薪酬总额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly="readonly" name="payroll" id="allmoney" value="${salary.payroll }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="remark" value="${salary.remark }">
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
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			roleNum:{
				required:true,
			},
			salaryId:{
				required:true,
			},
			pphone:{
				required:true,
				isMobile:true,
			},
			idCard:{
				required:true,
				isIdCardNo:true,
			},
			email:{
				required:true,
				email:true,
			},
			address:{
				required:true,
			},
			hukouAdrs:{
				required:true,
			},
			univercity:{
				required:true,
			},
			major:{
				required:true,
			},
			resume:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			 $(form).ajaxSubmit({
				type: 'post',
				url: "updSalaryById.action",
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
						var message = '失败!';
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



//移出简历插件
function removeAttachment() {
	layer.confirm('确定要删除附件吗！', {
     	closeBtn: 1,    // 是否显示关闭按钮
     	anim: 1, //动画类型
    	btn: ['确定','取消'], //按钮
    	icon: 5,    // icon
    },function(){
		var fileNum = "${sltFile.fileNum }";
		var fileLocation = "${sltFile.fileLocation}";
		var url = "removeFile.action";
		var data = {
			fileNum : fileNum,
			fileLocation:fileLocation
		};
		$.post(url, data, function(response, status, request) {
			if(response = 1){
				$("#attachmentDown").html("未上传");
			}
		});
		layer.msg('已删除', {icon: 1});
	});
}

//选择保存还是提交审核
$(function(){
	var checkState = document.getElementById("checkState").value;
	//提交审核
	$("#submitButton").click(function(e) {
		if (checkState == 1) {
			$("#checkState").val(2);
			checkAndSubmit(e);
		} else {
			$("#checkState").val(6);
			checkAndSubmit(e);
		}
	});
	//保存
	$("#saveButton").click(function(e) {
		if (checkState == 1) {
			$("#checkState").val(1);
			checkAndSubmit(e);
		} else {
			$("#checkState").val(5);
			checkAndSubmit(e);
		}
	});
});
</script>
</body>
</html>