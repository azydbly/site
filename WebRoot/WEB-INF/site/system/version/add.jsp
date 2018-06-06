<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>版本日志添加</title>
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<input type="hidden" name="createBy" value="${employee.roleId }" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>版本摘要：</label>
			<div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select name="versionAbstract" class="select">
                        <option value="">--请选择--</option>
                        <option value="新增">新增</option>
                        <option value="修改">修改</option>
                        <option value="优化">优化</option>
                    </select>
                </span>
			</div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>版本摘要：</label>
			<div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select name="versionType" class="select">
                        <option value="">--请选择--</option>
                        <option value="1">历史版本</option>
                        <option value="2">未来规划</option>
                    </select>
                </span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>日志标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="title">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">版本号升级：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="check-box">
					<input type="checkbox" id="checkbox-1">
					<label for="checkbox-1">&nbsp;</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>版本号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="versionNumber1" name="versionNumber1" />
				<span class="select-box" id="versionNumber2">
					<select name="versionNumber" class="select">
						<c:forEach items="${versionNumber}" var="versionNumber">
							<option value="${versionNumber.versionNumber }">${versionNumber.versionNumber }</option>
						</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"></label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="Huialert Huialert-info"><i class="Hui-iconfont">&#xe6a6;</i>温馨提示：版本日志内容点击左上角的HTML按钮，使用 “&lt;div&gt;&lt;/div&gt;” 标签进行上传，多个&lt;div&gt;之间不要使用回车，否则提交出现问题！</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">详细内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea class="textarea" name="content" style="width:100%;height:200px;">&lt;div&gt;1.&lt;/div&gt;&lt;div&gt;2.&lt;/div&gt;</textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button  class="btn btn-secondary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){

    $(".textarea").Huitextarealength({
        minlength:26,
        maxlength:200.
    });

	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#versionNumber1").hide(); 
	$('#checkbox-1').on('ifChecked', function(event){ 
		$("#versionNumber1").show(); 
    	$("#versionNumber2").hide(); 
	});
	$('#checkbox-1').on('ifUnchecked', function(event){ 
		$("#versionNumber1").hide(); 
    	$("#versionNumber2").show(); 
	});
});

$("#form-article-add").validate({
    rules:{
        title:{
            required:true,
        },
        versionType:{
            required:true,
        },
        versionAbstract:{
            required:true,
        },
        content:{
            required:true,
        },
        versionNumber1:{
            required:true,
            isFloatGteZero:true,
            remote:{
                url:"selVersionNumber.action",
                type:"post",
                data: {
                    versionNumber1: function(){
                        return $("#versionNumber1").val();
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
    },
    messages:{
        versionNumber1: {
            remote: "版本号请大于最高版本号",
        },
    },
    onkeyup:false,
    focusCleanup:true,
    success:"valid",
    submitHandler:function(form){
        $(form).ajaxSubmit({
            type: "post",
            url: "insertVersionLog.action",
            data: $(form).serialize(),
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    window.parent.location.reload();
                    var message = '添加成功!';
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引,隐藏layer层和shade
                    parent.$('#layui-layer' + index).css({'display': 'none'});
                    parent.$('#layui-layer-shade' + index).css({'display': 'none'});
                    parent.showSuccessMessage(message, null, function () {
                        parent.layer.close(index); //然后执行关闭
                    });
                } else {
                    var message = '添加失败!';
                    parent.showFailMessage(message);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
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
</script>
</body>
</html>
