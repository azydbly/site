package com.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author yanp 类描述： 部门管理 2017-4-21 上午9:41:35
 */
public class Department implements Serializable {

	private static final long serialVersionUID = 1L;

	//主键
	private int id;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	// 部门编码
	private int deptNum;
	
	// 部门名称
	private String name;
	
	// 部门全称
	private String fullName;
	
	// 上级部门
	private int pid;
	
	//地址
	private String address;
	
	// 简介
	private String description;
	
	//备注
	private String remark;
	
	// 是否启用
	private int state;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getDeptNum() {
		return deptNum;
	}

	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
