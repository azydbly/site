<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>薪资标准发放</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>薪酬管理 <span class="c-gray en">&gt;</span>薪酬标准管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<c:forEach items="${roleMenuId }" var="roleMenuId">  
				<c:if test="${roleMenuId.operation.menuname eq 7 }">
					<a href="javascript:;" onclick="dao(getDTSelect(),'exportSalary.action',reloadTable)" class="btn btn-primary radius">
						<i class="Hui-iconfont">&#xe644;</i>导出
					</a>
				</c:if>
				<c:if test="${roleMenuId.operation.menuname eq 6 }">
					<a href="javascript:;" class="btn btn-primary radius">
						<i class="Hui-iconfont">&#xe645;</i>导入
					</a>
				</c:if>
			</c:forEach>
		</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%">
			<thead>
				<tr class="text-c">
					<th class="list_a">序号</th>
					<th class="list_a">
						<input id="input-0" type="checkbox" name="all"><label for="input-0"></label>
					</th>
					<th>姓名</th>
					<th class="list_d">部门</th>
					<th class="list_d">职位</th>
					<th class="list_b">审核状态</th>
					<th class="list_b">时间</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
var datatable = null,idList=[];
$(function() {
	datatable = $('.table-sort').DataTable({
		"aoColumnDefs": [
		  {"bVisible": false, "aTargets": [0]} //控制列的隐藏显示
		],
		ajax: {
			url: "showPageSalary.action?save=file",
			type: 'post',
		},
		columns: [{
			data: null,
			orderable:false,
			render: function(data, type, row, meta) {
				var startIndex = meta.settings._iDisplayStart;  
                return startIndex + meta.row + 1;
			}  
		}, {
			data: "id",
			orderable:false,
			render: function(data, type, row, meta) {
				return '<input id="input-' + data + '" type="checkbox" name="single"><label for="input-' + data + '"></label>';
			}
		}, {
			data: "employee.userName",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return '<a class="view" onclick="edit_show([' + "'" + row.employee.userName + "'" + '] + \'的薪资信息\',\'selectById.action\',' + row.id + ',\'360\',\'500\')">' + data + '</a>';
			}
		}, {
			data: "department.fullName",
			defaultContent: "",
		}, {
			data: "role.name",
			defaultContent: "",
		}, {
			data: "checkstate",
			defaultContent: "",
			rderable:false,
			render: function(data, type, row, meta) {
				return '<span class="label label-success radius">审核通过</span>';				
			}
		}, {
			data: "addtime",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return data ? new Date(data).pattern("yyyy-MM-dd") : '';
			}
		}]
	});
});

function reloadTable() {
	datatable.ajax.reload(null, false);
}

function getDTSelect() {
	var lines = datatable.rows('.selected').data();
	for (var i = 0; i < lines.length; i++) {
		idList.push(lines[i].id);
	}
	return idList;
}

//导出Excel
$(function(){
	$("#outexcel").click(function(){
		var subs = $(".sub");	
		var ids = new Array;
		//for循环集合
	    var j = 0;
	    	for(var i = 0;i < subs.length;i++){
			//如果复选框选中，将循环出来的元素放入数组中
			if(subs[i].checked){
				ids[j] = subs[i].value;
				j++;
			}
		}
		if(ids.length !== 0){
			location.href = "exportSalary.action?ids="+ids;
		}else{
			layer.alert('请选择要导出的数据！', {
		     closeBtn: 1,    // 是否显示关闭按钮
		     anim: 1, //动画类型
		     btn: ['确定'], //按钮
		     icon: 5,    // icon
		     });
		}
	});
});	
</script> 
</body>
</html>