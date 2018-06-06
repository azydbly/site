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
        <style type="text/css">
            .tr_color{background-color: #9F88FF}
			
        </style>
         <script type="text/javascript">
        	function fanhui(){
					location.href="yuezonglist.html";
				}
        </script>
        
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：数据分析》》》职员异动情况统计分析》》》职工异动情况月度子表</span>
                
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                    月份：
					<select>
						<option>--请选择--</option>
						<option>一月</option>
						<option>二月</option>
						<option>三月</option>
                        <option>四月</option>
						<option>五月</option>
						<option>六月</option>
                        <option>七月</option>
						<option>八月</option>
						<option>九月</option>
                        <option>十月</option>
						<option>十一月</option>
						<option>十二月</option>
                     </select>
                   <input type="submit" value="查询" />
					 <input type="button" value="返回" onclick="javascript:fanhui()"/>
                </form>
            </span>
        </div>
        <div>年度：2007</div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody>
                
					<tr style="font-weight: bold; background-color:#06C">
                    
                        <td colspan="2" rowspan="2" style="width:150px; height:50px; text-align:right; border-bottom:none">异动类型</td>
						<td colspan="5" style="text-align:center" >入职</td>
                    </tr>
					<tr style="font-weight: bold;background-color:#06C">		
                        <td colspan="5" style="text-align:center" >职业教育研究院</td>
                    </tr>

                    <tr id="product1" style="font-weight: bold; background-color:#06C">
                    	<td style="text-align:left; border-top:none;" valign="bottom" colspan="2">时间</td>
                        <td>产品设计中心</td>
                         <td>产品研发中心</td>
                        <td>质量管理部</td>
                         <td>产品管理部</td>
                        <td>总计</td>
                    </tr> 
					 <tr id="product1">
                        <td style="text-align:center" rowspan="12">2007年</td>
                        <td>一月</td>
                        <td><a href="ruzhilist.html">20</a></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>           
                    </tr>
					
					 <tr id="product1">
                        <td>二月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                          
                    </tr>
					
					 <tr id="product1">
                         <td >三月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                            
                    </tr>
                    <tr id="product1">
                         <td>四月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                         
                    </tr>
                    <tr id="product1">
                        <td>五月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                 
                    </tr>
                    <tr id="product1">
                         <td>六月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                      
                    </tr>
                    <tr id="product1">
                         <td>七月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                      
                    </tr>
                     <tr id="product1">
                         <td>八月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                      
                    </tr>
                     <tr id="product1">
                         <td>九月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                      
                    </tr>
                     <tr id="product1">
                         <td>十月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                      
                    </tr>
                     <tr id="product1">
                         <td>十一月</td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>                      
                    </tr>
                     <tr id="product1">
                         <td>十二月</td>
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