<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>薪酬标准管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>薪酬管理 <span class="c-gray en">&gt;</span>薪酬标准管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<c:forEach items="${roleMenuId }" var="roleMenuId">  
				<c:if test="${roleMenuId.operation.menuname eq 5 }">
					<a href="javascript:;" onclick="delAll(getDTSelect(), 'delAlls.action',reloadTable)" class="btn btn-danger radius">
						<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
					</a>
				</c:if>
				<c:if test="${roleMenuId.operation.menuname eq 3 }">
					<a href="javascript:;" onclick="add('添加薪酬','insertSalary.action','893','850')" class="btn btn-primary radius">
						<i class="Hui-iconfont">&#xe600;</i> 添加薪酬
					</a>
				</c:if>
			</c:forEach>
		</span> 
		<div class="r">
			职位名称:<input type="text" class="input-text" style="width:200px" placeholder="职位名称 " id="search" />&nbsp;&nbsp;
			审核状态:
			<select id="checkstate" style="width:80px; height:30px;">
				<option value="">--请选择--</option>
				<option value="1" <c:if test="${checkstate == 1 }">selected</c:if>>起草</option>
				<option value="2" <c:if test="${checkstate == 2 }">selected</c:if>>审核中</option>
				<option value="3" <c:if test="${checkstate == 3 }">selected</c:if>>未通过</option>
				<option value="4" <c:if test="${checkstate == 4 }">selected</c:if>>审核通过</option>
			</select>&nbsp;&nbsp;
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜素</button>
	</div>
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
					<th class="list_b">操作</th>
				</tr>
			</thead>
			</tbody>
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
			url: "showPageSalary.action?save=standard",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
				d.checkstate = $('#checkstate').val();
			}
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
			render: function(data, type, row, meta) {
				return '<span class="label label-' + checkstate[data] + ' radius">' + checkstateName[data] + '</span>';
			}
		}, {
			data: "addtime",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return data ? new Date(data).pattern("yyyy-MM-dd") : '';
			}
		}, {
			data: "checkstate",
			defaultContent: "",
			orderable:false,
			responsivePriority: 1,
			render: function(data, type, row, meta) {
				var a = "";
				if(data == 1 || data == 4 || data == 5){
					<c:forEach items="${roleMenuId }" var="roleMenuId">
						<c:if test="${roleMenuId.operation.menuname eq 2 }">
							a += '<a title="提交" style="text-decoration:none;" onclick="changeStatus(\'提交\',[' + "'" + row.employee.userName + "'" + '],\'updSalState.action\',' + row.id + ',\'2\')" href="javascript:;"><i class="Hui-iconfont">&#xe615;</i></a>';
						</c:if>
						<c:if test="${roleMenuId.operation.menuname eq 4 }">
							a += '<a title="编辑" href="javascript:;" onclick="edit_show(\'薪资编辑\',\'selSalaryById.action\',' + row.id + ',\'893\',\'870\')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>';
						</c:if>
						<c:if test="${roleMenuId.operation.menuname eq 5 }">
							a += '<a title="删除" href="javascript:;" onclick="del([' + row.id + '],\'delAlls.action\',[' + "'" + row.employee.userName + "'" + '],reloadTable)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
						</c:if>
					</c:forEach>
				}
				if(a == ""){
					a = "<a class='view'>暂无权限</a>";
				}
				return a;
			}
		}]
	});
	
	$('#checkstate').on('change',function(){
		datatable.ajax.reload();
	});
});

function reloadTable() {
	datatable.ajax.reload(null, false);
}

/**
 * 获取datatables选中行的ID
 */
function getDTSelect() {
	var lines = datatable.rows('.selected').data();
	for (var i = 0; i < lines.length; i++) {
		idList.push(lines[i].id);
	}
	return idList;
}
</script>
</body>
</html>