package com.controller;
/**
 * 面试管理
 */

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Employee;
import com.entity.ResumeManage;
import com.entity.RoleMenu;
import com.service.MenuService;
import com.service.ResumeManageService;
import com.service.RoleMenuService;
import com.service.RoleService;
import com.system.util.DataTables;

@Controller
public class InterviewController {
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	ResumeManageService resumeManageService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	public static final String LIST = "recruitment/interview/list";
	public static final String ADD = "recruitment/interview/add";
	public static final String ADD2 = "recruitment/interview/add2";
	public static final String ADD3 = "recruitment/interview/add3";


	// 显示页面信息
	@RequestMapping("/selectInterview.action")
	public String selectResumeManage(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("selectInterview.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST;
	}
	
	//分页显示所有面试
	@ResponseBody
	@RequestMapping(value = "/showPageInterview.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String showPageMenu(HttpSession session,@RequestParam(value="resumeStatus",required=false)String resumeStatus){
		int leadership = ((Employee) session.getAttribute("employee")).getRoleId();
		String subSQL = "";
		//登录者是部门主管
		if(roleService.seelctRoleById(leadership).getLeadership() != roleService.selMinLeadership()){
			String lead = String.valueOf(leadership);
			subSQL += StringUtils.isEmpty(lead) ? "" : (" and rm.leadership=" + lead);
		}else{}
		subSQL += StringUtils.isEmpty(resumeStatus) ? ("and rm.resumeStatus in(" + 1 + "," + 2 + "," + 3 + ")") : (" and rm.resumeStatus=" + resumeStatus);
		subSQL += StringUtils.isEmpty(request.getParameter("positionName")) ? "" : (" and rm.positionName like '%" + request.getParameter("positionName") + "%'");
		subSQL += StringUtils.isEmpty(request.getParameter("workExperience")) ? "" : (" and rm.workExperience like '%" + request.getParameter("workExperience") + "%'");
		subSQL += StringUtils.isEmpty(request.getParameter("datemin")) ? "" : (" and rm.registDate = '" + request.getParameter("datemin") + "'");
		return JSON.toJSONString(resumeManageService.getPageResumeList(DataTables.getInstance(request,subSQL)));
	}
	
	// 跳转登记页面
	@RequestMapping("/forwardInterview.action")
	public String forwardInterview(int id,int flag){
		request.setAttribute("resumeManage",resumeManageService.selectResumeManageById(id));
		request.setAttribute("resumeManageDate",new Date());
		if (flag == 1) {
			return ADD;
		}else if (flag == 2) {
			return ADD2;
		}else {
			return ADD3;
		}
	}
	
	// 保存面试结果
	@ResponseBody
	@RequestMapping(value = "/saveInterview.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String saveInterview(ResumeManage resumeManage,int save){
		if (save == 1) {
			return JSON.toJSONString(resumeManageService.updateResumeManageFirst(resumeManage));
		}else if (save == 2) {
			return JSON.toJSONString(resumeManageService.updateResumeManageSecond(resumeManage));
		}else {
			return JSON.toJSONString(resumeManageService.updateResumeManageThird(resumeManage));
		}
	}
}	
