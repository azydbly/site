package com.controller;
/**
 * 录用管理
 */

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
import com.entity.ResumeManage;
import com.entity.RoleMenu;
import com.service.MenuService;
import com.service.ResumeManageService;
import com.service.RoleMenuService;
import com.system.util.DataTables;

@Controller
public class HireController {
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	ResumeManageService resumeManageService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	public static final String LIST = "recruitment/employment/list";
	public static final String ADD = "recruitment/employment/add";


	// 显示页面信息
	@RequestMapping("/selectHire.action")
	public String selectResumeManage(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("selectHire.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST;
	}
	
	//分页录用结果
	@ResponseBody
	@RequestMapping(value = "/showPageHire.action", produces = "application/json; charset=utf-8")
	public String showPageMenu(@RequestParam(value="resumeStatus",required=false)String resumeStatus){
		String subSQL = "";
		subSQL += StringUtils.isEmpty(resumeStatus) ? ("and rm.resumeStatus in (" + 4 + "," + 5 + ")") : (" and rm.resumeStatus=" + resumeStatus);
		subSQL += StringUtils.isEmpty(request.getParameter("positionName")) ? "" : (" and rm.positionName like '%" + request.getParameter("positionName") + "%'");
		subSQL += StringUtils.isEmpty(request.getParameter("workExperience")) ? "" : (" and rm.workExperience like '%" + request.getParameter("workExperience") + "%'");
		subSQL += StringUtils.isEmpty(request.getParameter("datemin")) ? "" : (" and rm.registDate = '" + request.getParameter("datemin") + "'");
		return JSON.toJSONString(resumeManageService.getPageResumeList(DataTables.getInstance(request,subSQL)));
	}
	
	// 跳转面试结果登记
	@RequestMapping("/forwardHire.action")
	public String forwardHire(int id){
		// 查询简历信息
		ResumeManage resumeManage = resumeManageService.selectResumeManageById(id);
		resumeManage.setRecommendDateThird(new Date());
		request.setAttribute("resumeManage",resumeManage );
		return ADD;
	}

	// 保存登记
	@ResponseBody
	@RequestMapping(value = "/saveHire.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String saveHire(ResumeManage resumeManage){
		return JSON.toJSONString(resumeManageService.updateResumeManageResult(resumeManage));
	}
}
