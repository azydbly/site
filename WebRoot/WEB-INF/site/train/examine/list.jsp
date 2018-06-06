<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>培训管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>培训管理 <span class="c-gray en">&gt;</span>培训计划审核 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<div class="r">
			培训名称:<input type="text" class="input-text" style="width:200px" placeholder="培训名称" id="search" />&nbsp;&nbsp;
			培训时间:
			<%--<input type="text" onfocus="WdatePicker()" id="timeMin" class="input-text Wdate" style="width:120px;" />
			-
			<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'timeMin\')}' })" id="timeMax" class="input-text Wdate" style="width:120px;" />&nbsp;&nbsp;--%>
            <input type="text" id="datetimepicker" class="input-text Wdate" style="width:120px;" />
			-
			<input type="text" id="datetimepickerMax" class="input-text Wdate" style="width:120px;" />&nbsp;&nbsp;
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%">
			<thead>
				<tr class="text-c">
					<th class="list_a">序号</th>
					<th>培训名称</th>
					<th class="list_b">培训讲师</th>
					<th class="list_b">培训时间</th>
					<th class="list_b">审核状态</th>
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

	datatable = $('.table-sort').DataTable({
		"aoColumnDefs": [
		  {"bVisible": false, "aTargets": [0]} //控制列的隐藏显示
		],
		ajax: {
			url: "showPageTrainPlan.action?save=2",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
				d.timeMin = $('#datetimepicker').val();
				d.timeMax = $('#datetimepickerMax').val();
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
			data: "tname",
			render: function(data, type, row, meta) {
				return '<a class="view" onclick="edit_show([' + "'" + row.tname + "'" + '] + \'计划查看\',\'trainDetial.action\',' + row.id + ',\'500\',\'550\')">' + data + '</a>';
			}
		}, {
			data: "teacher",
			defaultContent: "",
		}, {
			data: "begintime",
			render: function(data, type, row, meta) {
				return data ? new Date(data).pattern("yyyy-MM-dd") : '';
			}
		}, {
			data: "topenions",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return '<span class="label label-' + checkstate[data] + ' radius">' + checkstateName[data] + '</span>';
			}
		}, {
			data: "topenions",
			orderable:false,
			render: function(data, type, row, meta) {
				var a = "";
				<c:forEach items="${roleMenuId }" var="roleMenuId">
					<c:if test="${roleMenuId.operation.menuname eq 4 }">
						a += '<a title="编辑" href="javascript:;" onclick="edit_show([' + "'" + row.tname + "'" + '] + \'计划审核\',\'trainShenPi.action\',' + row.id + ',\'893\',\'550\')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>';
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