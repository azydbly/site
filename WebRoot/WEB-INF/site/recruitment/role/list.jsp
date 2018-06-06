<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>职位管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>招聘管理 <span class="c-gray en">&gt;</span>职位管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<c:forEach items="${roleMenuId }" var="roleMenuId">  
				<c:if test="${roleMenuId.operation.menuname eq 3 }">
					<a href="javascript:;" onclick="add('添加职位','forwardPosition.action','893','800')" class="btn btn-primary radius">
						<i class="Hui-iconfont">&#xe600;</i> 添加职位
					</a>
				</c:if>
			</c:forEach>
		</span> 
		<div class="r">
			职位名称:<input type="text" class="input-text" style="width:200px" placeholder="职位名称" id="search" />&nbsp;&nbsp;
			职位分类:
			<select id="positionType" style="width:80px; height:30px;">
				<option value="">--请选择--</option>
				<option value="管理">管理</option>
				<option value="技术">技术</option>
				<option value="实施">实施</option>
			</select>&nbsp;&nbsp;
			日期范围:
			<%--<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" value="${registDate }" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" value="${stopDate }" class="input-text Wdate" style="width:120px;">&nbsp;&nbsp;--%>
			<input type="text" autocomplete="off" id="datetimepicker" value="${registDate }" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" autocomplete="off" id="datetimepickerMax" value="${stopDate }" class="input-text Wdate" style="width:120px;">&nbsp;&nbsp;
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%">
			<thead>
				<tr class="text-c">
					<th class="list_a">序号</th>
					<th>职位名称</th>
					<th class="list_c">所属部门</th>
					<th class="list_c">职位分类</th>
					<th class="list_f">招聘人数</th>
					<th class="list_c">登记日期</th>
					<th class="list_c">截止日期</th>
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
			url: "showPagePosition.action",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
				d.positionType = $('#positionType').val();
				d.datemin = $('#datetimepicker').val();
				d.datemax = $('#datetimepickerMax').val();
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
			data: "positionName",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return '<a class="view" onclick="edit_show(\'查看信息\',\'selectPositionById.action\',' + row.id + ',\'360\',\'500\')">' + data + '</a>';
			}
		}, {
			data: "department.fullName",
			defaultContent: ""
		}, {
			data: "positionType",
			defaultContent: ""
		}, {
			data: "recruitNum",
			defaultContent: ""
		}, {
			data: "registDate",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return data ? new Date(data).pattern("yyyy-MM-dd") : '';
			}
		}, {
			data: "stopDate",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return data ? new Date(data).pattern("yyyy-MM-dd") : '';			
			}
		}, {
			data: null,
			orderable:false,
			render: function(data, type, row, meta) {
				var a = "";
				<c:forEach items="${roleMenuId }" var="roleMenuId">
					<c:if test="${roleMenuId.operation.menuname eq 4 }">
						a += '<a title="编辑" href="javascript:;" onclick="edit_show([' + "'" + row.positionName + "'" + '] + \'的职位编辑\',\'updatedPosition.action\',' + row.id + ',\'893\',\'800\')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>';
					</c:if>
					<c:if test="${roleMenuId.operation.menuname eq 5 }">
						a += '<a title="删除" href="javascript:;" onclick="del([' + row.id + '],\'deletePosition.action\',[' + "'" + row.positionName + "'" + '],reloadTable)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
					</c:if>
				</c:forEach>
				if(a == ""){
					a = "<a class='view'>暂无权限</a>";
				}
				return a;
			}
		}]
	});
	
	$('#positionType').on('change',function(){
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