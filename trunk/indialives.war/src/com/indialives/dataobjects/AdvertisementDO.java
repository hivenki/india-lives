package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.Date;

public class AdvertisementDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private UserDO userDO;
     private CommunityDO communityDO;
     private AdBoardEnumDO adBoardEnumDO;
     private AdTypeDO adTypeDO;
     private Date postedDate;
     private Date vadlidFrom;
     private Date validTill;
     private byte[] content;

    public AdvertisementDO() {
    }

    public AdvertisementDO(Integer id, UserDO userDO, CommunityDO communityDO, AdBoardEnumDO adBoardEnumDO, AdTypeDO adTypeDO, Date postedDate, Date vadlidFrom, Date validTill, byte[] content) {
       this.id = id;
       this.userDO = userDO;
       this.communityDO = communityDO;
       this.adBoardEnumDO = adBoardEnumDO;
       this.adTypeDO = adTypeDO;
       this.postedDate = postedDate;
       this.vadlidFrom = vadlidFrom;
       this.validTill = validTill;
       this.content = content;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public UserDO getUserDO() {
        return this.userDO;
    }
    
    public void setUserDO(UserDO userDO) {
        this.userDO = userDO;
    }
    public CommunityDO getCommunityDO() {
        return this.communityDO;
    }
    
    public void setCommunityDO(CommunityDO communityDO) {
        this.communityDO = communityDO;
    }
    public AdBoardEnumDO getAdBoardEnumDO() {
        return this.adBoardEnumDO;
    }
    
    public void setAdBoardEnumDO(AdBoardEnumDO adBoardEnumDO) {
        this.adBoardEnumDO = adBoardEnumDO;
    }
    public AdTypeDO getAdTypeDO() {
        return this.adTypeDO;
    }
    
    public void setAdTypeDO(AdTypeDO adTypeDO) {
        this.adTypeDO = adTypeDO;
    }
    public Date getPostedDate() {
        return this.postedDate;
    }
    
    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }
    public Date getVadlidFrom() {
        return this.vadlidFrom;
    }
    
    public void setVadlidFrom(Date vadlidFrom) {
        this.vadlidFrom = vadlidFrom;
    }
    public Date getValidTill() {
        return this.validTill;
    }
    
    public void setValidTill(Date validTill) {
        this.validTill = validTill;
    }
    public byte[] getContent() {
        return this.content;
    }
    
    public void setContent(byte[] content) {
        this.content = content;
    }

	
	
	public String getTableName() {
		return null;
	}





}


