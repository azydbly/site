<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My JSP '12.jsp' starting page</title>
<link rel="stylesheet" href="${ctxsty}/cms/style.css" />
<script src="${ctxsty}/common/jquery/jquery-3.2.0.min.js"></script>
<script src="${ctxsty}/cms/html2canvas.min.js"></script>
<script src="${ctxsty}/cms/jspdf.debug.js"></script>
</head>
<body>
<script type="text/javascript">
/* $(function() {  
    var downPdf = document.getElementById("down_button");
      downPdf.onclick = function() {
      	alert(121);
          html2canvas(document.getElementById("myCanvas"), {
              onrendered:function(canvas) {
                  //返回图片dataURL，参数：图片格式和清晰度(0-1)
                  var pageData = canvas.toDataURL('image/jpeg', 1.0);
                  var pdf = new jsPDF('landscape', 'pt', [canvas.width ,canvas.height]);
                  pdf.addImage(pageData, 'JPEG',0,0,canvas.width ,canvas.height);
                  pdf.save('defe.pdf');
              }
          });
      } 
}); */   

/* $(function() {  
    var downPdf = document.getElementById("down_button");
      downPdf.onclick = function() {
          html2canvas(document.getElementById("myCanvas"), {
              onrendered:function(canvas) {
                  //返回图片dataURL，参数：图片格式和清晰度(0-1)
                  var pageData = canvas.toDataURL('image/jpeg', 1.0);
                  var pdf = new jsPDF('landscape', 'pt', [canvas.width ,canvas.height]);
                  pdf.addImage(pageData, 'JPEG',0,0,canvas.width ,canvas.height);
                  pdf.save('defe.pdf');
              }
          });
      } 
});  
 */

$(function() {  
	var downPdf = document.getElementById("down_button");
		downPdf.onclick = function() {
		//var idnumber = document.getElementById("idnumber").html;
		var idnumber = 151;
		html2canvas(document.getElementById("myCanvas"), {
	       	onrendered:function(canvas) {
		       	//返回图片dataURL，参数：图片格式和清晰度(0-1)
		        var pageData = canvas.toDataURL('image/jpeg', 1.0);
		        var pdf = new jsPDF('landscape', 'pt', [canvas.width ,canvas.height]);
		        pdf.addImage(pageData, 'JPEG',0,0,canvas.width ,canvas.height);
		        pdf.save(idnumber + '.PDF');
		    }
		});
	} 
});            
</script>
<!-- <div class="g-content">
     <div class="hd">
        <h2>查询成绩/ <i>Query Result</i></h2>
    </div>

    
     <form class="searchBox" method="post" name="form1">
      <div class="input-prepend">
          <a class="btn"  id="down_button">下载</a> 
        </div>
        <div class="input-prepend">
             <input type="text" class="form-control" id="years" name="years" placeholder="请选择年份" value="" readonly="" onclick="WdatePicker({dateFmt:'yyyy'})"
          onfocus="javascript:document.form1.years.placeholder='请输入年份" onblur="tt()"> 
        </div>
        <div class="input-append">
            <input type="text" class="form-control" id="idnumber" name="idnumber" placeholder="身份证号" 
            onfocus="javascript:document.form1.idnumber.placeholder='身份证号" onblur="a()">
            <button type="button" class="btn btnCus" onclick="initarea()"><i class="i-search"></i></button>
        </div>
        <br/><span  id="s1" ></span><span  id="s2" ></span>
    </form> 


<div class="g-exam" id="myCanvas">
    <ul>
         <li>
            <div class="cnt" id="trmsg">
                <p style="margin-left:180px;">身份证号：<span>140278956236978452</span></p>
	            <p style="margin-top:-30px">姓名：<span>迪丽热巴</span></p>
	            <p style="margin-left:180px;">省市区县：<span>四川资阳市乐至县</span></p>
	            <p style="margin-top:-30px">性别：<span>女</span></p>
	            <p style="margin-left:180px;">单位名称：<span>资阳市乐至县人民政府法制办</span></p>
	            <p style="margin-top:-30px">培训年度：<span>2017</span></p>
	            <p style="margin-left:180px;">计划名称：<span>2017四川省培训计划</span></p>
	            <p style="margin-top:-30px">培训结果：<span>合格</span></p>
             </div>
         </li>
	</ul>
</div>  
</div> -->



	<div class="g-contents">
		<div class="input-prepend">
			<a class="btn"  id="down_button">下载</a> 
		</div>
		<div class="g-exam" id="myCanvas">
		    <ul>
			    <li>
			    	<div class="cnt" id="trmsg">
			    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			    			<tr>
			    				<td>姓名：<span>张三</span></td>
			    				<td>性别：<span>男</span></td>
			    				<td rowspan="8"><img src="${ctxsty}/cms/name.jpg"></td>
			    			</tr>
			    			<tr>
			    				<td style=" width: 400px;">出生日期：<span>1999-01-01</span></td>
			    			</tr>
			    			<tr>
			    				<td style=" width: 400px;">身份证号：<span>140278956236978452</span></td>
			    			</tr>
			    			<tr>
			    				<td>城市：<span>北京市</span></td>
			    				<td>行政区域：<span>东城区</span></td>
			    			</tr>
			    			<tr>
			    				<td style=" width: 400px;">职称：<span>教授</span></td>
			    			</tr>
			    			<tr>
			    				<td style=" width: 400px;">单位名称：<span>北京思想天下教育有限公司</span></td>
			    			</tr>
			    			<tr>
			    				<td style=" width: 400px;">培训成绩：<span>合格</span></td>
			    			</tr>
			    			<tr>
			    				<td style=" width: 400px;">培训周期：<span>2017-10-10——2018-01-01</span></td>
			    			</tr>
			    			<tr>
			    				<td>发证单位：<span>专技天下网</span></td>
			    				<td>发证日期：<span>2017-10-10</span></td>
			    			</tr>
			    		</table>
			    	</div>
			    </li>
			</ul>
		</div>
	</div>
</body>
</html>
