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
         <script type="text/javascript">
        	function fanhui(){
					location.href="list.html";
				}
        </script>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：数据分析》》》职员异动情况统计分析》》》职工异动情况月度总表</span>
                
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
                   <input type="submit" value="提交" />
					 <input type="button" value="返回" onclick="javascript:fanhui()"/>
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody>
                
					<tr style="font-weight: bold; background-color:#06C">
                    
                        <td style="width:150px; height:50px; text-align:right; border-bottom:none">异动类型</td>
						<td colspan="3" style="width:30px;">入职(人数)</td>
						<td colspan="3" style="width:30px;">转正(人数)</td>
						<td colspan="3" style="width:30px;">调薪(人数)</td>
						<td colspan="3" style="width:30px;">续签(人数)</td>
						<td colspan="3" style="width:30px;">调岗(人数)</td>
						<td colspan="3" style="width:30px;">离职(人数)</td>
						<td colspan="3" style="width:30px;">其他变更(人数)</td>
						<td rowspan="2" style="width:90px;">总计</td>
                    </tr>
					<tr style="font-weight: bold;height:130px;background-color:#06C">
                        <td style="border-top:none; text-align:left;" valign="bottom">时间</td>
						<td >教育产品发展本部</td>
						<td>职业教育研究院</td>
						<td >总计</td>
						<td>教育产品发展本部</td>
						<td>职业教育研究院</td>
						<td >总计</td>
						<td>教育产品发展本部</td>
						<td>职业教育研究院</td>
						<td >总计</td>
						<td>教育产品发展本部</td>
						<td>职业教育研究院</td>
						<td >总计</td>
						<td>教育产品发展本部</td>
						<td>职业教育研究院</td>
						<td >总计</td>
						<td>教育产品发展本部</td>
						<td>职业教育研究院</td>
						<td >总计</td>
						<td>教育产品发展本部</td>
						<td>职业教育研究院</td>
						<td >总计</td>
                    </tr>

                    <tr id="product1">
                    	<td style="text-align:center"><a href="" >一月</a></td>
                        <td></td>
                        <td><a href="yuezilist.html">500</a></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >二月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                       <td style="text-align:center"><a href="" >三月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >四月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >五月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >六月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >七月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >八月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >九月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >十月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >十一月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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
                        <td style="text-align:center"><a href="" >十二月</a></td>
                        <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
                        <td></td>
                         <td></td>
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