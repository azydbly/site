package com.mapper;

import java.util.List;

import com.entity.Department;

/**
 * 查询单个部门 构想：删除部门时，若有子部门同时删除
 * 
 * @author Administrator
 * 
 */
public interface DepartmentMapper {
	
	// 查询所有部门信息
	List<Department> selAll();

	// 根据id查询部门信息
	Department selDept(int id);

	// 根据id修改部门信息
	int updDept(Department department);

	// 删除部门信息
	int delDept(int id);

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
