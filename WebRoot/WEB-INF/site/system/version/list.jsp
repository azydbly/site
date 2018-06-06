<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp" %>
<%@ include file="/WEB-INF/layouts/common/publicMeta.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<title>版本日志 </title>
<link rel="stylesheet" type="text/css" href="${ctxsty}/lib/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxsty}/lib/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxsty}/static/yp/css/version_style.css" />
<link rel="stylesheet" type="text/css" href="${ctxsty}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxsty}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctxsty}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<script type="text/javascript" src="${ctxsty}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctxsty}/lib/layer/layer.js"></script>
<script type="text/javascript" src="${ctxsty}/static/yp/js/prohibit.js"></script>
<script type="text/javascript" src="${ctxsty}/pageList/commandScript.js"></script>
</head>
<body class="gray-bg">
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>系统管理 <span class="c-gray en">&gt;</span>版本日志 <a class="btn1 btn-success radius r" style="line-height:1.6em;margin-top:3px;" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<c:forEach items="${roleMenuId }" var="roleMenuId">  
				<c:if test="${roleMenuId.operation.menuname eq 5 }">
					<a href="javascript:;" onclick="add_full('版本日志列表 ','editAndDelete.action')" class="btn btn-danger radius">
						<i class="Hui-iconfont">&#xe6df;</i> 修改／<i class="Hui-iconfont">&#xe6e2;</i>删除
					</a>
				</c:if>
				<c:if test="${roleMenuId.operation.menuname eq 3 }">
					<a href="javascript:;" onclick="add_full('添加日志','versionLogAdd.action')" class="btn btn-primary radius">
						<i class="Hui-iconfont">&#xe600;</i> 添加日志
					</a>
				</c:if>
			</c:forEach>
		</span> 
		<form action="showVersionLogList.action" method="post">
			<input type="hidden" name="roleId" value="${employee.roleId }" />
			<div class="r">
				摘要：
				<select name="versionAbstract" style="width:80px; height:30px;">
					<option value="">--请选择--</option>
					<option value="新增" <c:if test="${versionAbstract == '新增'}">selected</c:if>>新增</option>
					<option value="修改" <c:if test="${versionAbstract == '修改'}">selected</c:if>>修改</option>
					<option value="优化" <c:if test="${versionAbstract == '优化'}">selected</c:if>>优化</option>
				</select>&nbsp;&nbsp;
				版本号：
				<select name="versionNumber" style="width:80px; height:30px;">
					<option value="">--请选择--</option>
					<c:forEach items="${versionNumber}" var="versionNumber">
						<option value="${versionNumber.versionNumber }" <c:if test="${number == versionNumber.versionNumber }">selected</c:if>>${versionNumber.versionNumber }</option>
					</c:forEach>
				</select>&nbsp;&nbsp;
				版本标题：
				<input type="text" class="input-text" style="width:200px" placeholder="标题名称" name="title" value="${title }">&nbsp;&nbsp;
				<button type="submit" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
			</div>
		</form>
	</div>
</div>

<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="text-center float-e-margins p-md"> <span>预览：</span> <a href="#" class="btn btn-xs btn-primary" id="lightVersion">浅色</a> <a href="#" class="btn btn-xs btn-primary" id="darkVersion">深色</a> <a href="#" class="btn btn-xs btn-primary" id="leftVersion">布局切换</a> </div>
        <div id="ibox-content">
			<div id="vertical-timeline" class="vertical-container light-timeline">
				<c:forEach items="${versionLogs}" var="versionLog">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon"> <i class="fa"></i> </div>
						<div class="vertical-timeline-content">
							<h2>${versionLog.title}</h2>
							<p>${versionLog.versionAbstract } &nbsp;&nbsp;&nbsp; <em>版本号：${versionLog.versionNumber }</em></p>
							<p>${versionLog.content}</p>
							<span class="vertical-date">${versionLog.role.name }<br>
								<small>
									<fmt:formatDate value="${versionLog.createTime}" pattern="yyyy/MM/dd HH:mm" />
								</small>
							</span> 
						</div>
					</div>
				</c:forEach>
			</div>
        </div>
        
        <c:if test="${page.pageNum lt page.totalPages}">
          <button class="btn btn-primary btn-block m more-button" onclick="options(this)" data-pager-pageNum="${page.pageNum }" data-pager-versionNumber="${number }" data-pager-title="${title }" data-pager-versionAbstract="${versionAbstract }"><i class="fa fa-arrow-down"></i> 显示更多</button>
        </c:if>
        <c:if test="${page.pageNum ge page.totalPages}">
          <div class="spiner-example">
            <div class="sk-spinner sk-spinner-cube-grid">
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
            </div>
          </div>
          <h4 class="text-center">没有更多数据了...</h4>
        </c:if>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctxsty}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
//样式转换
$(document).ready(function() {
	$('#lightVersion').click(function(event) {
		event.preventDefault()
		$('#ibox-content').removeClass('ibox-content');
		$('#vertical-timeline').removeClass('dark-timeline');
		$('#vertical-timeline').addClass('light-timeline');
	});

	$('#darkVersion').click(function(event) {
		event.preventDefault()
		$('#ibox-content').addClass('ibox-content');
		$('#vertical-timeline').removeClass('light-timeline');
		$('#vertical-timeline').addClass('dark-timeline');
	});

	$('#leftVersion').click(function(event) {
		event.preventDefault()
		$('#vertical-timeline').toggleClass('center-orientation');
	});
});

//显示更多按钮
function options(obj) {
	var pageNum = $(obj).attr('data-pager-pageNum'); // 当前页数
	var nowPageNum = parseInt(pageNum) + parseInt(1);//页数加一
	var versionNumber = $(obj).attr('data-pager-versionNumber'); //版本号
	var title = $(obj).attr('data-pager-title');//标题
	var roleId = $("input:hidden").attr("value");//角色id
	var versionAbstract = $(obj).attr('data-pager-versionAbstract');//摘要
	window.location.href = 'showVersionLogList.action?pageNum=' + nowPageNum + '&versionNumber=' + versionNumber + '&title=' + title +'&roleId=' + roleId + '&versionAbstract=' + versionAbstract;
}


//随机分配标签颜色
$(function() {
	var $elements = $('.vertical-timeline-block');
	var len = $elements.length;
	$elements.each(function() {
		var $this = $(this);
		var num = (Math.floor(Math.random() * 5) + 1); //输出1-5的随机数搜索
		switch (num) { //然后判断
		case 1:
			$this.children('.vertical-timeline-icon').addClass("navy-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-briefcase");
			break;
		case 2:
			$this.children('.vertical-timeline-icon').addClass("blue-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-file-text");
			break;
		case 3:
			$this.children('.vertical-timeline-icon').addClass("lazur-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-coffee");
			break;
		case 4:
			$this.children('.vertical-timeline-icon').addClass("yellow-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-phone");
			break;
		default:
			$this.children('.vertical-timeline-icon').addClass("lazur-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-user-md");
			break;
		}
	});
});
</script>
</body>
</html>