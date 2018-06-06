package com.entity;

/**
 * 类名称：Areas
 * 类描述：省市区县村 实体类 
 * 说明： 数据量数据来在2014年7月 数据有可能不准，数据来源多方自己整合，可能会出现误差
 * 作者： yanp
 * 日期：2017-12-23 时间：下午2:49:58
 */
public class Areas {

	//主键
	private int id;
	
	//编号
	private String number;
	
	//名字
	private String name;
	
	//上级ID
	private int pid;
	
	//所属级别
	private int level;
	
	//标识  0删除  1启用
	private int state;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
