package com.indialives.voobjects;

import com.indialives.dataobjects.PropertyOwnerDO;

public class PropertiesVO extends PropertyOwnerDO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String propertyName;
	private String propertyTypeName;
	

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getPropertyTypeName() {
		return propertyTypeName;
	}

	public void setPropertyTypeName(String propertyTypeName) {
		this.propertyTypeName = propertyTypeName;
	}
}
