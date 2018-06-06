package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Department;

public interface DepartmentService {
	
	// 查询所有部门信息
	List<Department> selAll();

	// 根据id查询部门信息
	Department selDept(int id);

	// 根据id修改部门信息
	int updDept(Department department);

	// 删除部门信息
	Map<String, Object> delDept(int id);

	// 插入部门
	int insDept(Department department);

	// 查询最大部门编码
	int selMaxNum();

	// 获取所有部门。不分页
	List<Department> selAllDep();
	
	//添加部门时，名称验证
	Department selDepartmentByAdd(String fullName);
	
	//更新部门时，名称验证
	Department selDepartmentByUpdate(String fullName,int id);
	
}
