package com.entity;

/**
 * @author yanp 
 * 2017-8-30 
 * 类描述： 角色权限表
 */
public class RoleMenu {

	// 角色id
	private int roleId;
	
	//菜单id
	private int menuId;
	
	//菜单功能id
	private int operationId;
	
	private Operation operation;
	
	

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getOperationId() {
		return operationId;
	}

	public void setOperationId(int operationId) {
		this.operationId = operationId;
	}

	public Operation getOperation() {
		return operation;
	}

	public void setOperation(Operation operation) {
		this.operation = operation;
	}
	

}
