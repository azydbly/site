package com.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.OperationService;
import com.service.RoleMenuService;

@Controller
public class RoleMenuController {
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	private RoleMenuService rolemenuService;
	
	@Autowired
	OperationService operationService;

	public static final String ROLEMENU = "departmentManagement/role/roleMenu";


	//通过职位id  获取权限列表
	@RequestMapping("/deploy.action")
	public String selAll(int roleId){
		request.setAttribute("roleId", roleId);		
		return ROLEMENU;
	}
	
	//通过职位id  获取权限列表
	@RequestMapping("/savetree.action")
	public void insTreeSysMenu(int roleId,String menus,String operationId,PrintWriter out,HttpServletResponse response) throws Exception{
		//删除权限
		rolemenuService.delRoleMenu(roleId);
		//获取所有权限
		String[] menusId = menus.split(",");
		String[] operation = operationId.split(",");
		for(int i = 0; i < operation.length; i++){
			rolemenuService.insRoleMenu(roleId,Integer.valueOf(operation[i]),0);
		}
		for(int i = 0; i < menusId.length; i++){
			if(Integer.parseInt(menusId[i]) > 100000){
				rolemenuService.insRoleMenu(roleId,operationService.selectById(Integer.parseInt(menusId[i])).getPid(),Integer.valueOf(menusId[i]));
			}else{
				rolemenuService.insRoleMenu(roleId,Integer.valueOf(menusId[i]),0);
			}
		}
		/*out.print("SUCCESS");
    	out.close();*/
		response.getWriter().print("true");
	}
	
	//给角色分配权限时，写入数据
	@RequestMapping("/treeJson.action")
	public void treeJson(int roleId,HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String json = rolemenuService.geMenusTreeToJson(roleId);
		out.write(json);
	}
}
