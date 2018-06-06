package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Role;
import com.system.util.DataTables;

public interface RoleService {
	
	// 查询全部角色信息
	DataTables getPageRoleList(DataTables dataTables);

	// 根据id查询角色
	Role selById(int id);

	// 更新职位信息
	Map<String, Object> updRole(Role role);

	// 更新职位停用启用
	Map<String, Object> updRoleState(Role role);

	// 插入职位
	Map<String, Object> insRole(Role role);

	// 删除角色（单条、多条）
	Map<String, Object> delAll(List<Integer> idlist);
	
	// 查询职位最大id
	int selMaxId();

	// 查询最大职位编码
	int selMaxNum();

	// 查询最小的上级部门
	int selMinLeadership();

	List<Role> selAll();

	// 根据部门id，查询职位
	List<Role> seelctDept(int departmentId);

	// 在修改简历时，通过id查询role的信息
	Role seelctRoleById(int number);

	// 查询上级领导
	List<Role> seelLeadership(Map<String, Object> map);

	// 查询部门下的职位
	int selectAllRoleForDept(int deptId);
	
	//查询超级管理员的id
	List<Role> selectForAdmin();
}
