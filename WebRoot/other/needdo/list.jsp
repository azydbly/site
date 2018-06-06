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

        <title>会员列表</title>

        <link href="../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：工作平台》待办列表</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">                    
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                    类型: 
					<select name="s_product_mark" style="width: 100px;">
                        <option selected="selected" value="0">档案调整</option>
                        <option value="1">薪酬调整</option>
                    </select>
                   
					 内容: 
					<input type="text"  />
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="40px;">序号</td>
                       						
                        <td width="35px;">类型</td>
                        <td width="100px;">待办类型</td>
						<td >内容</td>
                        <td width="120px;">日期</td>                       
                        <td align="center" width="70px;">操作</td>
                    </tr>

                    <tr id="product1">
                        <td>1</td>
                      
						<td>紧急</td>
                        <td>档案变更</td> 
						<td><a href="#"  >李XX 档案信息变更</a></td> 						
                        <td>2012-10-18 17:40</td>
                        <td><a href="#">办理</a> </td>                        
                    </tr> 
					  <tr id="product1">
                        <td>2</td>
                     
						<td>紧急</td>
                        <td>薪酬调整</td> 
						<td><a href="#">王五 薪酬调整</a></td> 						
                        <td>2012-10-18 17:40</td>
                        <td><a href="#">办理</a> </td>                       
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