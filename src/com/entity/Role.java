package com.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 职位设置
 * 
 * @author Administrator
 *
 */
public class Role {
	
	//主键
	private int id;
	
	//添加时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	// 职位编码
	private int number;
	
	// 职位名称
	private String name;
	
	// 职位分类
	private int type;
	
	// 所属部门
	private int deptId;
	
	// 直属领导id
	private int leadership;
	
	// 职位描述
	private String description;
	
	// 备注
	private String remark;
	
	// 是否启用
	private int state;
	
	//角色类型
	private String typename;
	
	//部门尸体了
	private Department department;

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

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public int getLeadership() {
		return leadership;
	}

	public void setLeadership(int leadership) {
		this.leadership = leadership;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
}
