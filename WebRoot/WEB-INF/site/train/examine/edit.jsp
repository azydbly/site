<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>培训管理</title>
</head>
<body>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
		<input type=hidden name="id" value="${train.id }" />
		<input type="hidden" name="topenions" id="topenions" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="tname" value="${train.tname }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训讲师：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="teacher" value="${train.teacher }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="begintime" value="<fmt:formatDate value='${train.begintime }' pattern='yyyy-MM-dd' />">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>至：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="endtime" value="<fmt:formatDate value='${train.endtime }' pattern='yyyy-MM-dd' />">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训目的：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text" name="taim" value="${train.taim }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>参与人员：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  readonly name="tpersion" value="${train.tpersion }" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训简介：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="tabstracts" value="${train.tabstracts }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训资料：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:if test="${train.tfiles != '' && train.tfiles != null }">
					${train.tfiles }&nbsp;&nbsp;
					<a title="下载资料" href="downTrain.action?url=${train.url}&tfiles=${train.tfiles }" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe641;</i>下载资料</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${train.tfiles == '' || train.tfiles == null }">
					未上传
				</c:if>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>审核意见：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="tview" value="${train.tview }"/>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" id="submitButton" type="submit" value="&nbsp;&nbsp;驳回&nbsp;&nbsp;">
				<input class="btn btn-primary radius" id="saveButton" type="submit" value="&nbsp;&nbsp;通过&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>
</div>
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
			tview:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			 $(form).ajaxSubmit({
				type: 'post',
				url: "trainUpdateShenHe.action",
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

$(function(){
	//按保存后设置审核状态为起草1
	$("#saveButton").click(function(e) {
		$("#topenions").val(3);
		checkAndSubmit(e);
	});
	//按审核之后设置审核状态为审核中2
	$("#submitButton").click(function(e) {
		$("#topenions").val(4);
		checkAndSubmit(e);
	});
});
</script>
</body>
</html>
