package com.indialives.voobjects;

import com.indialives.dataobjects.NoticeDO;

public class NoticeVO extends NoticeDO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String noticeTypeName;
	private String postedByName;
	private String communityName;
	private String communityAddress;
	private String cityName;
	private String pincodeNo;

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

	public String getCommunityName() {
		return communityName;
	}

	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}

	public String getCommunityAddress() {
		return communityAddress;
	}

	public void setCommunityAddress(String communityAddress) {
		this.communityAddress = communityAddress;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getPincodeNo() {
		return pincodeNo;
	}

	public void setPincodeNo(String pincodeNo) {
		this.pincodeNo = pincodeNo;
	}

}
