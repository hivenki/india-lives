package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */


public class VillaDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private CommunityDO communityDO;
     private String plotNo;
     private Integer noOfFloors;
     private String name;
     private Integer noOfBedRooms;
     private Integer noOfParkings;

    public VillaDO() {
    }

    public VillaDO(Integer id, CommunityDO communityDO, String plotNo, Integer noOfFloors, String name, Integer noOfBedRooms, Integer noOfParkings) {
       this.id = id;
       this.communityDO = communityDO;
       this.plotNo = plotNo;
       this.noOfFloors = noOfFloors;
       this.name = name;
       this.noOfBedRooms = noOfBedRooms;
       this.noOfParkings = noOfParkings;
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
    public String getPlotNo() {
        return this.plotNo;
    }
    
    public void setPlotNo(String plotNo) {
        this.plotNo = plotNo;
    }
    public Integer getNoOfFloors() {
        return this.noOfFloors;
    }
    
    public void setNoOfFloors(Integer noOfFloors) {
        this.noOfFloors = noOfFloors;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Integer getNoOfBedRooms() {
        return this.noOfBedRooms;
    }
    
    public void setNoOfBedRooms(Integer noOfBedRooms) {
        this.noOfBedRooms = noOfBedRooms;
    }
    public Integer getNoOfParkings() {
        return this.noOfParkings;
    }
    
    public void setNoOfParkings(Integer noOfParkings) {
        this.noOfParkings = noOfParkings;
    }

	
	
	public String getTableName() {
		return null;
	}





}


