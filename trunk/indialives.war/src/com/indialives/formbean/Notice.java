package com.indialives.formbean;

public class Notice {
	
	private Integer noticeTypeId;
	private String postedDate;
	private String subject;
	private String description;	
	private Integer postedById;
	
	public Integer getNoticeTypeId() {
		return noticeTypeId;
	}
	public void setNoticeTypeId(Integer noticeTypeId) {
		this.noticeTypeId = noticeTypeId;
	}
	public String getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getPostedById() {
		return postedById;
	}
	public void setPostedById(Integer postedById) {
		this.postedById = postedById;
	}
	
}
