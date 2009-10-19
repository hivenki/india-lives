package com.indialives.voobjects;

import com.indialives.dataobjects.ParkingSlotDO;

public class ParkingSlotVO  extends ParkingSlotDO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String parkingSlotName;

	public String getParkingSlotName() {
		return parkingSlotName;
	}

	public void setParkingSlotName(String parkingSlotName) {
		this.parkingSlotName = parkingSlotName;
	}

}
