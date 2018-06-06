package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.entity.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.RoleMapper;
import com.service.EmployeeService;
import com.service.RoleMenuService;
import com.service.RoleService;
import com.system.util.DataTables;
import com.system.util.RequestStatus;

@Service
public class RoleServicrImpl implements RoleService {
	
	@Autowired
	private RoleMapper rolemapper;
	
	@Autowired
	private EmployeeService employeeservice;
	
	@Autowired
	private RoleMenuService roleMenuService;

	@Override
	public Role selById(int id) {
		return rolemapper.selById(id);
	}

	@Override
	public Map<String, Object> updRole(Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (rolemapper.updRole(role) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}


	@Override
	public Map<String, Object> insRole(Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (rolemapper.insRole(role) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
		
	}

	@Override
	public int selMaxId() {
		return rolemapper.selMaxId();
	}

	@Override
	public int selMaxNum() {
		return rolemapper.selMaxNum();
	}

	public RoleMapper getRolemapper() {
		return rolemapper;
	}

	public void setRolemapper(RoleMapper rolemapper) {
		this.rolemapper = rolemapper;
	}

	@Override
	public List<Role> selAll() {
		return rolemapper.selAll();
	}

	@Override
	public List<Role> seelctDept(int deptId) {
		return rolemapper.seelctDept(deptId);
	}

	@Override
	public Role seelctRoleById(int number) {
		return rolemapper.seelctRoleById(number);
	}

	@Override
	public List<Role> seelLeadership(Map<String,Object> map) {
		return rolemapper.seelLeadership(map);
	}

	@Override
	public int selMinLeadership() {
		return rolemapper.selMinLeadership();
	}

	@Override
	public Map<String, Object> updRoleState(Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (rolemapper.updRoleState(role) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public int selectAllRoleForDept(int deptId) {
		return rolemapper.selectAllRoleForDept(deptId);
	}

	@Override
	public DataTables getPageRoleList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getPageNum(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("convert(department.fullName using gbk) asc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			PageHelper.orderBy(dataTables.getColumn() + " " + dataTables.getOrder());
		}
		
		PageInfo<Role> pageInfo = new PageInfo<Role>(rolemapper.getPageRoleList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<Object>());
		return dataTables;
	}

	@Override
	public Map<String, Object> delAll(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(employeeservice.selectCountRoleName(idlist) < 1){
			if (rolemapper.delAll(idlist) > 0) {
				roleMenuService.delByRoleId(idlist);
				map.put("status", RequestStatus.SUCCESS);
			}else{
				map.put("status", RequestStatus.FAIL);
			}
		}else{
			map.put("status", RequestStatus.EXIS);
		}
		return map;
	}

	@Override
	public List<Role> selectForAdmin() {
		return rolemapper.selectForAdmin();
	}
}
