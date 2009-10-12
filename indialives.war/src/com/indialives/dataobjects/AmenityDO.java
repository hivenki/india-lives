package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */


public class AmenityDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private CommunityDO communityDO;
     private AmenityTypeEnumDO amenityTypeEnumDO;

    public AmenityDO() {
    }

    public AmenityDO(Integer id, CommunityDO communityDO, AmenityTypeEnumDO amenityTypeEnumDO) {
       this.id = id;
       this.communityDO = communityDO;
       this.amenityTypeEnumDO = amenityTypeEnumDO;
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
    public AmenityTypeEnumDO getAmenityTypeEnumDO() {
        return this.amenityTypeEnumDO;
    }
    
    public void setAmenityTypeEnumDO(AmenityTypeEnumDO amenityTypeEnumDO) {
        this.amenityTypeEnumDO = amenityTypeEnumDO;
    }

	
	
	public String getTableName() {
		return null;
	}





}


