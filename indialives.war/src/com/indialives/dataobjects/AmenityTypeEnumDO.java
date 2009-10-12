package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class AmenityTypeEnumDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;
     private String description;
     private Set amenityBookingDOs = new HashSet(0);
     private Set amenityDOs = new HashSet(0);

    public AmenityTypeEnumDO() {
    }

	
    public AmenityTypeEnumDO(Integer id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }
    public AmenityTypeEnumDO(Integer id, String name, String description, Set amenityBookingDOs, Set amenityDOs) {
       this.id = id;
       this.name = name;
       this.description = description;
       this.amenityBookingDOs = amenityBookingDOs;
       this.amenityDOs = amenityDOs;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
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
    public Set getAmenityBookingDOs() {
        return this.amenityBookingDOs;
    }
    
    public void setAmenityBookingDOs(Set amenityBookingDOs) {
        this.amenityBookingDOs = amenityBookingDOs;
    }
    public Set getAmenityDOs() {
        return this.amenityDOs;
    }
    
    public void setAmenityDOs(Set amenityDOs) {
        this.amenityDOs = amenityDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


