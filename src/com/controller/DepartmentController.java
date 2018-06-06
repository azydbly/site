package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Department;
import com.entity.RoleMenu;
import com.entity.ZtreeNode;
import com.service.DepartmentService;
import com.service.MenuService;
import com.service.RoleMenuService;

@Controller
public class DepartmentController {
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	public static final String LIST = "departmentManagement/department/list";
	public static final String ADD = "departmentManagement/department/add";
	public static final String EDIT = "departmentManagement/department/edit";

	//显示所有部门
	@RequestMapping("/showDept.action")
	public String selAll(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("showDept.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		List<Department> deptList = departmentService.selAll();
		request.setAttribute("deptList", deptList);
		return LIST;
	}
	
	//新增部门页面
	@RequestMapping("/selAlldept.action")
	public String selAllDept(){
		Date date1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String createDate = sdf.format(date1);
		List<Department> deptList = departmentService.selAll();
		int deptNum = departmentService.selMaxNum() + 1;
		request.setAttribute("deptNum",deptNum);
		request.setAttribute("createDate", createDate);
		request.setAttribute("deptList", deptList);
		return ADD;
	}
	
	//新增部门信息
	@RequestMapping("/insertDept.action")
	public void insertDept(Department department,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		int result = departmentService.insDept(department);
		if(result > 0){
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}
	
	//修改部门信息页面
	@RequestMapping("/toUpdatePage.action")
	public String toUpdatePage(int id){
		List<Department> deptList = departmentService.selAll();
		Department department = departmentService.selDept(id);
		request.setAttribute("department", department);
		request.setAttribute("deptList", deptList);
		return EDIT;
	}
	
	//修改部门信息
	@RequestMapping("/updateDept.action")
	public void updateDept(Department department,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(departmentService.updDept(department) > 0){
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}
	
	//删除部门
	@ResponseBody
	@RequestMapping(value = "/delDept.action", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String delDept(int deptNum,HttpServletResponse response) throws Exception{
		return JSON.toJSONString(departmentService.delDept(deptNum));
		
	}
	
	//ztree加载部门名称
	@ResponseBody
	@RequestMapping(value="/deployNews.action",produces="text/html;charset=UTF-8")
	public Object deployNews(){
		List<Department> menuList = departmentService.selAll();
		List<ZtreeNode> listTree = new ArrayList<ZtreeNode>();
		for(Department m : menuList){
			ZtreeNode ztree = new ZtreeNode();
			ztree.setId(String.valueOf(m.getDeptNum()));
			ztree.setpId(String.valueOf(m.getPid()));
			ztree.setName(m.getFullName());
			if(m.getPid() == 0){
				ztree.setOpen(true);
			}
			listTree.add(ztree);
		}
		JSONArray json = JSONArray.fromObject(listTree);
	    String jsonString = json.toString();
		return jsonString;
	}
	
	//部门全名称重复验证
	@RequestMapping("/selDeparForFullname.action")
	public void selDeparForFullname(HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String fullName = request.getParameter("fullName");
		String id = request.getParameter("id");
		if(id == null){
			Department department = departmentService.selDepartmentByAdd(fullName);
			if(department == null){
				response.getWriter().print("true");
			}else{
				response.getWriter().print("false");
			}
		}else{
			Department department = departmentService.selDepartmentByUpdate(fullName, Integer.valueOf(id));
			if(department == null){
				response.getWriter().print("true");
			}else{
				response.getWriter().print("false");
			}
		}
	}
}
