<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
//获取当前职位的Id
var roleid = $('#roleId').html();
$(function() {
	$('#tt').tree({
		url : 'treeJson.action?roleId=' + roleid,  
		id:'id',
		textField:'menuname',
		checkbox:true, 
		cascadeCheck:true
	}); 
});
</script>

<!-- 树 -->
<a style="display: none;" class="easyui-linkbutton" href="#" onclick="getChecked()">显示所选节点</a>

<!-- 获取当前的角色Id -->
<div id="roleId" style="display:none;">${roleId }</div>
<!-- 显示树的位置 -->
<ul id="tt"></ul>
