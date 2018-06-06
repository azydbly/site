package com.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 简历管理实体类
 */
public class ResumeManage {
	
	//主键
	private int id;
	
	//添加时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date addDate;
	
	//职位名称
	private String positionName;
	
	//职位编码
	private String positionCode;
	
	//职位类型
	private String positionType;
	
	//用户姓名
	private String username;
	
	//性别
	private String sex;
	
	//招聘类型
	private String recruitType;
	
	//邮箱
	private String mail;
	
	//手机号
	private String phone;
	
	//户口所在地
	private String homeLocation;
	
	//地址
	private String address;
	
	//政治面貌
	private String politicalFace;
	
	//身份证号
	private String idCard;
	
	//毕业院校
	private String graduateCollege;
	
	//学历
	private String educationBackground;
	
	//专业
	private String major;
	
	//工作经历
	private String workExperience;
	
	//工资
	private int hopeWages;
	
	//现在状态
	private String onTheJob;
	
	//是否应届毕业生
	private String graduateNow;
	
	//添加日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date registDate;
	
	//个人简历
	private String personalResume;
	
	//是否有推荐人
	private String recommend;
	
	//推荐人
	private String recommendIdea;
	
	//推荐面试意见
	private String recommendPerson;
	
	//推荐面试时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date recommendDate;
	
	//一面面试人
	private String recommendPersonFirst;
	
	//一面时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date recommendDateFirst;
	
	//一面意见
	private String recommendDescribeFirst;
	
	//二面面试人
	private String recommendPersonSecond;
	
	//二面时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date recommendDateSecond;
	
	//二面意见
	private String recommendDescribeSecond;
	
	//三面面试人
	private String recommendPersonThird;
	
	//三面时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date recommendDateThird;
	
	//三面意见
	private String recommendDescribeThird;
	
	//0存档  1推荐面试  2推荐二面  3推荐三面  4建议录用  5录用 6 驳回
	private int resumeStatus;
	
	//录用建议
	private String decide;
	
	//简历全路径
	private String url;

	//简历名称
	private String urlFile;
	
	//0删除  1启用
	private int state;
	
	//面试领导
	private int leadership;
	
	//角色实体类
	private Role role;
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getRecruitType() {
		return recruitType;
	}

	public void setRecruitType(String recruitType) {
		this.recruitType = recruitType;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHomeLocation() {
		return homeLocation;
	}

	public void setHomeLocation(String homeLocation) {
		this.homeLocation = homeLocation;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPoliticalFace() {
		return politicalFace;
	}

	public void setPoliticalFace(String politicalFace) {
		this.politicalFace = politicalFace;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getGraduateCollege() {
		return graduateCollege;
	}

	public void setGraduateCollege(String graduateCollege) {
		this.graduateCollege = graduateCollege;
	}

	public String getEducationBackground() {
		return educationBackground;
	}

	public void setEducationBackground(String educationBackground) {
		this.educationBackground = educationBackground;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(String workExperience) {
		this.workExperience = workExperience;
	}

	public int getHopeWages() {
		return hopeWages;
	}

	public void setHopeWages(int hopeWages) {
		this.hopeWages = hopeWages;
	}

	public String getOnTheJob() {
		return onTheJob;
	}

	public void setOnTheJob(String onTheJob) {
		this.onTheJob = onTheJob;
	}

	public String getGraduateNow() {
		return graduateNow;
	}

	public void setGraduateNow(String graduateNow) {
		this.graduateNow = graduateNow;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getPersonalResume() {
		return personalResume;
	}

	public void setPersonalResume(String personalResume) {
		this.personalResume = personalResume;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public String getRecommendIdea() {
		return recommendIdea;
	}

	public void setRecommendIdea(String recommendIdea) {
		this.recommendIdea = recommendIdea;
	}

	public String getRecommendPerson() {
		return recommendPerson;
	}

	public void setRecommendPerson(String recommendPerson) {
		this.recommendPerson = recommendPerson;
	}

	public Date getRecommendDate() {
		return recommendDate;
	}

	public void setRecommendDate(Date recommendDate) {
		this.recommendDate = recommendDate;
	}

	public String getRecommendPersonFirst() {
		return recommendPersonFirst;
	}

	public void setRecommendPersonFirst(String recommendPersonFirst) {
		this.recommendPersonFirst = recommendPersonFirst;
	}

	public Date getRecommendDateFirst() {
		return recommendDateFirst;
	}

	public void setRecommendDateFirst(Date recommendDateFirst) {
		this.recommendDateFirst = recommendDateFirst;
	}

	public String getRecommendDescribeFirst() {
		return recommendDescribeFirst;
	}

	public void setRecommendDescribeFirst(String recommendDescribeFirst) {
		this.recommendDescribeFirst = recommendDescribeFirst;
	}

	public String getRecommendPersonSecond() {
		return recommendPersonSecond;
	}

	public void setRecommendPersonSecond(String recommendPersonSecond) {
		this.recommendPersonSecond = recommendPersonSecond;
	}

	public Date getRecommendDateSecond() {
		return recommendDateSecond;
	}

	public void setRecommendDateSecond(Date recommendDateSecond) {
		this.recommendDateSecond = recommendDateSecond;
	}

	public String getRecommendDescribeSecond() {
		return recommendDescribeSecond;
	}

	public void setRecommendDescribeSecond(String recommendDescribeSecond) {
		this.recommendDescribeSecond = recommendDescribeSecond;
	}

	public String getRecommendPersonThird() {
		return recommendPersonThird;
	}

	public void setRecommendPersonThird(String recommendPersonThird) {
		this.recommendPersonThird = recommendPersonThird;
	}

	public Date getRecommendDateThird() {
		return recommendDateThird;
	}

	public void setRecommendDateThird(Date recommendDateThird) {
		this.recommendDateThird = recommendDateThird;
	}

	public String getRecommendDescribeThird() {
		return recommendDescribeThird;
	}

	public void setRecommendDescribeThird(String recommendDescribeThird) {
		this.recommendDescribeThird = recommendDescribeThird;
	}

	/**
	 * 0:存档 1:推荐面试 2:推荐二面 3:推荐三面 4:建议录用 5:录用
	 */
	public int getResumeStatus() {
		return resumeStatus;
	}

	/**
	 * 0:存档 1:推荐面试 2:推荐二面 3:推荐三面 4:建议录用 5:录用
	 */
	public void setResumeStatus(int resumeStatus) {
		this.resumeStatus = resumeStatus;
	}

	public String getDecide() {
		return decide;
	}

	public void setDecide(String decide) {
		this.decide = decide;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrlFile() {
		return urlFile;
	}

	public void setUrlFile(String urlFile) {
		this.urlFile = urlFile;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getLeadership() {
		return leadership;
	}

	public void setLeadership(int leadership) {
		this.leadership = leadership;
	}

}
