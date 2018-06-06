<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>版本日志管理</title>
</head>
<body>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
        </span>
		<div class="r">
            版本号：
            <select id="versionNumber" style="width:80px; height:30px;">
                <option value="">--请选择--</option>
                <c:forEach items="${versionNumber}" var="versionNumber">
                    <option value="${versionNumber.versionNumber }">${versionNumber.versionNumber }</option>
                </c:forEach>
            </select>&nbsp;&nbsp;
            摘要：
            <select id="versionAbstract" style="width:80px; height:30px;">
                <option value="">--请选择--</option>
                <option value="新增">新增</option>
                <option value="修改">修改</option>
                <option value="优化">优化</option>
            </select>&nbsp;&nbsp;
            日志标题:<input type="text" class="input-text" style="width:120px" placeholder="日志标题" id="search">&nbsp;&nbsp;
            添加日期:<input type="text" id="datetimepicker" class="input-text Wdate" style="width:120px;" placeholder="添加日期">&nbsp;&nbsp;
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%" >
			<thead>
				<tr class="text-c">
					<th class="list_a">序号</th>
					<th class="list_c">日志标题</th>
					<th class="list_b">版本摘要</th>
					<th class="list_b">版本号</th>
					<th>日志内容</th>
                    <th class="list_b">版本类型</th>
                    <th class="list_b">插入时间</th>
					<th class="list_b">创建者</th>
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
			url: "showPageVersionLog.action",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
				d.versionAbstract = $('#versionAbstract').val();
				d.createTime = $('#datetimepicker').val();
				d.versionNumber = $('#versionNumber').val();
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
			data: "title",
			defaultContent: "",
		}, {
			data: "versionAbstract",
			defaultContent: "",
		}, {
			data: "versionNumber",
			defaultContent: "",
		}, {
			data: "content",
			defaultContent: "",
        }, {
            data: "versionType",
            render: function(data, type, row, meta) {
               return '<span class="label label-' + versionLog[data] + ' radius">' + versionLogType[data] + '</span>';
            }
        }, {
            data: "createTime",
            render: function(data, type, row, meta) {
                return data ? new Date(data).pattern("yyyy-MM-dd") : '';
            }
        }, {
            data: "employee.userName",
            defaultContent: "",
		}, {
			data: "state",
			defaultContent: "",
			orderable:false,
			responsivePriority: 1,
			render: function(data, type, row, meta) {
				var a = "";
                a += '<a title="编辑" href="javascript:;" onclick="edit_show_full([' + "'" + row.title + "'" + '],\'edit.action\',' + row.id + ',\'893\',\'400\')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>';
                a += '<a title="删除 " href="javascript:;" onclick="del([' + row.id + '],\'deleteVersionLog.action\',[' + "'" + row.title + "'" + '],reloadTable)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
				return a;
			}
		}],
	});
	
	$('#versionAbstract').on('change',function(){
		datatable.ajax.reload();
	});
	$('#versionNumber').on('change',function(){
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