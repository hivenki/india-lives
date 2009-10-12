package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class BlockDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private CommunityDO communityDO;
     private String name;
     private String description;
     private Integer noOfFloors;
     private Set flatDOs = new HashSet(0);

    public BlockDO() {
    }

	
    public BlockDO(Integer id, CommunityDO communityDO, String name, String description, Integer noOfFloors) {
        this.id = id;
        this.communityDO = communityDO;
        this.name = name;
        this.description = description;
        this.noOfFloors = noOfFloors;
    }
    public BlockDO(Integer id, CommunityDO communityDO, String name, String description, Integer noOfFloors, Set flatDOs) {
       this.id = id;
       this.communityDO = communityDO;
       this.name = name;
       this.description = description;
       this.noOfFloors = noOfFloors;
       this.flatDOs = flatDOs;
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
    public Integer getNoOfFloors() {
        return this.noOfFloors;
    }
    
    public void setNoOfFloors(Integer noOfFloors) {
        this.noOfFloors = noOfFloors;
    }
    public Set getFlatDOs() {
        return this.flatDOs;
    }
    
    public void setFlatDOs(Set flatDOs) {
        this.flatDOs = flatDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


