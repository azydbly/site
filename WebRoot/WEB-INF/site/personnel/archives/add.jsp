<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>人事档案添加</title>
<style type="text/css">
.select-box-areas {
    border: solid 1px #ddd;
    box-sizing: border-box;
    vertical-align: middle;
    width: 25%;
    display: inline-block;
}
</style>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-member-add" enctype="multipart/form-data" >
		<input type="hidden" name="checkState" id="checkState" />
		<input type="hidden" name="fileNum" value="${fileNum }" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" id="department" name="deptId" onchange="getRoleListByOrgId();" style="color:black;">
						<option value="" selected>--请选择--</option>
						<c:forEach items="${departments }" var="dep">
							<c:if test="${dep.pid != 0 && dep.state == 1 }">
								<option value="${dep.deptNum }">${dep.fullName }</option>
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
					<select class="select" size="1" id="roleId" name="roleId" style="color:black;">
						<option value="" selected>--请选择--</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" id="empName" name="empName" style="color:black;">
						<option value="">--请选择--</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="18" class="input-text" readonly id="idCard" name="idCard">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>档案状态：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="state">
						<option value="1">试用期</option>
						<option value="2">正式员工</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" value="1" checked>
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex" value="0">
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		<div class="row cl">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>EMAIL：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="email" id="email" readonly />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="11" class="input-text" name="pphone" id="pphone" readonly />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>户口所在地：</label>
			<div class="formControls col-xs-8">
				<div class="row clearfix" style="margin-top:0">
					<div class="col-xs-3">
						<span class="select-box">
							<select class="select" size="1" name="province" id="province" onchange="getCityByProvince();">
								<option value="" selected>选择省份</option>
                                <c:forEach items="${areas }" var="province">
                                    <option value="${province.number}">${province.name}</option>
                                </c:forEach>
							</select>
						</span>
					</div>
					<div class="col-xs-3">
						<span class="select-box">
							<select class="select" size="1" name="city" id="city" onchange="getCountyByCity();">
								<option value="" selected>选择城市</option>
							</select>
						</span>
					</div>
					<div class="col-xs-3">
						<span class="select-box">
							<select class="select" size="1" name="county" id="county" onchange="getTownByCounty();">
								<option value="" selected>选择区县</option>
							</select>
						</span>
					</div>
					<div class="col-xs-3">
						<span class="select-box">
							<select class="select" size="1" name="town" id="town" onchange="getVillageByTown();">
								<option value="" selected>选择城镇</option>
							</select>
						</span>
					</div>
					<div class="col-xs-3">
						<span class="select-box">
							<select class="select" size="1" name="village" id="village">
								<option value="" selected>选择村庄</option>
							</select>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="address" />
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>政治面貌：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="polity">
						<option value="群众">群众</option>
						<option value="团员">团员</option>
						<option value="党员">党员</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>毕业院校：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="univercity" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="major" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学历：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select" size="1" name="education">
						<option value="专科">专科</option>
						<option value="本科">本科</option>
						<option value="研究生">研究生</option>
						<option value="硕士">硕士</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">开户行：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="bankName" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">银行卡号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="bkCardNum" id="bkCardNum" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">社保卡号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="sequNum" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">登记人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${employee.userName }" readonly />
				<input type="hidden" name="checkMan" value="${employee.employeeNum }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>个人履历：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="resume" ></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">家庭关系信息：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="famRelation" ></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="remark" ></textarea>
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
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" id="saveButton" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<input class="btn btn-primary radius" id="submitButton" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="${ctxsty}/static/yp/js/areas.js"></script>
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
			deptId:{
				required:true,
			},
			roleId:{
				required:true,
			},
			empName:{
				required:true,
			},
			idCard:{
				required:true,
				isIdCardNo:true,
			},
			email:{
				required:true,
				email:true,
			},
			pphone:{
				required:true,
				isMobile:true,
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
				url: "insPsnFile.action",
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
					layer.alert(errorThrown + '服务器端出错', {
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
	//获取部门的编号，根据部门编号查询职位信息
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
		 	 $("#empName").html(html);
		     $("#idCard").val("");
		     $("#email").val("");
			 $("#pphone").val("");
	   	 }
	     $("#roleId").html(html);
	     
		 //查询该职位下有工资的员工姓名
		 var roleId = $("#roleId").val();
		 $.ajax({
			   type: "post",
			   url: "ajaxPsnFile.action",
			   data: "roleId=" + roleId,
			   success: function(msg){
			   	 //存到文本域方便职位的级联操作
			  	 $("#list").val(msg);
			   	 var list = eval("("+msg+")");
			   	 var html = "";
			   	 if(list.length == 0){
			   	 	 layer.alert('该职位下没有可以添加档案的员工！', {
				     closeBtn: 1,    // 是否显示关闭按钮
				     anim: 1, //动画类型
				     btn: ['确定'], //按钮
				     icon: 5,    // icon
				     });
			   	 	html += "<option value=''>--请选择--</option>";
			   	 	$("#idCard").val("");
			   	 	$("#email").val("");
			 		$("#pphone").val("");
			   	 }else{
				     for(var i = 0;i < list.length;i++){
				     	html += "<option value='" + list[i].employeeNum+"'>" + list[i].userName+"</option>";
				     }
				 }
			     $("#empName").html(html);
			
			 	var empName = $("#empName").val();
				var url="selectEmployeeByRname.action";
				var data={employeeNum:empName };
				$.post(url, data, function(response, status, request) {
					$("#idCard").val(response.idCard);
					 $("#email").val(response.email);
					 $("#pphone").val(response.telphone);
				}, " json");
			 }
		});
	   }
	});
}

//选择职位获取职工
$(function(){
	$("#roleId").change(function(){
		//查询该职位下有工资的员工姓名
		var roleId = $("#roleId").val();
		$.ajax({
			   type: "post",
			   url: "ajaxPsnFile.action",
			   data: "roleId=" + roleId,
			   success: function(msg){
			   	 //存到文本域方便职位的级联操作
			  	 $("#list").val(msg);
			   	 var list = eval("("+msg+")");
			   	 var html = "";
			   	 if(list.length == 0){
			   	 		layer.alert('该职位下没有可以添加档案的员工！', {
					     closeBtn: 1,    // 是否显示关闭按钮
					     anim: 1, //动画类型
					     btn: ['确定'], //按钮
					     icon: 5,    // icon
					     });
			   	 		html += "<option value=''>--请选择--</option>";
			   	 		$("#idCard").val("");
			   	 		$("#email").val("");
			 			$("#pphone").val("");
			   	 }else{
				     for(var i = 0;i < list.length;i++){
				     	html += "<option value='" + list[i].employeeNum+"'>" + list[i].userName + "</option>";
				     }
				 }
			     $("#empName").html(html);
			     
			     var empName = $("#empName").val();
				 var url="selectEmployeeByRname.action";
				 var data={employeeNum:empName };
				 $.post(url, data, function(response, status, request) {
					 $("#idCard").val(response.idCard);
					 $("#email").val(response.email);
					 $("#pphone").val(response.telphone);
				 }, " json");
		      }
		 });
	});

	//选择员工获取身份证号
	$("#empName").change(function(){
		 var empName = $("#empName").val();
		 var url="selectEmployeeByRname.action";
		 var data={employeeNum:empName };
		 $.post(url, data, function(response, status, request) {
			 $("#idCard").val(response.idCard);
			 $("#email").val(response.email);
			 $("#pphone").val(response.telphone);
		 }, " json");
	});


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