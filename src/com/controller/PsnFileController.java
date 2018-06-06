package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSON;
import com.entity.Employee;
import com.entity.PsnFile;
import com.entity.RoleMenu;
import com.google.gson.Gson;
import com.system.util.DataTables;

/**
 * 类名称：PsnFileController
 * 类描述：人事档案控制层
 * 作者： yanp
 * 日期：2017年11月28日 时间：下午4:09:49
 */
@Controller
public class PsnFileController {
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	PsnFileService pfService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	SalaryService salaryService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	@Autowired
	private AreasService areasService;
	
	//文件上传地址
	String prefix = "/WEB-INF/site/";

	public static final String LIST = "personnel/archives/list";
	public static final String LIST2 = "personnel/approval/list";
	public static final String LIST3 = "personnel/delete/list";
	public static final String ADD = "personnel/archives/add";
	public static final String EDIT = "personnel/archives/edit";
	public static final String VIEW = "personnel/archives/view";



	//进入显示页面  list 页面
	@RequestMapping("/showPsnFile1.action")
	public String showPsnFile1(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showPsnFile1.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST;
	}
	
	//进入显示页面  list 页面
	@RequestMapping("/showPsnFile2.action")
	public String showPsnFile2(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showPsnFile2.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST2;
	}
	
	//进入显示页面  list 页面
	@RequestMapping("/showPsnFile3.action")
	public String showPsnFile3(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showPsnFile3.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST3;
	}
		
	
	//分页显示所有档案
	@ResponseBody
	@RequestMapping(value = "/showPsnPage.action", produces = "application/json; charset=utf-8")
	public String showPsnPage(){
		String subSQL = "";
		if (!StringUtils.isEmpty(request.getParameter("checkState"))) {
			subSQL += " and p.checkState = " + request.getParameter("checkState");
		}
		if (!StringUtils.isEmpty(request.getParameter("psnFileState"))) {
			subSQL += " and p.state = " + request.getParameter("psnFileState");
		}
		if (!StringUtils.isEmpty(request.getParameter("datemin"))) {
			subSQL += " and p.createDate >= '" + request.getParameter("datemin") + "'";
		}
		if (!StringUtils.isEmpty(request.getParameter("toDate"))) {
			subSQL += " and p.createDate <= '" + request.getParameter("toDate") + "'";
		}
		return JSON.toJSONString(pfService.showPsnPage(DataTables.getInstance(request,subSQL)));
	}
	
	
	//跳转至档案登记页面 add
	@RequestMapping("/toInsPage.action")
	public String toInsPage(){
		request.setAttribute("areas", areasService.getProvince());
		request.setAttribute("fileNum", pfService.selMaxNum() + 1);
		request.setAttribute("departments", pfService.selAllDep());
		return ADD;
	}
	
	//保存新增记录
	@ResponseBody
	@RequestMapping(value = "/insPsnFile.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String insPsnFile(MultipartFile file,PsnFile psnfile,HttpServletRequest request) throws IOException{
		psnfile.setCreateDate(new Date());
		
		if(!"".equals(request.getParameter("uploadfile"))){
			String fileNum = request.getParameter("fileNum");
			// 1.得到要上传的路径
			String realPath = request.getServletContext().getRealPath(prefix + "upload/档案资料/" + fileNum);
			File path = new File(realPath);
			// 如果目录不存在，则创建该目录!
			if (!path.exists()) {
				path.mkdirs();
			}
			// 2.要上传的文件名字
			String fileName = file.getOriginalFilename();
			// 3.构建要上传的文件IO流
			File f = new File(realPath, fileName);
			// 4.上传文件
			file.transferTo(f);
			String url = fileNum +  "/" + fileName;
			psnfile.setFileLocation(fileName);
			psnfile.setUrl(url);
		}
		return JSON.toJSONString(pfService.insPsnFile(psnfile));
	}
	
	
	//跳转至更新页面  edit
	@RequestMapping("/toUpdate.action")
	public String toUpdate(int id){
		request.setAttribute("sltFile", pfService.selFileById(id));
		return EDIT;
	}
	
	
	// 保存更新
	@ResponseBody
	@RequestMapping(value = "/saveUpdate.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String saveUpdate(MultipartFile file,PsnFile psnFile,HttpServletRequest request) throws IOException{
		psnFile.setCreateDate(new Date());
		String fileNum = request.getParameter("fileNum");
		String oldFileLocation = request.getParameter("oldFileLocation");
		//重新上传附件
		if("是".equals(request.getParameter("again"))){
			if(oldFileLocation != null || oldFileLocation != ""){
				//删除文件
				String oldPathName = request.getSession().getServletContext().getRealPath(prefix + "upload/档案资料/" + fileNum);
				File f = new File(oldPathName,oldFileLocation);
				f.delete();
			}
			if (!"".equals(request.getParameter("uploadfile"))) {
				String path = request.getServletContext().getRealPath(prefix + "upload/档案资料/" + fileNum);
				File fileLocation = new File(path);
				// 如果目录不存在，则创建该目录!
				if (!fileLocation.exists()) {
					fileLocation.mkdirs();
				}
				// 2.要上传的文件名字
				String fileName = file.getOriginalFilename();
				String url = fileNum + "/" + fileName;
				// 3.构建要上传的文件IO流
				File ff = new File(path, fileName);
				// 4.上传文件
				file.transferTo(ff);
				
				psnFile.setFileLocation(fileName);
				psnFile.setUrl(url);
			}
			return JSON.toJSONString(pfService.updPsnfile(psnFile));
		}else{
			return JSON.toJSONString(pfService.updPsnfileNoFile(psnFile));
		}
	}
	
	// 删除一条记录
	@ResponseBody
	@RequestMapping(value = "/deleteOne.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String deleteOne(@RequestParam("idlist[]") List<Integer> idlist){
		return JSON.toJSONString(pfService.delById(idlist));
	}
	
	//起草状态删除，从数据库中删除
	@ResponseBody
	@RequestMapping(value = "/deleteOneById.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String deleteOneById(@RequestParam("idlist[]") List<Integer> idlist){
		return JSON.toJSONString(pfService.deldteById(idlist));
	}
	
	
	//分页显示所有档案
	@ResponseBody
	@RequestMapping(value = "/showPsnPageDai.action", produces = "application/json; charset=utf-8")
	public String showPsnPageDai(){
		String subSQL = "";
		subSQL  += " and (p.checkState = 2 or p.checkState = 6)";
		if (!StringUtils.isEmpty(request.getParameter("datemin"))) {
			subSQL += " and p.createDate >= '" + request.getParameter("datemin") + "'";
		}
		if (!StringUtils.isEmpty(request.getParameter("toDate"))) {
			subSQL += " and p.createDate <= '" + request.getParameter("toDate") + "'";
		}
		return JSON.toJSONString(pfService.showPsnPage(DataTables.getInstance(request,subSQL)));
	}
	
	//跳转至审批页面
	@RequestMapping("/toCheckPage.action")
	public String toCheckPage(int id){
		request.setAttribute("sltFile", pfService.selFileById(id));
		return "personnel/approval/docheck";
	}
	
	//审批与驳回
	@ResponseBody
	@RequestMapping(value = "/docheck.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String doCheck(int fileId,int checkState){
		return JSON.toJSONString(pfService.updateCheck(fileId,checkState));
	};
	
	
	//跳转至详情页面
	@RequestMapping("/seeInfo.action")
	public String seeInfo(int id){
		PsnFile psnFile = pfService.selFileById(id);
		request.setAttribute("sltFile", psnFile);
		request.setAttribute("checkMan", employeeService.selById(Integer.valueOf(psnFile.getCheckMan())).getUserName());
		request.setAttribute("salary", salaryService.selById(Integer.valueOf(psnFile.getEmpName())));
		return VIEW;
	}
	
	//添加档案时，通过职位选择员工姓名
	@ResponseBody
	@RequestMapping(value="/ajaxPsnFile.action",produces = "text/html;charset=UTF-8")
	public String ajaxDeptment(String roleId){
		List<Employee> empList = employeeService.selectRoleNameForPsnFile(Integer.valueOf(roleId));
		Gson gson = new Gson();
		String json = gson.toJson(empList);
		return json;
	}
	

	/**
	 * 下载附件
	 */
	@RequestMapping("/downAttach.action")
	public void downAttach(String url,String fileName,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes("gb2312"), "ISO8859-1"));
		
		InputStream in = new FileInputStream(request.getServletContext().getRealPath(prefix + "upload/档案资料/") + url);
		//2048指可以存储 2048个字的东西，多了报  溢出  异常
 		byte[] bytes = new byte[2048];
		int len = 0;
		ServletOutputStream out = response.getOutputStream();
		while((len = in.read(bytes)) != -1){
			out.write(bytes,0,len);
		}
		out.flush();
		out.close();
		in.close();
	}
	
	
	/**
	 * 移出附件
	 */
	@ResponseBody
	@RequestMapping("/removeFile.action")
	public int removeAttachment(int fileNum,String fileLocation){
		String oldPathName = request.getSession().getServletContext().getRealPath(prefix + "upload/档案资料/" + fileNum);
		File file = new File(oldPathName,fileLocation);
		if(file.exists()){
			file.delete();
		}
		
		String oldPathNameJia = request.getSession().getServletContext().getRealPath(prefix + "upload/档案资料/");
		File oldf = new File(oldPathNameJia,String.valueOf(fileNum));//删除旧的文件夹
		if(oldf.exists()){
			oldf.delete();
		}
		return pfService.delAttach(fileNum);
	}
	
	// ----------转化日期格式-----------------
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); // true:允许输入空值，false
	}
}
