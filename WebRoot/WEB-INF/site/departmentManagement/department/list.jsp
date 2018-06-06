<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>部门列表</title>
<link rel="stylesheet" type="text/css" href="${ctxsty}/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="${ctxsty}/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
</head>
<body class="pos-r">
<div class="pos-a" style="width:220px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5; overflow:auto;">
	<ul id="treeDemo" class="ztree"></ul>
</div>
<div style="margin-left:220px;">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 部门管理 <span class="c-gray en">&gt;</span> 部门列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l">
				<c:forEach items="${roleMenuId }" var="roleMenuId">  
					<c:if test="${roleMenuId.operation.menuname eq 3 }">
						<a href="javascript:;" id="add" class="btn btn-primary radius">
							<i class="Hui-iconfont">&#xe600;</i> 添加部门
						</a>
					</c:if>
				</c:forEach>
			</span>
		</div>
		<div class="mt-20">
			<iframe id="testIframe" name="testIframe" frameborder=0 scrolling=no width=100%  height=700px; src="selAlldept.action"></iframe>
			<iframe id="updateDepartemnt" name="main_right" src="" frameborder=0 scrolling=no width=100% height=800px;></iframe>
		</div>
	</div>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
 var setting = {
	async:{
		enable:true,
		nocheckInherit: true   
	},
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: "",
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				updateDepartemnt.attr("src", "toUpdatePage.action?id=" + treeNode.id);
				return false;
			} else {
	        	updateDepartemnt.attr("src", "toUpdatePage.action?id=" + treeNode.id);
				return true;
			}
		}
	}
};

var zNodes;
$.ajax({
   type: "post",
   url: "deployNews.action",
   dataType:"JSON",
   success: function(data){
   		zNodes =  data;
		var t = $("#treeDemo");
		t = $.fn.zTree.init(t, setting, zNodes);
		updateDepartemnt = $("#updateDepartemnt");
		var zTree = $.fn.zTree.getZTreeObj("tree");
	}
});

//显示添加部门的隐藏部分
$(function(){
	$("#testIframe").hide();
	$("#add").click(function() {
	    $("#updateDepartemnt").hide(); 
	    $("#testIframe").show(); 
	});
	
	$("#treeDemo").click(function() {
		$("#testIframe").hide();
		$("#updateDepartemnt").show(); 
	});
});
</script>
</body>
</html>