<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>文档管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>文档管理 <span class="c-gray en">&gt;</span>文档列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<div class="r">
			<input type="text" class="input-text" style="width:250px" placeholder="文件名称" id="search" />
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%">
			<thead>
				<tr class="text-c">
					<th width="50">序号</th>
					<th width="30">
						<input type="checkbox" id="all">
					</th>
					<th>文件名称</th>
					<th>文件大小</th>
					<th>文件类型</th>
					<th width="120">上传时间</th>
					<th width="120">上传者</th>
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
			url: "showPageFile.action",
			type: 'post',
			data: function(d) {
				d.search = $('#search').val();
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
			defaultContent: "",
			orderable:false,
			render: function(data, type, row, meta) {
				return '<input id="input-' + data + '" type="checkbox" name="single"><label for="input-' + data + '"></label>';
			} 
		}, {
			data: "fileName",
			defaultContent: "",
		}, {
			data: "size",
			defaultContent: "",
		}, {
			data: "fileType",
			defaultContent: "",
		}, {
			data: "createDate",
			render: function(data, type, row, meta) {
				return data ? new Date(data).pattern("yyyy-MM-dd") : '';
			}
		}, {
			data: "ordernum",
			defaultContent: "",
		}],
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