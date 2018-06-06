<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>用户管理 <span class="c-gray en">&gt;</span>员工管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<c:forEach items="${roleMenuId }" var="roleMenuId">  
				<c:if test="${roleMenuId.operation.menuname eq 5 }">
					<a href="javascript:;" onclick="delAll(getDTSelect(),'delEmps.action',reloadTable)" class="btn btn-danger radius">
						<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
					</a>
				</c:if>
				<c:if test="${roleMenuId.operation.menuname eq 3 }">
					<a href="javascript:;" onclick="add('添加员工','toIns.action','893','580')" class="btn btn-primary radius">
						<i class="Hui-iconfont">&#xe600;</i> 添加员工
					</a>
				</c:if>
			</c:forEach>
		</span> 
		<div class="r">
			所属部门:<input type="text" class="input-text" style="width:200px" placeholder="部门名称" id="dname" />&nbsp;&nbsp;
			角色:<input type="text" class="input-text" style="width:200px" placeholder="角色名称" id="rname" />&nbsp;&nbsp;
			姓名:<input type="text" class="input-text" style="width:200px" placeholder="员工姓名" id="search" />&nbsp;&nbsp;
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
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
					<th class="list_c">姓名</th>
					<th class="list_c">账号</th>
					<th class="list_c">所属部门</th>
					<th>角色</th>
					<th class="list_b">密码重置</th>
					<th class="list_b">状态</th>
					<th class="list_b">操作</th>
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
			url: "showPageEmployee.action",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
				d.dname = $('#dname').val();
				d.rname = $('#rname').val();
			}
		},
		columns: [{
			data: null,
			orderable:false,
			render: function(data, type, row, meta) {
				var startIndex = meta.settings._iDisplayStart;  
                return startIndex + meta.row + 1;
			},
		}, {
			data: "id",
			defaultContent: "",
			orderable:false,
			render: function(data, type, row, meta) {
				return '<input id="input-' + data + '" type="checkbox" name="single"><label for="input-' + data + '"></label>';
			}
		}, {
			data: "userName",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return '<a class="view" onclick="edit_show(\'查看信息\',\'viewEmployee.action\',' + row.employeeNum + ',\'360\',\'500\')">' + data + '</a>';
			}
		}, {
			data: "loginName",
			defaultContent: "",
		}, {
			data: "department.fullName",
			defaultContent: ""
		}, {
			data: "role.name",
			defaultContent: "",
		}, {
			data: null,
			orderable:false,
			render: function(data, type, row, meta) {
				return '<a class="view" onclick="edit_show(\'密码重置\',\'resetPassword.action\',' + row.employeeNum + ',\'893\',\'200\')">重置</a>';
			},
		}, {
			data: "state",
			render: function(data, type, row, meta) {
				return '<span class="label label-' + clazz[data] + ' radius">' + text[data] + '</span>';
			}
		}, {
			data: "state",
			render: function(data, type, row, meta) {
				var a = "";
				<c:forEach items="${roleMenuId }" var="roleMenuId">
					<c:if test="${roleMenuId.operation.menuname eq 2 }">
						a += '<a title="' + state[data] + '" style="text-decoration:none" onClick="changeStatus(' + "'" +  state[data] + "'" + ',[' + "'" + row.userName + "'" + '],\'updateEmployeeState.action\',' + row.employeeNum + ','+ flag[data] + ')" href="javascript:;"><i class="Hui-iconfont">' + icon[data] + '</i></a>';
					</c:if>
					<c:if test="${roleMenuId.operation.menuname eq 4 }">
						a += '<a title="编辑" href="javascript:;" onclick="edit_show([' + "'" + row.userName + "'" + '],\'toUpdEmpPage.action\',' + row.employeeNum + ',\'893\',\'560\')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>';
					</c:if>
					<c:if test="${roleMenuId.operation.menuname eq 5 }">
						a += '<a title="删除" href="javascript:;" onclick="del([' + row.id + '],\'delEmps.action\',[' + "'" + row.userName + "'" + '],reloadTable)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
					</c:if>
				</c:forEach>
				if(a == ""){
					a = "<a class='view'>暂无权限</a>";
				}
				return a;
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
</script>
</body>
</html>