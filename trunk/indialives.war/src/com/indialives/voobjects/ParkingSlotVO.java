package com.indialives.voobjects;

import com.indialives.dataobjects.ParkingSlotDO;

public class ParkingSlotVO  extends ParkingSlotDO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String propertyTypeName;
	private String propertyName;
	private String parkingSlotName;
	private String parkingName;

	public String getParkingSlotName() {
		return parkingSlotName;
	}

	public void setParkingSlotName(String parkingSlotName) {
		this.parkingSlotName = parkingSlotName;
	}

	public String getParkingName() {
		return parkingName;
	}

	public void setParkingName(String parkingName) {
		this.parkingName = parkingName;
	}

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

}
