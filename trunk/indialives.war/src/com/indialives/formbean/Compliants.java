package com.indialives.formbean;

public class Compliants {
	
	private Integer propertyId;
	private Integer typeId;
	private Integer severityId;
	private String description;
	private String availableStartTime;
	private String availableEndTime;
	
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
}
