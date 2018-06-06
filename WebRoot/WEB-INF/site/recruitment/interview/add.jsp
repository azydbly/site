<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>面试管理</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-member-add" enctype="multipart/form-data" >
		<input type="hidden" name="id" value="${resumeManage.id }" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>应聘职位名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="positionName" value="${resumeManage.positionName }" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>应聘职位名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="positionCode" value="${resumeManage.positionCode }" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位分类：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="positionType" value="${resumeManage.positionType }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="username" value="${resumeManage.username }" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<input type="text" class="input-text" readonly name="sex" value="${resumeManage.sex }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>招聘类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="recruitType" value="${resumeManage.recruitType }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>EMAIL：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="mail" value="${resumeManage.mail }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="phone" value="${resumeManage.phone }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">户口所在地：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="homeLocation" value="${resumeManage.homeLocation }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="address" value="${resumeManage.address }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>政治面貌：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="politicalFace" value="${resumeManage.politicalFace }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="idCard" value="${resumeManage.idCard }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>毕业院校：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="graduateCollege" value="${resumeManage.graduateCollege }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学历：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="educationBackground" value="${resumeManage.educationBackground }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="major" value="${resumeManage.major }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>工作经验：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="workExperience" value="${resumeManage.workExperience }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>薪资要求：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="hopeWages" value="${resumeManage.hopeWages }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否在职：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="onTheJob" value="${resumeManage.onTheJob }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否应届生：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="graduateNow" value="${resumeManage.graduateNow }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="registDate" value="<fmt:formatDate value="${registDate }" pattern="yyyy-MM-dd"/>" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>个人履历：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" readonly name="personalResume">${resumeManage.personalResume }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">简历附件：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:if test="${resumeManage.urlFile == '' || resumeManage.urlFile == null }">
					未上传
				</c:if>
				<c:if test="${resumeManage.urlFile != '' && resumeManage.urlFile != null }">
					<a href="download.action?url=${resumeManage.url }&urlFile=${resumeManage.urlFile}">
						${resumeManage.urlFile }
					</a>
				</c:if>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">是否有人推荐面试：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="recommend" value="${resumeManage.recommend }"/>
			</div>
		</div>
		<c:if test="${resumeManage.recommend == '是' }">
			<div class="row cl" id="hidden">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>推荐人：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" readonly name="recommendPerson" value="${resumeManage.recommendPerson }"/>
				</div>
			</div>
		</c:if>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>推荐时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="recommendDate" value="<fmt:formatDate value="${resumeManage.recommendDate }" pattern="yyyy-MM-dd"/>" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">推荐面试意见：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" readonly name="recommendIdea">${resumeManage.recommendIdea }</textarea>
			</div>
		</div>
		<br /><hr color="#009966" size="1px" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">面试结果：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="resumeStatus">
						<option value="2"
							<c:if test="${resumeStatus == 2 }">selected</c:if>>推荐二面</option>
						<option value="4"
							<c:if test="${resumeStatus == 4 }">selected</c:if>>建议录用</option>
						<option value="5"
							<c:if test="${resumeStatus == 5 }">selected</c:if>>录用</option>
						<option value="6"
							<c:if test="${resumeStatus == 6 }">selected</c:if>>驳回</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>一面面试人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="recommendPersonFirst" value="${sessionScope.employee.userName  }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>一面面试时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="recommendDateFirst" value="<fmt:formatDate value='${resumeManageDate }' pattern='yyyy-MM-dd'/>" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>一面面试评价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="recommendDescribeFirst">${resumeManage.recommendDescribeFirst }</textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
			recommendDescribeFirst:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "saveInterview.action?save=1",
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
</script>
</body>
</html>
