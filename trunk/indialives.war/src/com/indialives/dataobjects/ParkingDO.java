package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class ParkingDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private CommunityDO communityDO;
     private String name;
     private String description;
     private Set parkingSlotDOs = new HashSet(0);

    public ParkingDO() {
    }

	
    public ParkingDO(Integer id, CommunityDO communityDO, String name, String description) {
        this.id = id;
        this.communityDO = communityDO;
        this.name = name;
        this.description = description;
    }
    public ParkingDO(Integer id, CommunityDO communityDO, String name, String description, Set parkingSlotDOs) {
       this.id = id;
       this.communityDO = communityDO;
       this.name = name;
       this.description = description;
       this.parkingSlotDOs = parkingSlotDOs;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public CommunityDO getCommunityDO() {
        return this.communityDO;
    }
    
    public void setCommunityDO(CommunityDO communityDO) {
        this.communityDO = communityDO;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public Set getParkingSlotDOs() {
        return this.parkingSlotDOs;
    }
    
    public void setParkingSlotDOs(Set parkingSlotDOs) {
        this.parkingSlotDOs = parkingSlotDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


