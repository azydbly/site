<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common/public.jsp" %>
<html>
<head>
<title>档案明细</title>
</head>
<body>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r">所属部门：</th>
				<td>${sltFile.department.fullName }</td>
			</tr>
			<tr>
				<th class="text-r">档案状态：</th>
				<td>
					<c:if test="${sltFile.state == 1 }">实习</c:if>
					<c:if test="${sltFile.state == 2 }">正式员工</c:if>
					<c:if test="${sltFile.state == 3 }">离职</c:if>
					<c:if test="${sltFile.state == 4 }">实习员工</c:if>
				</td>
			</tr>
			<tr>
				<th class="text-r">职位名称：</th>
				<td>${sltFile.role.name }</td>
			</tr>
			<tr>
				<th class="text-r">姓名：</th>
				<td>${sltFile.employee.userName }</td>
			</tr>
			<tr>
				<th class="text-r">身份证号：</th>
				<td>${sltFile.idCard }</td>
			</tr>
			<tr>
				<th class="text-r">性别：</th>
				<td>
					<c:if test="${sltFile.sex == 1 }">男</c:if>
					<c:if test="${sltFile.sex == 0 }">女</c:if>
				</td>
			</tr>
			<tr>
				<th class="text-r">EMAIL：</th>
				<td>${sltFile.email }</td>
			</tr>
			<tr>
				<th class="text-r">联系电话：</th>
				<td>${sltFile.pphone }</td>
			</tr>
			<tr>
				<th class="text-r">毕业院校：</th>
				<td>${sltFile.univercity }</td>
			</tr>
			<tr>
				<th class="text-r">专业：</th>
				<td>${sltFile.major }</td>
			</tr>			<tr>
				<th class="text-r">学历：</th>
				<td>${sltFile.education }</td>
			</tr>
			<tr>
				<th class="text-r">住址：</th>
				<td>${sltFile.address }</td>
			</tr>
			
			<tr>
				<th class="text-r">户口所在地：</th>
				<td>${sltFile.hukouAdrs }</td>
			</tr>
			
			<tr>
				<th class="text-r">政治面貌：</th>
				<td>${sltFile.polity }</td>
			</tr>
			<tr>
				<th class="text-r">薪资总额：</th>
				<c:if test="${salary.payroll == null || salary.payroll == '' }">
					<td>该员工没有薪资档案信息</td>
				</c:if>
				<c:if test="${salary.payroll != null && salary.payroll != '' }">
					<td>￥：${salary.payroll } <span id="details"><input class="btn btn-link radius" type="button" onClick="member_show(this)" value="详情"></span></td>
				</c:if>
			</tr>
			
			<tr class="details">
				<th class="text-r">基本工资：</th>
				<td>${salary.basepay } 元</td>
			</tr>
			<tr class="details">
				<th class="text-r">绩效奖金：</th>
				<td>${salary.bonus }元</td>
			</tr>
			<tr class="details">
				<th class="text-r">交通补助：</th>
				<td>${salary.travel } 元</td>
			</tr>
			<tr class="details">
				<th class="text-r">通讯补助：</th>
				<td>${salary.phone } 元</td>
			</tr>
			<tr class="details">
				<th class="text-r">餐补：</th>
				<td>${salary.meal }元</td>
			</tr>
			<tr class="details">
				<th class="text-r">住房补助：</th>
				<td>${salary.house } 元</td>
			</tr>
			<tr class="details">
				<th class="text-r">出差补助：</th>
				<td>${salary.bussiness } 元</td>
			</tr>
			<tr class="details">
				<th class="text-r">加班补助：</th>
				<td>${salary.addwork } 元</td>
			</tr>
			
			<tr>
				<th class="text-r">开户行：</th>
				<td>${sltFile.bankName }</td>
			</tr>
			<tr>
				<th class="text-r">银行卡号：</th>
				<td>${sltFile.bkCardNum }</td>
			</tr>
			<tr>
				<th class="text-r">社保卡号：</th>
				<td>${sltFile.sequNum }</td>
			</tr>
			<tr>
				<th class="text-r">登记人：</th>
				<td>${checkMan }</td>
			</tr>
			<tr>
				<th class="text-r">个人履历：</th>
				<td>${sltFile.resume }</td>
			</tr>
			<tr>
				<th class="text-r">家庭关系信息：</th>
				<td>${sltFile.famRelation }</td>
			</tr>
			<tr>
				<th class="text-r">简历附件：</th>
				<td>
					<c:if test="${sltFile.fileLocation == null || sltFile.fileLocation == '' }">
						未上传
					</c:if>
					<c:if test="${sltFile.fileLocation != null && sltFile.fileLocation != '' }">
						${sltFile.fileLocation }&nbsp;&nbsp;
						<a title="下载附件" href="downAttach.action?url=${sltFile.url }&fileName=${sltFile.fileLocation }" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe641;</i>下载附件</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="text-r">备注：</th>
				<td>${sltFile.remark }</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(".details").hide();
//显示详情
function member_show(obj){
	$(".details").fadeIn(800);
	$(obj).parents("tr").find("#details").html("<input class='btn btn-link radius' type='button' onClick='member_hide(this)' value='收起'>");
}
//隐藏详情
function member_hide(obj){
	$(".details").fadeOut(800);
	$(obj).parents("tr").find("#details").html("<input class='btn btn-link radius' type='button' onClick='member_show(this)' value='详情'>");
}
</script>
</body>
</html>