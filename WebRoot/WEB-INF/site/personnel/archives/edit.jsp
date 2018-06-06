<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>档案添修改</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-member-add" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${sltFile.id }" />
		<input type=hidden name="checkState" id="checkState" value="${sltFile.checkState }" />
		<input type=hidden name="oldFileLocation" value="${sltFile.fileLocation }" />
		<input type=hidden name="fileNum" value="${sltFile.fileNum }" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  readonly value="${sltFile.department.fullName }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  readonly value="${sltFile.role.name }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  readonly value="${sltFile.employee.userName }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="18" class="input-text" value="${sltFile.idCard }" readonly >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>档案状态：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="state">
						<option value="1"
							<c:if test="${1 == sltFile.state }">selected</c:if>>试用期</option>
						<option value="2"
							<c:if test="${2 == sltFile.state }">selected</c:if>>正式员工</option>
						<option value="3"
							<c:if test="${3 == sltFile.state }">selected</c:if>>离职</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" value="1" <c:if test="${sltFile.sex == 1 }">checked</c:if>/>
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex" value="0"<c:if test="${sltFile.sex == 0 }">checked</c:if>/>
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>EMAIL：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="email" value="${sltFile.email }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="11" class="input-text" name="pphone" value="${sltFile.pphone }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="address" value="${sltFile.address }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">户口所在地：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="hukouAdrs" value="${sltFile.hukouAdrs }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>政治面貌：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="polity">
						<option
							<c:if test="${sltFile.polity == '群众' }">select</c:if> value="群众">群众</option>
						<option
							<c:if test="${sltFile.polity == '团员' }">select</c:if> value="团员">团员</option>
						<option
							<c:if test="${sltFile.polity == '党员' }">select</c:if> value="党员">党员</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>毕业院校：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="univercity" value="${sltFile.univercity }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="major" value="${sltFile.major }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学历：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="education">
						<option value="专科"
								<c:if test="${sltFile.education == '专科' }">selected</c:if>>专科</option>
							<option value="本科"
								<c:if test="${sltFile.education == '本科' }">selected</c:if>>本科</option>
							<option value="硕士"
								<c:if test="${sltFile.education == '硕士' }">selected</c:if>>硕士</option>
							<option value="博士"
								<c:if test="${sltFile.education == '博士' }">selected</c:if>>博士</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">开户行：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="bankName" value="${sltFile.bankName }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">银行卡号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="bkCardNum" value="${sltFile.bkCardNum }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">社保卡号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="sequNum" value="${sltFile.sequNum }" />
			</div>
		</div>
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly value="${sltFile.checkMan }" />
				<input type="hidden" name="checkMan" value="${employee.employeeNum }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>建档时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly value="<fmt:formatDate value="${sltFile.createDate }" pattern="yyyy-MM-dd"/>" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>个人履历：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="resume">${sltFile.resume }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">家庭关系信息：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="famRelation">${sltFile.famRelation }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">档案附件：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="btn-upload form-group" id="attachmentDown">
					<c:if test="${sltFile.fileLocation == null || sltFile.fileLocation == '' }">
						未上传
					</c:if>
					<c:if test="${sltFile.fileLocation != null && sltFile.fileLocation != '' }">
						${sltFile.fileLocation }&nbsp;&nbsp;
						<a title="下载档案" href="downAttach.action?url=${sltFile.url }&fileName=${sltFile.fileLocation}" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe641;</i>下载档案</a>&nbsp;&nbsp;
						<a href="javascript:;" onclick="removeAttachment();" title="移出附件" class="btn btn-danger radius">
							<i class="Hui-iconfont">&#xe6e2;</i>移除附件
						</a>
					</c:if>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">是否重新上传附件：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input type="radio" id="again-1" name="again" value="是" />
					<label for="again-1">是</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="again-2" name="again" value="否" checked />
					<label for="again-2">否</label>
				</div>
			</div>
		</div>
		<div class="row cl" id="tr">
			<label class="form-label col-xs-4 col-sm-3">简历附件：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="btn-upload form-group">
					<input class="input-text upload-url" type="text" id="uploadfile" name="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
					<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
					<input type="file" name="file" multiple class="input-file">
				</span>
			</div>
		</div>
		<div class="row cl" id="tr2">
			<label class="form-label col-xs-4 col-sm-3"></label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="Huialert Huialert-danger"><i class="icon-remove"></i>温馨提示：重新上传按钮为“是”，如果不选择上传附件，原附件提交之后删除！</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="remark">${sltFile.remark }</textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" id="saveButton" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<input class="btn btn-primary radius" id="submitButton" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
				url: "saveUpdate.action",
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
	var checkState = $("#checkState").val();
	//提交审核
	$("#submitButton").click(function(e) {
		if (checkState == 4 || checkState == 5) {
			$("#checkState").val(6);
			checkAndSubmit(e);
		} else {
			$("#checkState").val(2);
			checkAndSubmit(e);
		}
	});
	//保存
	$("#saveButton").click(function(e) {
		checkAndSubmit(e);
	});
});
</script>
</body>
</html>
