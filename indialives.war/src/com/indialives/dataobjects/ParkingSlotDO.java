package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */


public class ParkingSlotDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private ParkingDO parkingDO;
     private Integer parkingId;
     private String location;
     private Integer propertyTypeId;
     private Integer propertyId;

    public ParkingSlotDO() {
    }

    public ParkingSlotDO(Integer id, ParkingDO parkingDO, String location) {
       this.id = id;
       this.parkingDO = parkingDO;
       this.location = location;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public ParkingDO getParkingDO() {
        return this.parkingDO;
    }
    
    public void setParkingDO(ParkingDO parkingDO) {
        this.parkingDO = parkingDO;
    }
    public String getLocation() {
        return this.location;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }

	
	
	public String getTableName() {
		return null;
	}

	public Integer getParkingId() {
		return parkingId;
	}

	public void setParkingId(Integer parkingId) {
		this.parkingId = parkingId;
	}

	public Integer getPropertyTypeId() {
		return propertyTypeId;
	}

	public void setPropertyTypeId(Integer propertyTypeId) {
		this.propertyTypeId = propertyTypeId;
	}

	public Integer getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(Integer propertyId) {
		this.propertyId = propertyId;
	}





}


