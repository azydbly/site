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
				width:7%;
				height:40px;
				text-align:center;}
        </style>
        <script type="text/javascript">
        	function fanhui(){
					location.href="yuezilist.html";
				}
        </script>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：数据分析》》》职员异动情况统计分析》》职员异动情况---入职明细表</span>
                
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="#" method="get">
                   员工姓名
					<input type="text"  />
                   <input type="submit" value="查询" />
                  
                   <input type="button" value="返回" onclick="javascript:fanhui()" />
					
                </form>
                
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
        	2007 年1月 &nbsp;&nbsp;&nbsp;&nbsp;产品设计中心 &nbsp;&nbsp;&nbsp;&nbsp;部门入职明细表
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody>
                
					<tr style="font-weight: bold; background-color:#06C;">
                    
                        <td rowspan="2" >编号</td>
                        <td rowspan="2" >部门</td>
                        <td rowspan="2" >岗位</td>
                        <td rowspan="2" >姓名</td>
                        <td rowspan="2" width="11%" >入职时间</td>
                        <td colspan="8" style="text-align:center">未提交资料</td>
                        
                    </tr>
					<tr style="font-weight: bold; background-color:#06C">
                    	 <td>离职证明</td>
                        <td>体检报告</td>
                        <td>彩色照片</td>
                        <td>省份证复印件</td>
                        <td>户口本复印件</td>
                        <td>学历证复印件</td>
                        <td>录用确认函</td>
                        <td width="12%" >其他</td>	
                    </tr>
                    <tr>
                    	<td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="11%"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="12%"></td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="11%"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="12%"></td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="11%"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="12%"></td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="11%"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="12%"></td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="11%"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="12%"></td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="11%"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td width="12%"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>