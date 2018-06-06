<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

        <title>薪酬标准管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../../css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-题库管理设置</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="list.html">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">标题<span style="color:red">*</span>：</td>
                    <td><input type="text" name="f_goods_name" value="" /></td>
                </tr>
                <tr>
                    <td>试题类型<span style="color:red">*</span>：</td>
                    <td>
                      <select>
			<option>---请选择---</option>
			<option>java开发</option>		
			<option>C++开发</option>		
			<option>C#开发</option>		
			<option>PHP开发</option>		
			<option>软件测试</option>		
		      </select>
                    </td>
                </tr>
               
                <tr>
                    <td>所属部门<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="f_goods_price" value="" /></td>
                </tr>
                <tr>
                    <td>试题级别<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" readonly name="f_goods_image" value="" />
					</td>
                </tr>
                <tr>
                    <td>出题人<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="" />
                    </td>
                </tr>


				<tr>
                    <td>出题时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value=""/>
                    </td>                
                </tr>

				<tr>
                    <td>试题内容：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="" />
                    </td>                
                </tr>

				<tr>
                    <td>备注：</td>
                    <td>
                        <input type="text" name="f_goods_image" value=""/>
                    </td>                
                </tr>

				<tr>
                    <td>试题附件：</td>
                    <td>
                        <input type="file" name="f_goods_image" value="" />
                    </td>                
                </tr>

				<tr>
                    <td>是否启用：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="" />
                    </td>                
                </tr>
				
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="添加">
						<input type="submit" value="清空">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>