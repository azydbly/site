<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>薪酬标准管理</title>
</head>
<body>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r">员工：</th>
				<td>${salary.employee.userName }</td>
			</tr>
				<tr>
				<th class="text-r">部门名称：</th>
				<td>${salary.department.fullName }</td>
			</tr>
			<tr>
				<th class="text-r">职位名称：</th>
				<td>${salary.role.name }</td>
			</tr>
			<tr>
				<th class="text-r">薪酬总额：</th>
				<td>${salary.payroll }元</td>
			</tr>
			<tr>
				<th class="text-r">登记人：</th>
				<td>${entry }</td>
			</tr>
			<tr>
				<th class="text-r">登记时间：</th>
				<td><fmt:formatDate value='${salary.addtime }' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<th class="text-r">基本工资：</th>
				<td>${salary.basepay } 元</td>
			</tr>
			<tr>
				<th class="text-r">绩效奖金：</th>
				<td>${salary.bonus }元</td>
			</tr>
			<tr>
				<th class="text-r">交通补助：</th>
				<td>${salary.travel } 元</td>
			</tr>
			<tr>
				<th class="text-r">通讯补助：</th>
				<td>${salary.phone } 元</td>
			</tr>
			<tr>
				<th class="text-r">餐补：</th>
				<td>${salary.meal }元</td>
			</tr>
			<tr>
				<th class="text-r">住房补助：</th>
				<td>${salary.house } 元</td>
			</tr>
			<tr>
				<th class="text-r">出差补助：</th>
				<td>${salary.bussiness } 元</td>
			</tr>
			<tr>
				<th class="text-r">加班补助：</th>
				<td>${salary.addwork } 元</td>
			</tr>
			<tr>
				<th class="text-r">备注：</th>
				<td>${salary.remark }</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>