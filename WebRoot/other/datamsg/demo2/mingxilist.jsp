<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
<base href="<%=basePath%>">
 <meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>数据分析</title>

        <link href="../../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <div style="width:50%; height:100%; float:left">明细列表</div> <div style="width:50%; height:100%; float:right; text-align:right"><input type="button" value="返回" onclick="history.go(-1)" /></div>
        </div>
        
       
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="110px;">部门</td>
						<td width="110px;">学历</td>
                        <td width="140px;">档案编号</td>						
                        <td width="80px;">员工姓名</td>
                        <td width="80px;">性别</td>
						<td width="100px;">职位</td>
                        <td width="120px;">职称</td> 
						<td width="100px;">电话</td>
                        <td width="120px;">档案状态</td>
						<td width="120px;">建档日期</td>
                    </tr>

                    <tr id="product1">
                          <td rowspan="3" >产品设计中心</td>
						  <td rowspan="2">硕士</td>
						  <td >DBQN000001</td>
						  <td >张华</td>
						  <td >男</td>
						  <td >技术培训师</td>
						  <td >高级软件开发工程师</td>
						 <td >13623452345</td>
						 <td >调用期</td>
						 <td >2013-12-09</td>
                    </tr> 
					 <tr id="product1">
                          
						  <td >DBQN000002</td>
						  <td >王晓庆</td>
						  <td >女</td>
						  <td >技术培训师</td>
						  <td >初级软件开发工程师</td>
						 <td >13623452345</td>
						 <td >正式员工</td>
						 <td >2013-12-09</td>            
                    </tr>
					
					 <tr >
                           <td>博士</td>
						  <td >DBQN000003</td>
						  <td >刘湖南</td>
						  <td >男</td>
						  <td >产品培训师</td>
						  <td >高级软件开发工程师</td>
						 <td >13623452345</td>
						 <td >正式员工</td>
						 <td >2013-12-09</td>              
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </body>
</html>