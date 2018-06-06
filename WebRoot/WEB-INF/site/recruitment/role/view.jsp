<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>招聘管理</title>
</head>
<body>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r" width="80">部门：</th>
				<td>${position.department.fullName }</td>
			</tr>
			<tr>
				<th class="text-r">招聘类型：</td>
				<td>${position.recruitType }</td>
			</tr>
			<tr>
				<th class="text-r">招聘人数：</td>
				<td>${position.recruitNum }</td>
			</tr>
			<tr>
				<th class="text-r">职位名称：</td>
				<td>${position.positionName }</td>
			</tr>
			<tr>
				<th class="text-r">职业编码：</td>
				<td>${position.positionCode }</td>
			</tr>
			<tr>
				<th class="text-r">职位分类：</td>
				<td>${position.positionType }</td>
			</tr>
			<tr>
				<th class="text-r">登记人：</td>
				<td>${position.registPerson }</td>
			</tr>
			<tr>
				<th class="text-r">登记时间：</td>
				<td>
					<fmt:formatDate value="${position.registDate }" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<th class="text-r">截止日期：</td>
				<td>
					<fmt:formatDate value="${position.stopDate }" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<th class="text-r">职位描述：</td>
				<td>${position.positionDescribe }</td>
			</tr>

			<tr>
				<th class="text-r">招聘要求：</td>
				<td>${position.recruitStandard }</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>