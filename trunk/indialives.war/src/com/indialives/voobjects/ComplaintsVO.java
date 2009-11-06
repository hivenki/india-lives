package com.indialives.voobjects;

import com.indialives.dataobjects.ComplaintDO;

public class ComplaintsVO extends ComplaintDO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String propertyTypeName;
	private String propertyName;
	private String severityName;
	private String complaintTypeName;
	private String raisedByName;
	private Integer statusName;
	
	
	
	public String getPropertyTypeName() {
		return propertyTypeName;
	}
	public void setPropertyTypeName(String propertyTypeName) {
		this.propertyTypeName = propertyTypeName;
	}
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public String getSeverityName() {
		return severityName;
	}
	public void setSeverityName(String severityName) {
		this.severityName = severityName;
	}
	public String getComplaintTypeName() {
		return complaintTypeName;
	}
	public void setComplaintTypeName(String complaintTypeName) {
		this.complaintTypeName = complaintTypeName;
	}
	public String getRaisedByName() {
		return raisedByName;
	}
	public void setRaisedByName(String raisedByName) {
		this.raisedByName = raisedByName;
	}
	public Integer getStatusName() {
		return statusName;
	}
	public void setStatusName(Integer statusName) {
		this.statusName = statusName;
	}
	
	

}
