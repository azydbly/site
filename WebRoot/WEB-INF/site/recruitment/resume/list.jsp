<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>简历管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>招聘管理 <span class="c-gray en">&gt;</span>简历管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<a href="javascript:;" onclick="delAll(getDTSelect(), 'deleteSomeResumeManage.action', reloadTable)" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a>
			<a href="javascript:;" onclick="add_full('添加简历','insertForward.action')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加简历
			</a>
		</span> 
		<div class="r">
			姓名:<input type="text" class="input-text" style="width:200px" placeholder="员工姓名" id="search" />&nbsp;&nbsp;
			应聘职位:<input type="text" class="input-text" style="width:200px" placeholder="应聘职位" id="positionName" />&nbsp;&nbsp;
			工作经验:<input type="text" class="input-text" style="width:200px" placeholder="工作时间" id="workExperience" />&nbsp;&nbsp;
			<%--登记日期:<input type="text" onfocus="WdatePicker({ maxDate:'#F{\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px">&nbsp;&nbsp;--%>
			登记日期:<input type="text" id="datetimepicker" autocomplete="off" class="input-text Wdate" style="width:120px">&nbsp;&nbsp;
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
					</td>
					<th>姓名</th>
					<th class="list_f">性别</th>
					<th class="list_c">毕业院校</th>
					<th class="list_c">专业</th>
					<th class="list_f">学历</th>
					<th class="list_b">应聘职位</th>
					<th class="list_f">工作经验</th>
					<th class="list_b">登记日期</th>
					<th class="list_f">状态</th>
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
    }).on('hide',function(e) {
        //此处可以触发日期校验。
    });

	datatable = $('.table-sort').DataTable({
		"aoColumnDefs": [
		  {"bVisible": false, "aTargets": [0]} //控制列的隐藏显示
		],
		ajax: {
			url: "showPageResume.action",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
				d.positionName = $('#positionName').val();
				d.workExperience = $('#workExperience').val();
				d.datemin = $('#datetimepicker').val();
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
			data: "username",
			defaultContent: "",
			orderable:false,
			render: function(data, type, row, meta) {
				return '<a class="view" onclick="edit_show_full([' + "'" + row.username + "'" + '] + \'的简历信息\',\'selectResumeManageById.action\',' + row.id + ',\'360\',\'400\')">' + data + '</a>';
			}
		}, {
			data: "sex",
			defaultContent: "",
		}, {
			data: "graduateCollege",
			defaultContent: "",
		}, {
			data: "major",
			defaultContent: "",
		}, {
			data: "educationBackground",
			defaultContent: "",
		}, {
			data: "positionName",
			defaultContent: "",
		}, {
			data: "workExperience",
			defaultContent: "",
		}, {
			data: "registDate",
			defaultContent: "",
			render: function(data, type, row, meta) {
				return data ? new Date(data).pattern("yyyy-MM-dd") : '';
			}
		}, {
			data: "resumeStatus",
			render: function(data, type, row, meta) {
				return '<span class="label label-' + resume[data] + ' radius">' + resumename[data] + '</span>';
			}
		}, {
			data: "resumeStatus",
			orderable:false,
			render: function(data, type, row, meta) {
				return '<a title="' + resumestate[data] + '" style="text-decoration:none" onClick="changeStatus(' + "'" +  resumestate[data] + "'" + ',[' + "'" + row.username + "'" + '],\'changeResumeStatus.action\',' + row.id + ', \'1\')" href="javascript:;"><i class="Hui-iconfont">' + resumeicon[data] + '</i></a>\
						<a title="编辑" href="javascript:;" onclick="edit_show_full([' + "'" + row.username + "'" + '] + \'的简历编辑\',\'updateForward.action\',' + row.id + ',\'893\',\'800\')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>\
						<a title="删除" href="javascript:;" onclick="del([' + row.id + '],\'deleteSomeResumeManage.action\',[' + "'" + row.username + "'" + '],reloadTable)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
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