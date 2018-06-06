package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Role;
import com.entity.RoleMenu;
import com.google.gson.Gson;
import com.service.DepartmentService;
import com.service.EmployeeService;
import com.service.MenuService;
import com.service.RoleMenuService;
import com.service.RoleService;
import com.system.util.DataTables;

@Controller
public class RoleController {
	
	@Autowired
	HttpServletRequest request;// 请求

	@Autowired
	RoleService roleservice;
	
	@Autowired
	MenuService menuservice;
	
	@Autowired
	DepartmentService departmentservice;
	
	@Autowired
	EmployeeService employeeservice;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	public static final String LIST = "departmentManagement/role/list";
	public static final String ADD = "departmentManagement/role/add";
	public static final String EDIT = "departmentManagement/role/edit";
	public static final String VIEW = "departmentManagement/role/view";


	//显示所有角色 页面 list
	@RequestMapping("/showRole.action")
	public String selAllLikePage(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuservice.selectForUrl("showRole.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST;
	}
	
	
	//分页显示所有角色
	@ResponseBody
	@RequestMapping(value = "/showPageRole.action", produces = "application/json; charset=utf-8")
	public String showPageMenu(@RequestParam(value="state",required=false)String state){
		String subSQL = "";
		if (!StringUtils.isEmpty(request.getParameter("rname"))) {
			subSQL += "and r.name like '%" + request.getParameter("rname") + "%'";
		}
		subSQL += StringUtils.isEmpty(state) ? "" : ("and r.state=" + state);
		return JSON.toJSONString(roleservice.getPageRoleList(DataTables.getInstance(request,subSQL)));
	}
	
	//通过id查询角色信息
	@RequestMapping("/selRoleOnId.action")
	public String selRoleById(int id){
		Role role = roleservice.selById(id);
		request.setAttribute("role", role);
		request.setAttribute("dname", departmentservice.selDept(role.getDeptId()).getName());
		return VIEW;
	}
	
	//跳转到添加页面 add
	@RequestMapping("/toAddRolePage.action")
	public String toAddPage(){
		Date date1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		request.setAttribute("id", roleservice.selMaxId() + 1);
		request.setAttribute("rnum", roleservice.selMaxNum() + 1);
		request.setAttribute("createDate", sdf.format(date1));
		request.setAttribute("menuList", menuservice.selAllMenu());
		request.setAttribute("deptList", departmentservice.selAll());
		return ADD;
	}
	
	//添加角色
	@ResponseBody
	@RequestMapping(value = "/insRole.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String insRole(Role role){
		return JSON.toJSONString(roleservice.insRole(role));
	}
	
	
	//跳转到更新页面
	@RequestMapping("/toUpdRolePage.action")
	public String toUpdPage(int id){
		Role role = roleservice.selById(id);
		request.setAttribute("role", role);
		request.setAttribute("deptName", roleservice.seelctRoleById(role.getLeadership()).getName());
		request.setAttribute("deptList", departmentservice.selAll());
		return EDIT;
	}
	
	//更新用户
	@ResponseBody
	@RequestMapping(value = "/updRole.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String updRole(Role role){
		return JSON.toJSONString(roleservice.updRole(role));
	}
	
	//停用、启用
	@ResponseBody
	@RequestMapping(value = "/updRoleState.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String updRoleState(int id,int flag){
		Role role = new Role();
		role.setId(id);
		role.setState(flag);
		return JSON.toJSONString(roleservice.updRoleState(role));
	}
	
	
	//删除角色（单条、多条）
	@ResponseBody
	@RequestMapping(value = "/delRoleAll.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String delRoleAll(@RequestParam("idlist[]") List<Integer> idlist){
		return JSON.toJSONString(roleservice.delAll(idlist));
	}
	
	
	//二级联动添加用户时，选择部门查找部门职位 seelctDept
	@ResponseBody
	@RequestMapping(value="/ajaxDeptment.action",produces = "text/html;charset=UTF-8")
	public String ajaxDeptment(String departmentId){
    	List<Role> list = roleservice.seelctDept(Integer.valueOf(departmentId));
		Gson gson = new Gson();
		String json = gson.toJson(list);
		return json;
	}
	
	//添加位置时获取上级部门
	@ResponseBody
	@RequestMapping(value="/ajaxLeadership.action",produces = "text/html;charset=UTF-8")
	public String ajaxledership(String type,String deptId){
		Map<String,Object> map = new HashMap<String, Object>();	
		map.put("ttype", Integer.valueOf(type));
		map.put("deptId", Integer.valueOf(deptId));
		List<Role> list =  roleservice.seelLeadership(map);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		return json;
	}
	
}