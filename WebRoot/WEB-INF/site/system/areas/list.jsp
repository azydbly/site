<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicList.jsp" %>
<html>
<head>
<title>系统管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>系统管理 <span class="c-gray en">&gt;</span>行政区域管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<div class="r">
            <select class="select" size="1" name="province" id="province" onchange="getCityByProvince();" style="width:150px; height:30px;">
                <option value="" selected>选择省份</option>
                <c:forEach items="${areas }" var="province">
                    <option value="${province.number}">${province.name}</option>
                </c:forEach>
            </select>&nbsp;&nbsp;
            <select class="select" size="1" name="city" id="city" onchange="getCountyByCity();" style="width:150px; height:30px;">
                <option value="" selected>选择城市</option>
            </select>&nbsp;&nbsp;
            <select class="select" size="1" name="county" id="county" onchange="getTownByCounty();" style="width:150px; height:30px;">
                <option value="" selected>选择区县</option>
            </select>&nbsp;&nbsp;
            <select class="select" size="1" name="town" id="town" onchange="getVillageByTown();" style="width:150px; height:30px;">
                <option value="" selected>选择城镇</option>
            </select>&nbsp;&nbsp;
            <select class="select" size="1" name="village" id="village" style="width:150px; height:30px;">
                <option value="" selected>选择村庄</option>
            </select>&nbsp;&nbsp;
			名称:<input type="text" class="input-text" style="width:200px" placeholder="名称" id="search">&nbsp;&nbsp;
			<button type="submit" id="doSearch" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%" >
			<thead>
				<tr class="text-c">
					<th class="list_a">序号</th>
					<th class="list_c">省</th>
					<th class="list_c">市</th>
					<th class="list_c">区</th>
					<th class="list_c">县镇</th>
					<th class="list_c">村</th>
					<th class="list_b">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctxsty}/static/yp/js/areas.js"></script>
<script type="text/javascript">
var datatable = null,idList=[];
$(function() {
	datatable = $('.table-sort').DataTable({
		"aoColumnDefs": [
		  {"bVisible": false, "aTargets": [0]} //控制列的隐藏显示
		],
		ajax: {
			url: "showPageAreas.action",
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
            data: "name",
            defaultContent: "",
        }, {
            data: "name",
            defaultContent: "",
        }, {
            data: "name",
            defaultContent: "",
        }, {
            data: "name",
            defaultContent: "",
        }, {
            data: "name",
            defaultContent: "",
		}, {
			data: "state",
			defaultContent: "",
			orderable:false,
			responsivePriority: 1,
			render: function(data, type, row, meta) {
				var a = "";
				<c:forEach items="${roleMenuId }" var="roleMenuId">
					<c:if test="${roleMenuId.operation.menuname eq 2 }">
						a += '<a title="' + state[data] + '" style="text-decoration:none" onClick="changeStatus(' + "'" +  state[data] + "'" + ',[' + "'" + row.menuname + "'" + '],\'updMenuState.action\',' + row.id + ', '+ flag[data] + ')" href="javascript:;"><i class="Hui-iconfont">' + icon[data] + '</i></a>';
					</c:if>
					<c:if test="${roleMenuId.operation.menuname eq 4 }">
						a += '<a title="编辑" href="javascript:;" onclick="edit_show([' + "'" + row.menuname + "'" + '],\'selMenuById.action\',' + row.id + ',\'893\',\'400\')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>';
					</c:if>
					<c:if test="${roleMenuId.operation.menuname eq 5 }">
						a += '<a title="删除" href="javascript:;" onclick="del([' + row.id + '],\'delMenu.action\',[' + "'" + row.menuname + "'" + '],reloadTable)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
					</c:if>
				</c:forEach>
				if(a == ""){
					a = "<a class='view'>暂无权限</a>";
				}
				return a;
			}
		}],
	});
	
	
	$('#state').on('change',function(){
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