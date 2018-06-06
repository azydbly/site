package com.mapper;

/**
 * 查询全部角色信息
 * 查询角色总条数
 */
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.entity.Role;

public interface RoleMapper {
	// 查询全部角色信息
	List<Role> getPageRoleList(@Param("search") String search,@Param("subSQL") String subSQL);

	// 查询所有
	List<Role> selAll();

	// 根据id查询角色
	Role selById(int id);

	// 更新职位信息
	int updRole(Role role);

	// 更新职位停用启用
	int updRoleState(Role role);

	// 删除职位 单条
	int delRole(int id);

	// 插入职位
	int insRole(Role role);

	// 删除角色（单条、多条）
	int delAll(@Param("idlist") List<Integer> idlist);
	
	// 查询职位最大id
	int selMaxId();

	// 查询最大职位编码
	int selMaxNum();

	// 查询最小的上级部门
	int selMinLeadership();

	// 根据部门id，查询职位
	List<Role> seelctDept(int deptId);

	// 在修改简历时，通过number查询role的信息
	Role seelctRoleById(int number);

	// 查询上级领导
	List<Role> seelLeadership(Map<String, Object> map);

	// 查询部门下的职位
	int selectAllRoleForDept(int deptId);
	
	//查询超级管理员的id
	List<Role> selectForAdmin();
}
