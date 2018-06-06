<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>消息列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 消息中心 <span class="c-gray en">&gt;</span> 消息列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form class="form form-horizontal mt-20" id="form-article-add">
		<div id="tab-system" class="HuiTab">
			<ul class="tabBar cl">
				<span>通知 &nbsp;<label class="badge badge-danger">1</label></span>
				<span>公告 &nbsp;<label class="badge badge-danger">2</label></span>
				<span>私信 &nbsp;<label class="badge badge-danger">3</label></span>
			</ul>

			<div class="tabCon">
				<div class="mt-20">
					<table class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">
								<th width="25"><input type="checkbox" name="" value=""></th>
								<th width="60">ID</th>
								<th width="120">发送人</th>
								<th>标题</th>
								<th width="100">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-c">
								<td><input type="checkbox" value="1" name=""></td>
								<td>1</td>
								<td>公司</td>
								<td class="text-l">明天开会 &nbsp;&nbsp;<img src="styles/images/new/new_3.png" /></td>
								<td class="td-manage">
									<a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none">
										<i class="Hui-iconfont">&#xe6e2;</i>
									</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			
			<div class="tabCon">
				<div class="mt-20">
					<table class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">
								<th width="25"><input type="checkbox" name="" value=""></th>
								<th width="60">ID</th>
								<th width="120">发送人</th>
								<th>标题</th>
								<th width="100">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-c">
								<td><input type="checkbox" value="1" name=""></td>
								<td>1</td>
								<td>公司2</td>
								<td class="text-l">明天开会 &nbsp;&nbsp;<img src="styles/images/new/new_3.png" /></td>
								<td class="td-manage">
									<a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none">
										<i class="Hui-iconfont">&#xe6e2;</i>
									</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			
			
			<div class="tabCon">
				<div class="mt-20">
					<table class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">
								<th width="25"><input type="checkbox" name="" value=""></th>
								<th width="60">ID</th>
								<th width="120">发送人</th>
								<th>标题</th>
								<th width="100">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-c">
								<td><input type="checkbox" value="1" name=""></td>
								<td>1</td>
								<td>公司3</td>
								<td class="text-l">明天开会 &nbsp;&nbsp;<img src="styles/images/new/new_2.png" /></td>
								<td class="td-manage">
									<a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none">
										<i class="Hui-iconfont">&#xe6e2;</i>
									</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "asc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,4]}// 制定列不参与排序
		]
	});
	
	$("#tab-system").Huitab({
		index:0
	});
});
</script>
</body>
</html>