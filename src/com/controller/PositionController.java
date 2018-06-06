package com.controller;

import java.io.IOException;
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
import com.entity.Position;
import com.entity.Role;
import com.entity.RoleMenu;
import com.google.gson.Gson;
import com.service.MenuService;
import com.service.PositionService;
import com.service.RoleMenuService;
import com.system.util.DataTables;

@Controller
public class PositionController {
	
	@Autowired
	HttpServletRequest request;// 请求
	
	@Autowired
	PositionService positionService;
	
	@Autowired		
	private MenuService menuService;
	
	@Autowired		
	private RoleMenuService roleMenuService;

	public static final String LIST = "recruitment/role/list";
	public static final String ADD = "recruitment/role/add";
	public static final String EDIT = "recruitment/role/edit";
	public static final String VIEW = "recruitment/role/view";


	// 显示页面信息，职位
	@RequestMapping("/selectPosition.action")
	public String selectPosition(){
		List<RoleMenu> roleMenuId = roleMenuService.selectByRoleIdMenuId(Integer.valueOf(request.getParameter("roleId")), menuService.selectForUrl("selectPosition.action"));
		request.setAttribute("roleMenuId", roleMenuId);
		return LIST;
	}
	
	//分页显示所有招聘职位
	@ResponseBody
	@RequestMapping(value = "/showPagePosition.action", produces = "application/json; charset=utf-8")
	public String showPageMenu(){
		String subSQL = "";
		if (!StringUtils.isEmpty(request.getParameter("positionType"))) {
			subSQL += "and p.positionType = '" + request.getParameter("positionType") + "'";
		}
		if (!StringUtils.isEmpty(request.getParameter("datemin"))) {
			subSQL += "and p.registDate >= '" + request.getParameter("datemin") + "'";
		}
		if (!StringUtils.isEmpty(request.getParameter("datemax"))) {
			subSQL += "and p.stopDate <= '" + request.getParameter("datemax") + "'";
		}
		return JSON.toJSONString(positionService.getPagePositionList(DataTables.getInstance(request,subSQL)));
	}
	
	// 根据id删除（状态删除：修改isdelete）
	@ResponseBody
	@RequestMapping(value = "/deletePosition.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String deletePosition(@RequestParam("idlist[]") List<Integer> idlist){
		return JSON.toJSONString(positionService.deletePosition(idlist));
	}
	
	//进入添加页面
	@RequestMapping("/forwardPosition.action")
	public String toInsertPosition(){
		// 查询部门id和名称
		request.setAttribute("departmentList",positionService.selectDeptIdAndName());
		request.setAttribute("registDate",new Date());
		request.setAttribute("recommendDate",new Date() );
		return ADD;
	}
	
	//进入更新页面
	@RequestMapping("/updatedPosition.action")
	public String updatedPosition(){
		// 查询部门id和名称
		request.setAttribute("departmentList",positionService.selectDeptIdAndName());
		Position position = positionService.selectPositionById(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("position",position);
		// 查询role表所有信息
		request.setAttribute("roleList", positionService.selectRoleByDepid(position.getDeptId()));
		return EDIT;
	}
	
	// 查看职位详情
	@RequestMapping("/selectPositionById.action")
	public String selectPositionById(int id) {
		Position position = positionService.selectPositionById(id);
		request.setAttribute("position", position);
		return VIEW;
	}
	
	// 发布职位，保存添加
	@ResponseBody
	@RequestMapping(value = "/insertPosition.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String insertPosition(Position position){
		position.setAddDate(new Date());
		return JSON.toJSONString(positionService.insertPosition(position));
	}
	
	// 更改职位信息，保存更改
	@ResponseBody
	@RequestMapping(value = "/savePosition.action", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String savePosition(Position position){
		position.setAddDate(new Date());
		return JSON.toJSONString(positionService.savePosition(position));
	}
	
	//选择角色显示角色的类型跟编号
	@RequestMapping("/selRoleById.action")
	public void selRoleById(String roleId, HttpServletResponse response) throws IOException{
		Role role=positionService.selRoleById(roleId);
		Gson gson=new Gson();
		String json=gson.toJson(role);
		response.getWriter().print(json);
	}
}
