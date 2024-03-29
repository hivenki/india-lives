package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class FlatDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private BlockDO blockDO;
     private Integer floor;
     private String flatNo;
     private Integer flatTypeId;
     private Integer noOfBedRooms;
     private Integer blockId;
     private Set<PropertyOwnerDO> propertyOwnerDOs = new HashSet<PropertyOwnerDO>(0);
     private Set<ComplaintDO> complaintDOs = new HashSet<ComplaintDO>(0);

    public FlatDO() {
    }

	
    public FlatDO(Integer id, BlockDO blockDO, Integer floor, String flatNo, Integer flatTypeId, Integer noOfBedRooms) {
        this.id = id;
        this.blockDO = blockDO;
        this.floor = floor;
        this.flatNo = flatNo;
        this.flatTypeId = flatTypeId;
        this.noOfBedRooms = noOfBedRooms;
    }
    public FlatDO(Integer id, BlockDO blockDO, Integer floor, String flatNo, Integer flatTypeId, Integer noOfBedRooms, Set<PropertyOwnerDO> propertyOwnerDOs, Set<ComplaintDO> complaintDOs) {
       this.id = id;
       this.blockDO = blockDO;
       this.floor = floor;
       this.flatNo = flatNo;
       this.flatTypeId = flatTypeId;
       this.noOfBedRooms = noOfBedRooms;
       this.propertyOwnerDOs = propertyOwnerDOs;
       this.complaintDOs = complaintDOs;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public BlockDO getBlockDO() {
        return this.blockDO;
    }
    
    public void setBlockDO(BlockDO blockDO) {
        this.blockDO = blockDO;
    }
    public Integer getFloor() {
        return this.floor;
    }
    
    public void setFloor(Integer floor) {
        this.floor = floor;
    }
    public String getFlatNo() {
        return this.flatNo;
    }
    
    public void setFlatNo(String flatNo) {
        this.flatNo = flatNo;
    }
    public Integer getFlatTypeId() {
        return this.flatTypeId;
    }
    
    public void setFlatTypeId(Integer flatTypeId) {
        this.flatTypeId = flatTypeId;
    }
    public Integer getNoOfBedRooms() {
        return this.noOfBedRooms;
    }
    
    public void setNoOfBedRooms(Integer noOfBedRooms) {
        this.noOfBedRooms = noOfBedRooms;
    }
    public Set<PropertyOwnerDO> getPropertyOwnerDOs() {
        return this.propertyOwnerDOs;
    }
    
    public void setPropertyOwnerDOs(Set<PropertyOwnerDO> propertyOwnerDOs) {
        this.propertyOwnerDOs = propertyOwnerDOs;
    }
    public Set<ComplaintDO> getComplaintDOs() {
        return this.complaintDOs;
    }
    
    public void setComplaintDOs(Set<ComplaintDO> complaintDOs) {
        this.complaintDOs = complaintDOs;
    }

	
	
	public String getTableName() {
		return null;
	}


	public Integer getBlockId() {
		return blockId;
	}


	public void setBlockId(Integer blockId) {
		this.blockId = blockId;
	}





}


