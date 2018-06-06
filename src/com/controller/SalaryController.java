package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entity.Department;
import com.entity.RoleMenu;
import com.entity.Salary;
import com.google.gson.Gson;
import com.service.DepartmentService;
import com.service.EmployeeService;
import com.service.MenuService;
import com.service.RoleMenuService;
import com.service.SalaryService;
import com.system.util.DataTables;
import com.system.util.WriterUtil;

@Controller
public class SalaryController {
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	private SalaryService salaryService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	public static final String LIST = "salary/standard/list";
	public static final String LIST1 = "salary/approval/list";
	public static final String LIST2 = "salary/entry/list";
	public static final String ADD = "salary/standard/add";
	public static final String EDIT = "salary/standard/edit";
	public static final String VIEW = "salary/standard/view";
	public static final String EDIT1 = "salary/approval/edit";

	 //薪酬管理 填写 页面
	 @RequestMapping("/salarymanagerStandard.action")
	 public String selAllSalaryStandard(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("salarymanagerStandard.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		 return LIST;
	 }
	 
	//薪酬管理 审批 页面
	 @RequestMapping("/salarymanagerExamine.action")
	 public String selAllSalaryExamine(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("salarymanagerExamine.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST1;
	 }
	 
	 //薪酬管理 发放 页面
	 @RequestMapping("/salarymanagerFile.action")
	 public String selAllSalaryFile(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("salarymanagerFile.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST2;
	 }
	 
	 
	//分页显示薪资
	@ResponseBody
	@RequestMapping(value = "/showPageSalary.action", produces = "application/json; charset=utf-8")
	public String showPageSalary(@RequestParam(value="checkstate",required=false)String checkstate,String save){
		if(save.equals("standard")){
			checkstate = StringUtils.isEmpty(checkstate) ? "" : ("s.checkstate=" + checkstate);
			return JSON.toJSONString(salaryService.getPageSalaryList(DataTables.getInstance(request,checkstate)));
		}else if(save.equals("examine")){
			checkstate = "2";
			checkstate = StringUtils.isEmpty(checkstate) ? "" : ("s.checkstate=" + checkstate);
			return JSON.toJSONString(salaryService.getPageSalaryList(DataTables.getInstance(request,checkstate)));
		}else if(save.equals("file")){
			checkstate = "4";
			checkstate = StringUtils.isEmpty(checkstate) ? "" : ("s.checkstate=" + checkstate);
			return JSON.toJSONString(salaryService.getPageSalaryList(DataTables.getInstance(request,checkstate)));
		}else{
			return null;
		}
	}
	 
	 
	//薪酬发放管理 中的导出Excel表格
	 @RequestMapping("/exportSalary.action")
	 public void exportSalary(@RequestParam("idlist[]") List<Integer> idlist,HttpServletResponse response) throws IOException{
		/* String[] ides = request.getParameter("idlist").split(",");	
		 
		 List<Integer> ids = new ArrayList<Integer>();
		 for(int i = 0;i < ides.length;i++){
		 	ids.add(Integer.valueOf(ides[i]));
		 }*/
		 
		/* //查询数据库中id包含的所选id的数据
		 List<Salary> list = salaryService.exportSalary(idlist);
		 response.setCharacterEncoding("utf-8");
		 byte []buffer = "员工薪资表.xls".getBytes("utf-8");
		 String downName = new String(buffer,"ISO-8859-1");
		 // filename:下载时，客户端显示的下载文件名
		 response.setHeader("Content-Disposition", "attachment;filename="+downName);
		 // 设置当前内容为二进制流
		 response.setContentType("application/octet-stream;charset=utf-8");
		
		 OutputStream out = response.getOutputStream();
		 // 通过Excel工具类，导出Excel文件
		 com.system.util.ExcelUtil.exportExcel(list, out);*/
		 
		 
		 
		 JSONObject result = new JSONObject();
			try {
				/*Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String time = sdf.format(date);
			    String excelName = "工资表"+time;
			    
			    List<Salary> list = salaryService.exportSalary(idlist);
				String[] handers = {"序号","操作人","IP地址","操作时间","操作模块","操作类型","详情"};
				// 1导入硬盘
				ExportExcelToDisk(request,handers,list, excelName);
				// 2导出的位置放入attachment表
				Attachment attachment = new Attachment();
				attachment.setAttachmentName(excelName+".xls");
				attachment.setAttachmentPath("logs/backup");
				attachment.setAttachmentTime(TimeUtil.formatTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
				attachmentService.insertAttachment(attachment);
				result.put("success", true);*/
			} catch (Exception e) {
				e.printStackTrace();
				result.put("errorMsg", "对不起，下载失败");
			}
			WriterUtil.write(response, result.toString());
	 }
	 
	 
	/* private void ExportExcelToDisk(HttpServletRequest request,String[] handers, List<Salary> list, String excleName) {
			
			try {
				HSSFWorkbook wb = new HSSFWorkbook();//创建工作簿
				HSSFSheet sheet = wb.createSheet("操作记录备份");//第一个sheet
				HSSFRow rowFirst = sheet.createRow(0);//第一个sheet第一行为标题
				rowFirst.setHeight((short) 500);
				for (int i = 0; i < handers.length; i++) {
					sheet.setColumnWidth((short) i, (short) 4000);// 设置列宽
				}
				//写标题了
				for (int i = 0; i < handers.length; i++) {
				    //获取第一行的每一个单元格
				    HSSFCell cell = rowFirst.createCell(i);
				    //往单元格里面写入值
				    cell.setCellValue(handers[i]);
				}
				for (int i = 0;i < list.size(); i++) {
				    //获取list里面存在是数据集对象
				    log = list.get(i);
				    //创建数据行
				    HSSFRow row = sheet.createRow(i+1);
				    //设置对应单元格的值
				    row.setHeight((short)400);   // 设置每行的高度
				    //"序号","操作人","IP地址","操作时间","操作模块","操作类型","详情"
				    row.createCell(0).setCellValue(i+1);
				    row.createCell(1).setCellValue(log.getUserName());
				    row.createCell(2).setCellValue(log.getIp());
				    row.createCell(3).setCellValue(log.getCreateTime());
				    row.createCell(4).setCellValue(log.getOperation());
				    row.createCell(5).setCellValue(log.getModule());
				    row.createCell(6).setCellValue(log.getContent());
				}
				//写出文件（path为文件路径含文件名）
					OutputStream os;
					os = new FileOutputStream(new File(request.getSession().getServletContext().getRealPath("/")+"logs"+File.separator+"backup"+File.separator+excleName+".xls"));
					wb.write(os);
					os.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}*/

	 
	 

	 //修改薪酬
	 @RequestMapping("/selSalaryById.action")
	 public String selSlaryById(int id){
		 Salary salary = salaryService.selSalaryById(id);
		 request.setAttribute("salary", salary);
		 request.setAttribute("entry", employeeService.selEmpById(Integer.valueOf(salary.getRegistrantId())).getUserName());
		 return EDIT;
	 }
	 
	 //保存用户修改的薪酬
	 @ResponseBody
	 @RequestMapping(value = "/updSalaryById.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	 public String updSalaryById(Salary salary){
		 return JSON.toJSONString(salaryService.updSalaryById(salary));
	 }
	 
	 //插入用户信息前跳转页面	 
	 @RequestMapping("/insertSalary.action")
	 public String insertSalary(){
		 Date date1 = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 request.setAttribute("date", sdf.format(date1));
		 request.setAttribute("deptList", departmentService.selAll());
		 return ADD;
	 }
	 
	 @RequestMapping("/selDepByRoleId.action")
	 public void selDepByRoleId(int roleId,HttpServletResponse response) throws Exception{
		 request.setCharacterEncoding("utf-8");
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
		 
		 Department department = salaryService.selDepByRoleId(roleId);
	     Gson gson = new Gson();
		 String json = gson.toJson(department);
		 response.getWriter().print(json);   
	 }
	 
	//插入用户薪资
	 @ResponseBody
	 @RequestMapping(value = "/insertSal.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	 public String insertSal(Salary salary) {
		 return JSON.toJSONString(salaryService.insertSalary(salary));
	 }
	 
	//改为提交
	 @ResponseBody
	 @RequestMapping(value = "/updSalState.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	 public String updSalState(int id,int flag){
		 return JSON.toJSONString(salaryService.updSalary(id,flag));
	 }
	 
	 //跳转审核页面 update
	 @RequestMapping("/updSalaryCheck.action")
	 public String updSalaryCheck(int id){
		 Salary salary = salaryService.selSalaryById(id);
		 request.setAttribute("salary", salary);
		 request.setAttribute("entry", employeeService.selEmpById(Integer.valueOf(salary.getRegistrantId())).getUserName());
		 return EDIT1;
	 }
	 
	 //修改审核状态为审核通过
	 @ResponseBody
	 @RequestMapping(value = "/updSalaryChecked.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	 public String updSalaryChecked(int id){
		 return JSON.toJSONString(salaryService.updSalary(id, 4));
	 }
	 
     //修改审核状态为未通过
	 @ResponseBody
	 @RequestMapping(value = "/updSalaryCheckeFaled.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	 public String updSalaryCheckeFaled(int id){
		 return JSON.toJSONString(salaryService.updSalary(id, 3));
	 }
	 
	//修改审核状态为审核中
	 @RequestMapping("/updSalaryChecking.action")
	 public void updSalaryChecking(int id){
		 salaryService.updSalary(id, 2);
	 }
	 
	 
	 //删除 (单条、多条)
	 @ResponseBody
	 @RequestMapping(value = "/delAlls.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	 public String delAll(@RequestParam("idlist[]") List<Integer> idlist){
		 return JSON.toJSONString(salaryService.deleteAll(idlist));
	 }
	 //查看详情
	 @RequestMapping("/selectById.action")
	 public String selectById(int id){
		 Salary salary = salaryService.selSalaryById(id);
		 request.setAttribute("salary", salary);
		 request.setAttribute("entry", employeeService.selEmpById(Integer.valueOf(salary.getRegistrantId())).getUserName());
		 return VIEW;
	 }
	 
}
