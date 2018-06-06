<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>培训管理</title>
</head>
<body>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r" width="80">培训名称：</th>
				<td>${train.tname }</td>
			</tr>
			<tr>
				<th class="text-r">培训讲师：</td>
				<td>${train.teacher }</td>
			</tr>
			<tr>
				<th class="text-r">培训时间：</td>
				<td><fmt:formatDate value='${train.begintime }' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<th class="text-r">至：</td>
				<td><fmt:formatDate value='${train.endtime }' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<th class="text-r">培训目的：</td>
				<td>${train.taim }</td>
			</tr>
			<tr>
				<th class="text-r">参训人员：</td>
				<td>${train.tpersion }</td>
			</tr>
			<tr>
				<th class="text-r">培训简介：</td>
				<td>${train.tabstracts }</td>
			</tr>
			<tr>
				<th class="text-r">培训资料：</td>
				<c:if test="${train.tfiles == null || train.tfiles == '' }">
					<td>未上传</td>
				</c:if>
				<c:if test="${train.tfiles != null && train.tfiles != '' }">
					<td>
						${train.tfiles }&nbsp;&nbsp;
						<a title="下载附件" href="downTrain.action?url=${train.url}&tfiles=${train.tfiles }" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe641;</i>下载附件</a>
					</td>
				</c:if>
			</tr>
			<c:if test="${train.tfeedback != 0 }">
				<tr>
					<th class="text-r">反馈结果：</td>
					<td>
						<c:if test="${train.tfeedback == 1 }">优</c:if>
						<c:if test="${train.tfeedback == 2 }">良</c:if>
						<c:if test="${train.tfeedback == 3 }">差</c:if>
					</td>
				</tr>
			</c:if>
			<tr>
				<th class="text-r">培训总结：</td>
				<td>${train.tsummary }</td>
			</tr>
			<tr>
				<th class="text-r">考核结果：</td>
				<td>${train.tout }</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>