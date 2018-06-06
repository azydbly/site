package com.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author yanp 类描述：用户实体类 2017-4-21 上午9:40:26
 */
public class Employee {

	//主键
	private int id;
	
	//创建时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	//用户编号
	private String employeeNum;
	
	//登录名
	private String loginName;
	
	//登录密码（MD5加密）
	private String loginPassword;
	
	//真实姓名
	private String userName;
	
	//角色编号
	private int roleId;
	
	//部门编号
	private int deptId;
	
	//身份证号码
	private String idCard;
	
	//手机号
	private String telphone;
	
	//邮箱
	private String email;
	
	//地址
	private String address;
	
	//登录次数
	private int register;
	
	//头像地址
	private String url;
	
	//座机号码
	private String phone;
	
	//备注
	private String remark;
	
	//注册人
	private int entryMan;
	
	//0停用 1启用
	private int state;
	
	//部门实体类
	private Department department;
	
	//角色实体类
	private Role role;

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

	public String getEmployeeNum() {
		return employeeNum;
	}

	public void setEmployeeNum(String employeeNum) {
		this.employeeNum = employeeNum;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getRegister() {
		return register;
	}

	public void setRegister(int register) {
		this.register = register;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getEntryMan() {
		return entryMan;
	}

	public void setEntryMan(int entryMan) {
		this.entryMan = entryMan;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
}
