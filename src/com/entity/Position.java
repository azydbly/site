package com.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author yanp
 * 类描述： 职位发布实体类
 * 2017-4-21 上午9:41:53
 */
public class Position {
	
	//主键
	private int id;
	
	//添加时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date addDate;
	
	//部门编号
	private String deptId;
	
	//招聘类型
	private String recruitType;
	
	//招聘人数
	private int recruitNum;
	
	//招聘职位
	private String positionName;
	
	//招聘职位编号
	private String positionCode;
	
	//招聘职位类型
	private String positionType;
	
	//登记人
	private String registPerson;
	
	//开始时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date registDate;
	
	//结束时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date stopDate;
	
	//职位描述
	private String positionDescribe;
	
	//招聘要求
	private String recruitStandard;
	
	//0删除  1启用
	private int state;
	
	//部门实体类
	private Department department;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public String getRecruitType() {
		return recruitType;
	}

	public void setRecruitType(String recruitType) {
		this.recruitType = recruitType;
	}

	public int getRecruitNum() {
		return recruitNum;
	}

	public void setRecruitNum(int recruitNum) {
		this.recruitNum = recruitNum;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public String getPositionType() {
		return positionType;
	}
	public void setPositionType(String positionType) {
		this.positionType = positionType;
	}

	public String getRegistPerson() {
		return registPerson;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public void setRegistPerson(String registPerson) {
		this.registPerson = registPerson;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public Date getStopDate() {
		return stopDate;
	}

	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}

	public String getPositionDescribe() {
		return positionDescribe;
	}

	public void setPositionDescribe(String positionDescribe) {
		this.positionDescribe = positionDescribe;
	}

	public String getRecruitStandard() {
		return recruitStandard;
	}

	public void setRecruitStandard(String recruitStandard) {
		this.recruitStandard = recruitStandard;
	}


	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	
	

}
