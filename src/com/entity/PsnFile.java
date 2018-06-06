package com.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PsnFile implements Serializable {
	
	private static final long serialVersionUID = -7523454869881662966L;

	//主键
	private int id;
	
	// 创建日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	// 档案编码
	private String fileNum;
	
	// 档案状态
	private int state;
	
	// 审核状态
	private int checkState;
	
	//员工姓名
	private String empName;
	
	//性别
	private int sex;
	
	//电子邮件
	private String email;
	
	//电话号
	private String pphone;
	
	//地址
	private String address;
	
	//身份证
	private String idCard;
	
	//户口地址
	private String hukouAdrs;
	
	//政治面貌
	private String polity;
	
	//毕业学校
	private String univercity;
	
	//专业
	private String major;
	
	//学历
	private String education;
	
	//开户行
	private String bankName;
	
	//银行卡号
	private String bkCardNum;
	
	//审核人
	private String checkMan;
	
	//简历
	private String resume;
	
	//家庭关系
	private String famRelation;
	
	//备注
	private String remark;
	
	//保险号
	private String sequNum;
	
	// 简历存储地址
	private String fileLocation;
	
	// 简历的绝对路径
	private String url;
	
	// 部门编号
	private int deptId;
	
	// 职位编号
	private int roleId;
	
	// 0删除  1启用
 	private int flag;
	
	// 部门实体类
	private Department department;
	
	// 角色实体类
	private Role role;
	
	// 工资实体类
	private Salary salary;
	
	// 员工实体类
	private Employee employee;

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

	public String getFileNum() {
		return fileNum;
	}

	public void setFileNum(String fileNum) {
		this.fileNum = fileNum;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getCheckState() {
		return checkState;
	}

	public void setCheckState(int checkState) {
		this.checkState = checkState;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPphone() {
		return pphone;
	}

	public void setPphone(String pphone) {
		this.pphone = pphone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getHukouAdrs() {
		return hukouAdrs;
	}

	public void setHukouAdrs(String hukouAdrs) {
		this.hukouAdrs = hukouAdrs;
	}

	public String getPolity() {
		return polity;
	}

	public void setPolity(String polity) {
		this.polity = polity;
	}

	public String getUnivercity() {
		return univercity;
	}

	public void setUnivercity(String univercity) {
		this.univercity = univercity;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBkCardNum() {
		return bkCardNum;
	}

	public void setBkCardNum(String bkCardNum) {
		this.bkCardNum = bkCardNum;
	}

	public String getCheckMan() {
		return checkMan;
	}

	public void setCheckMan(String checkMan) {
		this.checkMan = checkMan;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getFamRelation() {
		return famRelation;
	}

	public void setFamRelation(String famRelation) {
		this.famRelation = famRelation;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSequNum() {
		return sequNum;
	}

	public void setSequNum(String sequNum) {
		this.sequNum = sequNum;
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

	public Salary getSalary() {
		return salary;
	}

	public void setSalary(Salary salary) {
		this.salary = salary;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}


}
