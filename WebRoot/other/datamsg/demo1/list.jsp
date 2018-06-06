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
            <span>
                <span style="float: left;">当前位置是：数据分析 ---》职员明细表</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                   
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                   部门: 
				   <select>
						<option>
							--请选择---
						</option>
						<option>
							产品设计中心
						</option>
						<option>
							平台研发中心
						</option>
						<option>
							人力资源中心
						</option>
						<option>
							财务部
						</option>
				   </select>
				   员工姓名：
					<input type="text"  />
					档案状态：
					<select>
						<option>
							--请选择---
						</option>
						<option>
							试用期
						</option>
						<option>
							正式员工
						</option>
						<option>
							离职
						</option>
						<option>
							已删除
						</option>
						
				   </select>
					 建档时间: 
					<input type="text"  />
					至
					<input type="text"  />
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="110px;">部门</td>
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
						  <td >DBQN000001</td>
						  <td >张华</td>
						  <td >男</td>
						  <td >技术培训师</td>
						  <td >高级软件开发工程师</td>
						 <td >13623452345</td>
						 <td >试用期</td>
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
					
					 <tr id="product1">
                          
						  <td >DBQN000003</td>
						  <td >刘湖南</td>
						  <td >男</td>
						  <td >产品培训师</td>
						  <td >高级软件开发工程师</td>
						 <td >13623452345</td>
						 <td >正式员工</td>
						 <td >2013-12-09</td>              
                    </tr>
					
					 <tr id="product1">
                           <td  >平台研发中心</td>
						  <td >DBQN000004</td>
						  <td >黎去去</td>
						  <td >女</td>
						  <td >技术培训师</td>
						  <td >高级软件开发工程师</td>
						 <td >13623452345</td>
						 <td >试用期</td>
						 <td >2013-12-09</td>           
                    </tr>
					
                    <tr>
                        <td colspan="20" style="text-align: center;">						
						<a style="text-decoration: none;" href="#">
                            首页 上一页  ... 7 8 9 10 11 12 ... 下一页 尾页 共1234条 每页显示 10/23 </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>