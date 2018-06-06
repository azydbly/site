package com.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Salary {
	
	//主键
	private int id;
	
	// 员工id
	private String employeeId;
	
	// 登记人id
	private String registrantId;
	
	// 登记时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date addtime;
	
	// 基本工资
	private int basepay;
	
	// 绩效奖金
	private int bonus;
	
	// 交通补助
	private int travel;
	
	// 电话补助
	private int phone;
	
	// 餐补
	private int meal;
	
	// 住房补助
	private int house;
	
	// 出差补助
	private int bussiness;
	
	// 加班补助
	private int addwork;
	
	// 薪酬总额
	private int payroll;
	
	// 审核状态
	private int checkstate;
	
	// 备注
	private String remark;
	
	// 职位名称id
	private int roleId;
	
	// 部门id
	private int deptId;
	
	// 是否删除
	private int state;
	
	// 员工
	private Employee employee;
	
	// 部门实体类
	private Department department;
	
	// 角色实体类
	private Role role;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getRegistrantId() {
		return registrantId;
	}

	public void setRegistrantId(String registrantId) {
		this.registrantId = registrantId;
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public int getBasepay() {
		return basepay;
	}

	public void setBasepay(int basepay) {
		this.basepay = basepay;
	}

	public int getBonus() {
		return bonus;
	}

	public void setBonus(int bonus) {
		this.bonus = bonus;
	}

	public int getTravel() {
		return travel;
	}

	public void setTravel(int travel) {
		this.travel = travel;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getMeal() {
		return meal;
	}

	public void setMeal(int meal) {
		this.meal = meal;
	}

	public int getHouse() {
		return house;
	}

	public void setHouse(int house) {
		this.house = house;
	}

	public int getBussiness() {
		return bussiness;
	}

	public void setBussiness(int bussiness) {
		this.bussiness = bussiness;
	}

	public int getAddwork() {
		return addwork;
	}

	public void setAddwork(int addwork) {
		this.addwork = addwork;
	}

	public int getPayroll() {
		return payroll;
	}

	public void setPayroll(int payroll) {
		this.payroll = payroll;
	}

	public int getCheckstate() {
		return checkstate;
	}

	public void setCheckstate(int checkstate) {
		this.checkstate = checkstate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
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

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
