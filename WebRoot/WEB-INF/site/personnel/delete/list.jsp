<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>人事管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>人事管理<span class="c-gray en">&gt;</span>档案管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<div class="r">
			姓名:<input type="text" class="input-text" style="width:200px" placeholder="姓名" id="search" />&nbsp;&nbsp;
			审核状态:
			<select id="checkState" style="width:80px; height:30px;">
				<<option value=""
					<c:if test="${checkState == '' }">selected</c:if>>--请选择--</option>
				<option value="1"
					<c:if test="${checkState == 1 }">selected</c:if>>起草</option>
				<option value="2"
					<c:if test="${checkState == 2 }">selected</c:if>>审核中</option>
				<option value="3"
					<c:if test="${checkState == 3 }">selected</c:if>>审核通过</option>
				<option value="4"
					<c:if test="${checkState == 4 }">selected</c:if>>驳回</option>
				<option value="5"
					<c:if test="${checkState == 5 }">selected</c:if>>变更</option>
				<option value="6"
					<c:if test="${checkState == 6 }">selected</c:if>>变更审核中</option>
			</select>&nbsp;&nbsp;
			档案状态:
			<select id="psnFileState" style="width:80px; height:30px;">
				<option value=""
					<c:if test="${psnFileState == '' }">selected</c:if>>--请选择--</option>
				<option value="1"
					<c:if test="${psnFileState == 1 }">selected</c:if>>实习</option>
				<option value="2"
					<c:if test="${psnFileState == 2 }">selected</c:if>>正式员工</option>
				<option value="3"
					<c:if test="${psnFileState == 3 }">selected</c:if>>离职</option>
				<option value="4"
					<c:if test="${psnFileState == 4 }">selected</c:if>>实习员工</option>
			</select>&nbsp;&nbsp;
			建档时间:
			<input type="text" id="datetimepicker" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" id="datetimepickerMax" class="input-text Wdate" style="width:120px;">&nbsp;&nbsp;
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%">
			<thead>
				<tr class="text-c">
					<th class="list_a">序号</th>
					<th>姓名</th>
					<th class="list_f">性别</th>
					<th class="list_c">所属部门</th>
					<th class="list_c">职位</th>
					<th class="list_b">建档日期</th>
					<th class="list_b">审核状态</th>
					<th class="list_b">档案状态</th>
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

    $("#datetimepicker").datetimepicker({
        format: 'yyyy-mm-dd',
        minView: "month",
        todayHighlight:"true",
        keyboardNavigation: true,
        todayBtn:  1,
        autoclose: 1,
        endDate : new Date()
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
        endDate : new Date()
    }).on('changeDate',function(e) {
        var endTime = e.date;
        $('#datetimepicker').datetimepicker('setEndDate',endTime);
    });

	datatable = $('.table-sort').DataTable({
		"aoColumnDefs": [
		  {"bVisible": false, "aTargets": [0]} //控制列的隐藏显示
		],
		ajax: {
			url: "showPsnPage.action",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
				d.checkState = $('#checkState').val();
				d.psnFileState = $('#psnFileState').val();
				d.datemin = $('#datetimepicker').val();
				d.toDate = $('#datetimepickerMax').val();
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
			data: "employee.userName",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return '<a class="view" onclick="edit_show_full([' + "'" + row.employee.userName + "'" + '] + \'的档案信息\',\'seeInfo.action\',' + row.id + ')">' + data + '</a>';
			}
		}, {
			data: "sex",
			render: function(data, type, row, meta) {
				return "" + sex[data] +  "";
			}
		}, {
			data: "department.fullName",
			defaultContent: "",
		}, {
			data: "role.name",
			defaultContent: "",
		}, {
			data: "createDate",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return data ? new Date(data).pattern("yyyy-MM-dd") : '';
			}
		}, {
			data: "checkState",
			render: function(data, type, row, meta) {
				return '<span class="label label-' + checkstate[data] + ' radius">' + checkstateName[data] + '</span>';
			}
		}, {
			data: "state",
			render: function(data, type, row, meta) {
				return '<span class="label label-' + psnfile[data] + ' radius">' + psnfilename[data] + '</span>';
			}
		}, {
			data: "checkState",
			orderable:false,
			render: function(data, type, row, meta) {
				var a = "";
				if(data == 3){
					<c:forEach items="${roleMenuId }" var="roleMenuId">
						<c:if test="${roleMenuId.operation.menuname eq 5 }">
							a += '<a title="删除" href="javascript:;" onclick="del([' + row.id + '],\'deleteOne.action\',[' + "'" + row.employee.userName + "'" + '],reloadTable)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
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

	$('#checkState').on('change',function(){
		datatable.ajax.reload();
	});
	
	$('#psnFileState').on('change',function(){
		datatable.ajax.reload();
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