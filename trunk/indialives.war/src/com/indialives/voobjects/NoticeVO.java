package com.indialives.voobjects;

import com.indialives.dataobjects.NoticeDO;

public class NoticeVO extends NoticeDO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String noticeTypeName;
	private String postedByName;


	public String getNoticeTypeName() {
		return noticeTypeName;
	}

	public void setNoticeTypeName(String noticeTypeName) {
		this.noticeTypeName = noticeTypeName;
	}

	public String getPostedByName() {
		return postedByName;
	}

	public void setPostedByName(String postedByName) {
		this.postedByName = postedByName;
	}

}
