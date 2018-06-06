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
			td{
				width:11%;
				height:35px;
				text-align:center}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是： 数据分析》》》储备人才统计表</span>
               
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                    员工姓名： 
					<input type="text"  />
					 
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold; background-color:#06F">
                       <td>姓名</td>
                        <td>性别</td>
                         <td>电话</td>
                          <td>专业</td>
                           <td>学历</td>
                            <td>学校</td>
                             <td>工作经验</td>
                              <td>是否应聘过本公司</td>
                               <td></td>   
                    </tr>

                    <tr id="product1">
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td> 
                       <td></td>
                       <td></td>
                       <td></td>                 
                    </tr> 
					 <tr id="product1">
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td> 
                       <td></td>
                       <td></td>
                       <td></td>                 
                    </tr> 
					
					 <tr id="product1">
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td> 
                       <td></td>
                       <td></td>
                       <td></td>                 
                    </tr> 
					
					<tr id="product1">
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td> 
                       <td></td>
                       <td></td>
                       <td></td>                 
                    </tr> 
					
                   <tr id="product1">
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td> 
                       <td></td>
                       <td></td>
                       <td></td>                 
                    </tr> 
                </tbody>
            </table>
        </div>
    </body>
</html>