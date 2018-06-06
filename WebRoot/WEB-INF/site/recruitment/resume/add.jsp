<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>简历管理添加</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-member-add" enctype="multipart/form-data">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1"id="dept_name" name="dept" onchange="getRoleListByOrgId();" style="color:black;">
						<option value = "">--请选择--</option>
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
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>应聘职位编码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="role_Num" name="positionCode" readonly value="${resumeManage.positionCode }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位分类：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly id="role_Type" name="positionType" value="${resumeManage.positionType }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="role_Type" name="username" value="${resumeManage.username }" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" value="男" checked>
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex" value="女">
					<label for="sex-2">女</label>
				</div>
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
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>EMAIL：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="mail" id="email" value="${resumeManage.mail }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="11" class="input-text" name="phone" value="${resumeManage.phone }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">户口所在地：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="homeLocation" value="${resumeManage.homeLocation }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="address" value="${resumeManage.address }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>政治面貌：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="politicalFace">
						<option value="群众">群众</option>
						<option value="团员">团员</option>
						<option value="党员">党员</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="18" class="input-text" name="idCard" value="${resumeManage.idCard }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>毕业院校：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="graduateCollege" value="${resumeManage.graduateCollege }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学历：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="educationBackground">
						<option value="专科">专科</option>
						<option value="本科">本科</option>
						<option value="研究生">研究生</option>
						<option value="硕士">硕士</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="major" value="${resumeManage.major }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>工作经验：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="workExperience" value="${resumeManage.workExperience }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>薪资要求：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="hopeWages" value="${resumeManage.hopeWages }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否在职：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="onTheJob">
						<option value="离职">离职</option>
						<option value="在职">在职</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否应届生：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="graduateNow">
						<option value="是">是</option>
						<option value="否">否</option>
					</select>
				</span>
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
				<textarea type="text" class="input-text textarea" name="personalResume" ></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">简历附件：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="btn-upload form-group">
					<input class="input-text upload-url" type="text" id="uploadfile" name="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
					<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
					<input type="file" name="file" multiple class="input-file">
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">是否有人推荐面试：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="recommend" id="recommend" onchange="Recommend()">
						<option value="否">否</option>
						<option value="是">是</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl" id="hidden">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>推荐人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="recommendPerson" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>推荐时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly name="recommendDate" value="<fmt:formatDate value="${recommendDate }" pattern="yyyy-MM-dd"/>" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">推荐面试意见：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="recommendIdea" ></textarea>
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
			username:{
				required:true,
				isChinese:true,
			},
			mail:{
				required:true,
				email:true,
			},
			phone:{
				required:true,
				isMobile:true,
			},
			idCard:{
				required:true,
				isIdCardNo:true,
			},
			graduateCollege:{
				required:true,
			},
			major:{
				required:true,
			},
			workExperience:{
				required:true,
			},
			hopeWages:{
				required:true,
			},
			personalResume:{
				required:true,
			},
			recommendPerson:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "insertResumeManage.action",
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
		var roleName=$("#role_name").val();
		var url="selectRtypeByRname.action";
		var data={rname:roleName };
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


$(function(){
	$("#hidden").hide();
});

//通过选择是否有推荐人，显示输入推荐人信息
function Recommend(){
    var recommend = $("#recommend").val();
    if(recommend == '是'){
    	$("#hidden").show(); 
    }else{
    	$("#hidden").hide();    
    };
}
$(function(){
    var recommend = $("#recommend").val();
    if(recommend == '是'){
    	$("#hidden").show(); 
    }else{
    	$("#hidden").hide();    
    };
});
</script>
</body>
</html>