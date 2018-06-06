<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>薪酬标准管理审核</title>
<script type="text/javascript" src="${ctxsty}/pageList/commandScript.js"></script>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>员工：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text" value="${salary.employee.userName }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>部门：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly value="${salary.department.fullName }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text" value="${salary.role.name }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text" value="${entry }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登记时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text" value="<fmt:formatDate value='${salary.addtime }' pattern='yyyy-MM-dd' />" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>基本工资：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text money" value="${salary.basepay }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>绩效奖金：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text money" value="${salary.bonus }" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>交通补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text money " value="${salary.travel }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通讯补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text money" value="${salary.phone }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>餐补：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text money" value="${salary.meal }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>住房补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text money" value="${salary.house }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出差补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text money" value="${salary.bussiness }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>加班补助：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text money" value="${salary.addwork }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>薪酬总额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text"readonly class="input-text" readonly value="${salary.payroll }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly class="input-text" value="${salary.remark }">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" onclick="change('updSalState.action','${salary.id }','3')" type="button" value="&nbsp;&nbsp;通过&nbsp;&nbsp;">
				<input class="btn btn-primary radius" onclick="change('updSalState.action','${salary.id }','4')" type="button" value="&nbsp;&nbsp;驳回&nbsp;&nbsp;">
				<button onClick="layerClose();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>