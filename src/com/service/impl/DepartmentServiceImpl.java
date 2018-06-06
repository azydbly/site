package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Department;
import com.mapper.DepartmentMapper;
import com.mapper.RoleMapper;
import com.service.DepartmentService;
import com.system.util.RequestStatus;
@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentmapper; 
	
	@Autowired
	private RoleMapper roleMapper; 
	
	
	public DepartmentMapper getDepartmentmapper() {
		return departmentmapper;
	}

	public void setDepartmentmapper(DepartmentMapper departmentmapper) {
		this.departmentmapper = departmentmapper;
	}
	
	
	@Override
	public List<Department> selAll() {
		return departmentmapper.selAll();
	}

	@Override
	public Department selDept(int id) {
		return departmentmapper.selDept(id);
	}

	@Override
	public int updDept(Department department) {
		return departmentmapper.updDept(department);
	}

	@Override
	public Map<String, Object> delDept(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(roleMapper.selectAllRoleForDept(id) < 1){
			if(departmentmapper.delDept(id) > 0){
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
	public int insDept(Department department) {
		return departmentmapper.insDept(department);
	}

	@Override
	public List<Department> selAllDep() {
		return departmentmapper.selAllDep();
	}

	@Override
	public int selMaxNum() {
		return departmentmapper.selMaxNum();
	}

	@Override
	public Department selDepartmentByAdd(String fullName) {
		return departmentmapper.selDepartmentByAdd(fullName);
	}

	@Override
	public Department selDepartmentByUpdate(String fullName, int id) {
		return departmentmapper.selDepartmentByUpdate(fullName, id);
	}
	
}
