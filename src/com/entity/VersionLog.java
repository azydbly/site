package com.entity;

import java.util.Date;

/**
 * 类名称：VersionLog
 * 类描述：系统日志表 实体类
 * 作者： yanp
 * 日期：2017-12-3 时间：下午11:04:10
 */
public class VersionLog {

    //版本日志ID
	private int id;
	
	//摘要
	private String versionAbstract;
	
	//日志标题
	private String title;
	
	//日志内容
	private String content;
	
	//版本号
	private float versionNumber;
	
	// 创建者
	private int createBy;
	
    //创建时间
	private Date createTime;

	//更新人
	private int updateBy;

	//更新时间
	private Date updateTime;
	
	//1历史版本日志   2未来规划
	private int versionType;
	
	//1启用  0未启用
	private int state;
	
	//角色实体类
	private Role role;

	//用户实体类
	private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVersionAbstract() {
		return versionAbstract;
	}

	public void setVersionAbstract(String versionAbstract) {
		this.versionAbstract = versionAbstract;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getVersionNumber() {
		return versionNumber;
	}

	public void setVersionNumber(float versionNumber) {
		this.versionNumber = versionNumber;
	}

	public int getCreateBy() {
		return createBy;
	}

	public void setCreateBy(int createBy) {
		this.createBy = createBy;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getVersionType() {
		return versionType;
	}

	public void setVersionType(int versionType) {
		this.versionType = versionType;
	}

    public int getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(int updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
