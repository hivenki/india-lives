package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class PropertyTypeEnumDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;
     private String description;
     private Set propertyOwnerDOs = new HashSet(0);

    public PropertyTypeEnumDO() {
    }

	
    public PropertyTypeEnumDO(Integer id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }
    public PropertyTypeEnumDO(Integer id, String name, String description, Set propertyOwnerDOs) {
       this.id = id;
       this.name = name;
       this.description = description;
       this.propertyOwnerDOs = propertyOwnerDOs;
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
    public Set getPropertyOwnerDOs() {
        return this.propertyOwnerDOs;
    }
    
    public void setPropertyOwnerDOs(Set propertyOwnerDOs) {
        this.propertyOwnerDOs = propertyOwnerDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


