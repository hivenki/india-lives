package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */


public class PropertyOwnerDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private Integer propertyId;
     private Integer propertyTypeId; 
     private Integer ownerId;
     private FlatDO flatDO;
     private UserDO userDO;
     private PropertyTypeEnumDO propertyTypeEnumDO;
     private Integer communityId;
     
    public PropertyOwnerDO() {
    }

    public PropertyOwnerDO(Integer id, FlatDO flatDO, UserDO userDO, PropertyTypeEnumDO propertyTypeEnumDO) {
       this.id = id;
       this.flatDO = flatDO;
       this.userDO = userDO;
       this.propertyTypeEnumDO = propertyTypeEnumDO;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public FlatDO getFlatDO() {
        return this.flatDO;
    }
    
    public void setFlatDO(FlatDO flatDO) {
        this.flatDO = flatDO;
    }
    public UserDO getUserDO() {
        return this.userDO;
    }
    
    public void setUserDO(UserDO userDO) {
        this.userDO = userDO;
    }
    public PropertyTypeEnumDO getPropertyTypeEnumDO() {
        return this.propertyTypeEnumDO;
    }
    
    public void setPropertyTypeEnumDO(PropertyTypeEnumDO propertyTypeEnumDO) {
        this.propertyTypeEnumDO = propertyTypeEnumDO;
    }

	
	
	public String getTableName() {
		return null;
	}

	public Integer getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(Integer propertyId) {
		this.propertyId = propertyId;
	}

	public Integer getPropertyTypeId() {
		return propertyTypeId;
	}

	public void setPropertyTypeId(Integer propertyTypeId) {
		this.propertyTypeId = propertyTypeId;
	}

	public Integer getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}

	public Integer getCommunityId() {
		return communityId;
	}

	public void setCommunityId(Integer communityId) {
		this.communityId = communityId;
	}





}


