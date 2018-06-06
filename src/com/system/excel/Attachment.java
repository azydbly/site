package com.system.excel;

import java.io.Serializable;

public class Attachment implements Serializable{
	
	
	private static final long serialVersionUID = 1L;

	private Integer attachmentId;    // ID
	private String attachmentName;   // 名称
	private String attachmentPath;   // 路径
	private String attachmentTime;   // 时间
	
	
	public Integer getAttachmentId() {
		return attachmentId;
	}
	public void setAttachmentId(Integer attachmentId) {
		this.attachmentId = attachmentId;
	}
	public String getAttachmentName() {
		return attachmentName;
	}
	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}
	public String getAttachmentPath() {
		return attachmentPath;
	}
	public void setAttachmentPath(String attachmentPath) {
		this.attachmentPath = attachmentPath;
	}
	public String getAttachmentTime() {
		return attachmentTime;
	}
	public void setAttachmentTime(String attachmentTime) {
		this.attachmentTime = attachmentTime;
	}
	
	
}
