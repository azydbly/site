package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.RoleMenu;

public interface RoleMenuService {
	
	//根据职位id查询数据
	List<RoleMenu> selAllByRoleId(int roleId);
	
	//删除角色的权限
	int delRoleMenu(int roleId);
	
	//插入角色的权限
	int insRoleMenu1(int roleId,int menuId);
	
	String geMenusTreeToJson(int roleid);
	
	//根据角色id和菜单id查询功能权限
	List<RoleMenu> selectByRoleIdMenuId(int roleId, int menuId);
	
	// 插入角色的权限
	int insRoleMenu(int roleId, int menuId,int operationId);
	
	//根据菜单删除权限
	int delByMenuId(@Param("idlist")List<Integer> idlist);
	
	//根据角色删除权限
	int delByRoleId(@Param("idlist")List<Integer> idlist);
}
