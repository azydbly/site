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

        <title>薪酬标准管理</title>

        <link href="../../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <script type="text/javascript">
        	function fanhui(){
					location.href="list.html";
				}
        </script>
        
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：数据分析 》》》职员数据综合报表</span>
              
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                  部门：
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
                   <input type="submit" value="查询" />
                   <input type="button" value="返回"  onclick="javascript:fanhui()"/>
                  
					
                </form>
            </span>
            
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%" >
                <tbody>
					<tr style="font-weight: bold;">
                        <td width="90px;" style="text-align:right; border-bottom:none">学历</td>
                        <td width="60px;" rowspan="2" valign="top">全部(人数)</td>						
                        <td width="60px;" rowspan="2" valign="top">博士(人数)</td>
                        <td width="60px;" rowspan="2" valign="top">硕士(人数)</td>
						<td width="60px;" rowspan="2" valign="top">本科(人数)</td>
                        <td width="60px;" rowspan="2" valign="top">专科(人数)</td>                       
                        
                    </tr>
					<tr style="font-weight: bold;">
                        <td  style="text-align:left; border-top:none">部门</td>
                       
                    </tr>
                    <tr id="product1">
                        <td style="font-weight: bold;">*****公司</td>
                        <td><a href="">500</a></td>
						<td><a href="">50</a></td>
						<td><a href="">100</a></td>
						<td><a href="">300</a></td>
						 <td><a href="">50</a></td>
                    </tr> 
					 <tr id="product1">
                      <td style="font-weight: bold;">产品设计中心</td>
                        <td><a href="mingxilist.html">300</a></td>
						<td><a href="">50</a></td>
						<td><a href="">100</a></td>
						<td><a href="">300</a></td>
						 <td><a href="">50</a></td>                   
                    </tr>
					
					 <tr id="product1">
                        <td style="font-weight: bold;">平台研发中心</td>
                        <td><a href="">100</a></td>
						<td><a href="">50</a></td>
						<td><a href="">100</a></td>
						<td><a href="">300</a></td>
						 <td><a href="">50</a></td>                    
                    </tr>
					
					 <tr id="product1">
                       <td style="font-weight: bold;">人力资源中心</td>
                        <td><a href="">50</a></td>
						<td><a href="">50</a></td>
						<td><a href="">100</a></td>
						<td><a href="">300</a></td>
						 <td><a href="">50</a></td>                 
                    </tr>
					 <tr id="product1">
                       <td style="font-weight: bold;">财务部</td>
                        <td><a href="">50</a></td>
						<td><a href="">50</a></td>
						<td><a href="">100</a></td>
						<td><a href="">300</a></td>
						 <td><a href="">50</a></td>                 
                    </tr>
                   
                </tbody>
            </table>
        </div>
    </body>
</html>