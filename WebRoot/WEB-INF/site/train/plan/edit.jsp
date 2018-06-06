<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>计划管理</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-member-add" enctype="multipart/form-data">
		<input type="hidden" name="topenions" id="checkState" />
		<input type=hidden name="id" id="trainId" value="${train.id }" />
		<input type=hidden name="tfeedback" value="${train.tfeedback }" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="name" name="tname" value="${train.tname }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训讲师：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="teacher" value="${train.teacher }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="datetimepicker" name="begintime" value="<fmt:formatDate value='${train.begintime }' pattern='yyyy-MM-dd' />">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>至：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="datetimepickerMax" name="endtime" value="<fmt:formatDate value='${train.endtime }' pattern='yyyy-MM-dd' />">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训目的：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="taim">${train.taim }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>参训人员：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="tpersion">${train.tpersion }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训简介：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea type="text" class="input-text textarea" name="tabstracts">${train.tabstracts }</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>培训资料：</label>
			<div class="formControls col-xs-8 col-sm-9" id="attachmentDown">
				<c:if test="${train.tfiles != null && train.tfiles != '' }">
					${train.tfiles }&nbsp;&nbsp;
					<a title="下载资料" href="downTrain.action?url=${train.url}&tfiles=${train.tfiles }" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe641;</i>下载附件</a>&nbsp;&nbsp;
					<a title="删除资料" href="javascript:;" onclick="removeAttachment();" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>删除附件</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${train.tfiles == null || train.tfiles == '' }">
					未上传
				</c:if>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否重新上传资料：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input type="radio" id="again-1" name="radio" value="是">
					<label for="again-1">是</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="again-2" name="radio" value="否" checked>
					<label for="again-2">否</label>
				</div>
			</div>
		</div>
		<div class="row cl" id="tr">
			<label class="form-label col-xs-4 col-sm-3">培训资料：</label>
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
				<div class="Huialert Huialert-danger"><i class="icon-remove"></i>温馨提示：重新上传按钮为“是”，如果不选择上传附件，原资料提交之后删除！</div>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" id="saveButton" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<c:if test="${train.topenions == 1 || train.topenions == 5 }">
					<input class="btn btn-primary radius" id="submitButton" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" />
				</c:if>
				<button onClick="layerClose();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){

    $("#datetimepicker").datetimepicker({
        format: 'yyyy-mm-dd',
        minView: "month",
        todayHighlight:"true",
        keyboardNavigation: true,
        todayBtn:  1,
        autoclose: 1,
    }).on('changeDate',function(e) {
        var startTime = e.date;
        $('#datetimepickerMax').datetimepicker('setStartDate',startTime);
    });

    $("#datetimepickerMax").datetimepicker({
        format: 'yyyy-mm-dd',
        minView: "month",
        todayHighlight:"true",
        keyboardNavigation: true,
        todayBtn:  1,
        autoclose: 1,
    }).on('changeDate',function(e) {
        var endTime = e.date;
        $('#datetimepicker').datetimepicker('setEndDate',endTime);
    });

	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	var id = document.getElementById("trainId").value;
	$("#form-member-add").validate({
		rules:{
			tname:{
                required:true,
                remote:{
                    url:"trainCkname.action?id=" + id,
                    type:"post",
                    data: {
                    	tname: function(){
                    		return $("#name").val();
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
			teacher:{
				required:true,
			},
			begintime:{
				required:true,
			},
			endtime:{
				required:true,
			},
			taim:{
				required:true,
			},
			tpersion:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			 $(form).ajaxSubmit({
				type: 'post',
				url: "trainUpdaten.action",
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

//移出简历插件
function removeAttachment() {
	layer.confirm('确定要删除附件吗！', {
     	closeBtn: 1,    // 是否显示关闭按钮
     	anim: 1, //动画类型
    	btn: ['确定','取消'], //按钮
    	icon: 5,    // icon
    },function(){
		var id = "${train.id }";
		var tfiles = "${train.tfiles }";
		var tname = "${train.tname}";
		var url = "removeTrainFuJian.action";
		var data = {
			id : id,
			tfiles : tfiles,
			tname : tname
		};
		$.post(url, data, function(response, status, request) {
			if(response = 1){
				$("#attachmentDown").html("未上传");
			}
		});
		layer.msg('已删除', {icon: 1});
	});
}
</script>
</body>
</html>
