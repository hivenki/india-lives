package com.indialives.voobjects;

import com.indialives.dataobjects.ParkingSlotDO;

public class ParkingSlotVO  extends ParkingSlotDO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
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

}
