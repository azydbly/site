package com.controller;
/**
 * 简历管理
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
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
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.entity.ResumeManage;
import com.entity.Role;
import com.entity.RoleMenu;
import com.service.DepartmentService;
import com.service.MenuService;
import com.service.ResumeManageService;
import com.service.RoleMenuService;
import com.service.RoleService;
import com.system.util.DataTables;

@SuppressWarnings("all")
@Controller
public class ResumeManageController {
	
	String prefix = "/WEB-INF/site/";
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	ResumeManageService resumeManageService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

    public static final String LIST = "recruitment/resume/list";
    public static final String ADD = "recruitment/resume/add";
    public static final String EDIT = "recruitment/resume/edit";
    public static final String VIEW = "recruitment/resume/view";



    // 显示页面信息
	@RequestMapping("/selectResumeManage.action")
	public String selectResumeManage(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("selectResumeManage.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST;
	}
	
	//分页显示所有简历
	@ResponseBody
	@RequestMapping(value = "/showPageResume.action", produces = "application/json; charset=utf-8")
	public String showPageMenu(){
		String subSQL = "";
		subSQL += " and rm.resumeStatus in(" + 0 + "," + 6 + ")";
		subSQL += StringUtils.isEmpty(request.getParameter("positionName")) ? "" : (" and rm.positionName like '%" + request.getParameter("positionName") + "%'");
		subSQL += StringUtils.isEmpty(request.getParameter("workExperience")) ? "" : (" and rm.workExperience like '%" + request.getParameter("workExperience") + "%'");
		subSQL += StringUtils.isEmpty(request.getParameter("datemin")) ? "" : (" and rm.addDate = '" + request.getParameter("datemin") + "'");
		return JSON.toJSONString(resumeManageService.getPageResumeList(DataTables.getInstance(request,subSQL)));
	}
	
	
	// 添加时跳转页面
	@RequestMapping("/insertForward.action")
	public String insertForward(ResumeManage resumeManage){
		request.setAttribute("deptList",departmentService.selAll());
		request.setAttribute("registDate",new Date());
		request.setAttribute("recommendDate",new Date());
		return ADD;
	}
	
	
	//新增简历
	@ResponseBody
	@RequestMapping(value = "/insertResumeManage.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String insertResumeManage(ResumeManage resumeManage,MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		resumeManage.setAddDate(new Date());
		if(!"".equals(request.getParameter("uploadfile"))){
			// 上传附件
			String username = request.getParameter("username");
			// 获取上传文件的保存目录
			String pathName = request.getSession().getServletContext().getRealPath(prefix + "upload/简历/" + username);
			File path = new File(pathName);
			// 如果目录不存在，则创建该目录
			if (!path.exists()) {
				path.mkdirs();
			}
			String urlFile = file.getOriginalFilename();
			String url = username + "/" + urlFile;
			// 创建新文件的对象
			File newFile = new File(path, urlFile);
			// 将上传的文件保存到新文件中
			file.transferTo(newFile);
			resumeManage.setUrl(url);
			resumeManage.setUrlFile(urlFile);
		}
		resumeManage.setLeadership(roleService.selById(Integer.valueOf(resumeManage.getPositionCode())).getLeadership());
		request.setAttribute("resumeManage",resumeManage);
		return JSON.toJSONString(resumeManageService.insertResumeManage(resumeManage));
	}

	
	// 更改简历状态 ,推荐面试状态
	@ResponseBody
	@RequestMapping(value = "/changeResumeStatus.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String changeResumeStatus(int id,int flag){
		return JSON.toJSONString(resumeManageService.updChangeStatusToOne(id,flag));
	}

	// 修改时跳转页面
	@RequestMapping("/updateForward.action")
	public String updateForward(int id){
		ResumeManage resumeManage = resumeManageService.selectResumeManageById(id);
		request.setAttribute("roleList", roleService.selAll());
		request.setAttribute("deptList",departmentService.selAll());
		request.setAttribute("roleNum",roleService.seelctRoleById(Integer.valueOf(resumeManage.getPositionCode())));
		request.setAttribute("resumeManage",resumeManage );
		return EDIT;
	}
		
	
	// 保存修改处理，保存简历
	@ResponseBody
	@RequestMapping(value = "/updateResumeManage.action",method = RequestMethod.POST, produces = "appliaction/json; charset=utf-8")
	public String updateResumeManage(ResumeManage resumeManage,MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String again = request.getParameter("again");
		String oldUrl = request.getParameter("oldUrl");
		String oldUserName = request.getParameter("oldUserName");
		String oldUrlFile = request.getParameter("oldUrlFile");
		resumeManage.setLeadership(roleService.selById(Integer.valueOf(resumeManage.getPositionCode())).getLeadership());
		if("是".equals(again)){
			if(oldUrl != null || oldUrl != ""){
				//删除旧的文件及文件夹
				File oldf = new File(request.getSession().getServletContext().getRealPath(prefix + "upload/简历/" + oldUserName),oldUrlFile);//删除旧的文件
				oldf.delete();
				
				File o = new File(request.getSession().getServletContext().getRealPath(prefix + "upload/简历/"),oldUserName);//删除旧的文件夹
				o.delete();
			}
			if(!"".equals(request.getParameter("uploadfile"))){
				// 上传附件
				String username = request.getParameter("username");
				// 获取上传文件的保存目录
				String pathName = request.getSession().getServletContext().getRealPath(prefix + "upload/简历/" + username);
				File path = new File(pathName);
				// 如果目录不存在，则创建该目录
				if (!path.exists()) {
					path.mkdirs();
				}
				String urlFile = file.getOriginalFilename();
				String url = username + "/" + urlFile;
				// 创建新文件的对象
				File newFile = new File(path, urlFile);
				// 将上传的文件保存到新文件中
				file.transferTo(newFile);
				resumeManage.setUrl(url);
				resumeManage.setUrlFile(urlFile);
			}
			return JSON.toJSONString(resumeManageService.updateResumeManage(resumeManage));
		}else{
			return JSON.toJSONString(resumeManageService.updateResumeManageNoFile(resumeManage));
		}
	}
	
	// 删除简历（单条、多条）
	@ResponseBody
	@RequestMapping(value = "/deleteSomeResumeManage.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String deleteSomeResumeManage(@RequestParam("idlist[]") List<Integer> idlist){
		return JSON.toJSONString(resumeManageService.deleteSomeResumeManage(idlist));
	}
	

	// 显示详情
	@RequestMapping("/selectResumeManageById.action")
	public String selectResumeManageById(int id){
		ResumeManage resumeManage = resumeManageService.selectResumeManageById(id);
		if(resumeManage == null){
			return "selectResumeManage.action";
		}else {
			request.setAttribute("resumeManage",resumeManage );
			return VIEW;
		}
	}
	
	// 根据职位名称查询对象信息
	@ResponseBody
	@RequestMapping("/selectRtypeByRname.action")
	public Role selectRoleByRname(String rname) {
		Role role = resumeManageService.selectRoleByRname(rname);
		return role;
	}
	
	// 下载附件
	@RequestMapping("/download.action")
	public void download(String url,String urlFile,HttpServletResponse response) throws Exception{
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		
		response.setHeader("Content-Disposition", "attachment;fileName=" + new String(urlFile.getBytes("gb2312"), "ISO8859-1"));
		// 获取文件目录
		String pathname = request.getSession().getServletContext().getRealPath(prefix + "upload/简历/" + url);
		InputStream in = null;
		
		//创建文件输出流
		OutputStream out = response.getOutputStream();
		// 创建文件输入流，读取下载的文件
		in = new FileInputStream(pathname);
		byte[] buffer = new byte[2048];
		int i = 0;
		while ((i = in.read(buffer)) != -1) {
			out.write(buffer);
		}
		out.flush();
		out.close();
		in.close();
	}
	
	
	// 移出简历
	@ResponseBody
	@RequestMapping("/removeResumeManage.action")
	public int removeResumeManage(int id,String urlFile,String username){
		
		String oldPathName = request.getSession().getServletContext().getRealPath(prefix + "upload/简历/" + username);
		File file = new File(oldPathName,urlFile);
		if(file.exists()){
			file.delete();
		}
		
		String oldPathNameJia = request.getSession().getServletContext().getRealPath(prefix + "upload/简历/");
		File oldf = new File(oldPathNameJia,username);//删除旧的文件夹
		if(oldf.exists()){
			oldf.delete();
		}
		
		return resumeManageService.removeResumeManage(id);
	}
}
