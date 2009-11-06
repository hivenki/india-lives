package com.indialives.formbean;

public class Complaint {
	
	private Integer id;
	private Integer propertyId;
	private Integer typeId;
	private Integer severityId;
	private String description;
	private String availableStartTime;
	private String availableEndTime;
	private Integer statusId;
	
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getSeverityId() {
		return severityId;
	}
	public void setSeverityId(Integer severityId) {
		this.severityId = severityId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}	
	public String getAvailableStartTime() {
		return availableStartTime;
	}
	public void setAvailableStartTime(String availableStartTime) {
		this.availableStartTime = availableStartTime;
	}
	public String getAvailableEndTime() {
		return availableEndTime;
	}
	public void setAvailableEndTime(String availableEndTime) {
		this.availableEndTime = availableEndTime;
	}
	public Integer getPropertyId() {
		return propertyId;
	}
	public void setPropertyId(Integer propertyId) {
		this.propertyId = propertyId;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
