<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>简历管理</title>
</head>
<body>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r" width="120">应聘职位名称：</th>
				<td>${resumeManage.positionName }</td>
			</tr>
			<tr>
				<th class="text-r">应聘职位编码：</th>
				<td>${resumeManage.positionCode }</td>
			</tr>
			<tr>
				<th class="text-r">职位分类：</th>
				<td>${resumeManage.positionType }</td>
			</tr>
			<tr>
				<th class="text-r">姓名：</th>
				<td>${resumeManage.username }</td>
			</tr>
			<tr>
				<th class="text-r">性别：</th>
				<td>${resumeManage.sex }</td>
			</tr>
			<tr>
				<th class="text-r">招聘类型：</th>
				<td>${resumeManage.recruitType }</td>
			</tr>
			<tr>
				<th class="text-r">EMAIL：</th>
				<td>${resumeManage.mail }</td>
			</tr>
			<tr>
				<th class="text-r">联系电话：</th>
				<td>${resumeManage.phone }</td>
			</tr>
			<tr>
				<th class="text-r">户口所在地：</th>
				<td>${resumeManage.homeLocation }</td>
			</tr>
			<tr>
				<th class="text-r">住址：</th>
				<td>${resumeManage.address }</td>
			</tr>
			<tr>
				<th class="text-r">政治面貌：</th>
				<td>${resumeManage.politicalFace }</td>
			</tr>
			<tr>
				<th class="text-r">身份证号：</th>
				<td>${resumeManage.idCard }</td>
			</tr>
			<tr>
				<th class="text-r">毕业院校：</th>
				<td>${resumeManage.graduateCollege }</td>
			</tr>
			<tr>
				<th class="text-r">学历：</th>
				<td>${resumeManage.educationBackground }</td>
			</tr>
			<tr>
				<th class="text-r">专业：</th>
				<td>${resumeManage.major }</td>
			</tr>
			<tr>
				<th class="text-r">工作经验：</th>
				<td>${resumeManage.workExperience }</td>
			</tr>
			<tr>
				<th class="text-r">薪资要求：</th>
				<td>${resumeManage.hopeWages }</td>
			</tr>
			<tr>
				<th class="text-r">是否在职：</th>
				<td>${resumeManage.onTheJob }</td>
			</tr>
			<tr>
				<th class="text-r">是否应届生：</th>
				<td>${resumeManage.graduateNow }</td>
			</tr>
			<tr>
				<th class="text-r">登记时间：</th>
				<td><fmt:formatDate value="${resumeManage.registDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th class="text-r">个人履历：</th>
				<td>${resumeManage.personalResume }</td>
			</tr>
			<tr>
				<th class="text-r">简历附件：</th>
				<td>
					<c:if test="${resumeManage.url == null || resumeManage.url == '' }">
						未上传
					</c:if>
					<c:if test="${resumeManage.url != null && resumeManage.url != '' }">
						${resumeManage.urlFile }&nbsp;&nbsp;
						<a title="下载附件" href="download.action?url=${resumeManage.url }&urlFile=${resumeManage.urlFile}" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe641;</i>下载附件</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="text-r">是否推荐面试：</th>
				<td>${resumeManage.recommend }</td>
			</tr>
			<c:if test="${resumeManage.recommend == '是' }">
				<tr>
					<th class="text-r">推荐人：</th>
					<td>${resumeManage.recommendPerson }</td>
				</tr>
			</c:if>
			<tr>
				<th class="text-r">推荐时间：</th>
				<td><fmt:formatDate value="${resumeManage.recommendDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th class="text-r">推荐面试意见：</th>
				<td>${resumeManage.recommendIdea }</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>