package com.entity;

/**
 * @author yanp
 * 2017-9-6
 * 类描述： 菜单功能类
 */
public class Operation {
	
	//主键
	private int id;
	
	//功能名称
	private String menuname;

	//菜单id
	private int pid;
	
	//菜单实体类
	private Menu menu;

	//功能实体类
	private Function fuunction;
	
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public Function getFuunction() {
		return fuunction;
	}

	public void setFuunction(Function fuunction) {
		this.fuunction = fuunction;
	}

}
