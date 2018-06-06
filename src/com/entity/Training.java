package com.entity;

import java.util.Date;

public class Training {
	
	//主键
	private Integer id;
	
	// 创建时间
	private Date tcreatetime;

	// 培训名称
	private String tname;

	// 培训讲师
	private String teacher;

	// 培训开始时间
	private Date begintime;

	// 培训结束时间
	private Date endtime;

	// 培训目的
	private String taim;

	// 参与人员
	private String tpersion;

	// 培训简介
	private String tabstracts;

	// 培训简介 1、起草 2、审核中 3、复核中 4、审核通过 5、驳回
	private Integer topenions;

	// 培训反馈 1、优 2、良 3、差
	private Integer tfeedback;

	// 培训总结
	private String tsummary;

	// 培训结果
	private String tout;

	// 删除状态 0、删除 1、未删除
	private Integer state;

	// 培训资料名称
	private String tfiles;
	
	//培训资料全路径
	private String url;

	// 审核意见
	private String tview;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getTcreatetime() {
		return tcreatetime;
	}

	public void setTcreatetime(Date tcreatetime) {
		this.tcreatetime = tcreatetime;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public Date getBegintime() {
		return begintime;
	}

	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public String getTaim() {
		return taim;
	}

	public void setTaim(String taim) {
		this.taim = taim;
	}

	public String getTpersion() {
		return tpersion;
	}

	public void setTpersion(String tpersion) {
		this.tpersion = tpersion;
	}

	public String getTabstracts() {
		return tabstracts;
	}

	public void setTabstracts(String tabstracts) {
		this.tabstracts = tabstracts;
	}

	public Integer getTopenions() {
		return topenions;
	}

	public void setTopenions(Integer topenions) {
		this.topenions = topenions;
	}

	public Integer getTfeedback() {
		return tfeedback;
	}

	public void setTfeedback(Integer tfeedback) {
		this.tfeedback = tfeedback;
	}

	public String getTsummary() {
		return tsummary;
	}

	public void setTsummary(String tsummary) {
		this.tsummary = tsummary;
	}

	public String getTout() {
		return tout;
	}

	public void setTout(String tout) {
		this.tout = tout;
	}

	public String getTfiles() {
		return tfiles;
	}

	public void setTfiles(String tfiles) {
		this.tfiles = tfiles;
	}

	public String getTview() {
		return tview;
	}

	public void setTview(String tview) {
		this.tview = tview;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	
}