<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>职位查看</title>
</head>
<body>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r">职位名称：</th>
				<td>${role.name }</td>
			</tr>
			<tr>
				<th class="text-r">职位分类：</th>
				<td>
					<c:if test="${role.type == 1 }">管理</c:if>
					<c:if test="${role.type == 2 }">技术</c:if>
					<c:if test="${role.type == 3 }">实施</c:if>
				</td>
			</tr>
			<tr>
				<th class="text-r">所属部门：</th>
				<td>${dname }</td>
			</tr>
			<tr>
				<th class="text-r">职位描述：</th>
				<td>${role.description }</td>
			</tr>
			<tr>
				<th class="text-r">备 注：</th>
				<td>${role.remark }</td>
			</tr>
			<tr>
				<th class="text-r">是否启用：</th>
				<td>
					<c:if test="${role.state == 1 }">已启用</c:if>
					<c:if test="${role.state == 2 }">已停用</c:if>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>