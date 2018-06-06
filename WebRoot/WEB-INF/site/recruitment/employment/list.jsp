<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>录用管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>招聘管理 <span class="c-gray en">&gt;</span>录用管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<div class="r">
			姓名:<input type="text" class="input-text" style="width:200px" placeholder="姓名" id="search" />&nbsp;&nbsp;
			应聘职位:<input type="text" class="input-text" style="width:200px" placeholder="应聘职位" id="positionName" />&nbsp;&nbsp;
			工作经验:<input type="text" class="input-text" style="width:200px" placeholder="工作时间" id="workExperience" />&nbsp;&nbsp;
			简历状态:
			<select id="resumeStatus" style="width:80px; height:30px;">
				<option value="">--请选择--</option>
				<option value="4" <c:if test="${resumeStatus == 4 }">selected</c:if>>建议录用</option>
				<option value="5" <c:if test="${resumeStatus == 5 }">selected</c:if>>录用</option>
			</select>&nbsp;&nbsp;
			登记日期:<input type="text" id="datetimepicker" class="input-text Wdate" style="width:120">&nbsp;&nbsp;
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i>搜索</button>
		</div>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th class="list_a">序号</th>
					<th>姓名</th>
					<th class="list_f">性别</th>
					<th class="list_c">毕业院校</th>
					<th class="list_f">专业</th>
					<th class="list_c">学历</th>
					<th class="list_b">应聘职位</th>
					<th class="list_f">工作经验</th>
					<th class="list_b">登记日期</th>
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
			url: "showPageHire.action",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
				d.resumeStatus = $('#resumeStatus').val();
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
			data: "username",
			defaultContent: "",
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
			data: "educationBackground",
			defaultContent: "",
		}, {
			data: "major",
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
			defaultContent: "",
			orderable:false,
			render: function(data, type, row, meta) {
				var a = "";
				if(data == 4){
					<c:forEach items="${roleMenuId }" var="roleMenuId">
						<c:if test="${roleMenuId.operation.menuname eq 4 }">
							a += '<a title="录用结果登记" href="javascript:;" onclick="edit_show_full([' + "'" + row.username + "'" + '] + \'的录用结果登记\',\'forwardHire.action\',' + row.id + ')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>';
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
	
	$('#resumeStatus').on('change',function(){
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