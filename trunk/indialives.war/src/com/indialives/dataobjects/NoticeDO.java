package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.Date;

public class NoticeDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private Integer communityId;
     private Integer noticeBoardId;
     private UserDO userDO;
     private CommunityDO communityDO;
     private NoticeBoardEnumDO noticeBoardEnumDO;
     private Date postedDate;
     private String subject;
     private String description;
     private Integer postedBy;

    public NoticeDO() {
    }

    public NoticeDO(Integer id, UserDO userDO, CommunityDO communityDO, NoticeBoardEnumDO noticeBoardEnumDO, Date postedDate, String subject, String description) {
       this.id = id;
       this.userDO = userDO;
       this.communityDO = communityDO;
       this.noticeBoardEnumDO = noticeBoardEnumDO;
       this.postedDate = postedDate;
       this.subject = subject;
       this.description = description;
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
    public NoticeBoardEnumDO getNoticeBoardEnumDO() {
        return this.noticeBoardEnumDO;
    }
    
    public void setNoticeBoardEnumDO(NoticeBoardEnumDO noticeBoardEnumDO) {
        this.noticeBoardEnumDO = noticeBoardEnumDO;
    }
    public Date getPostedDate() {
        return this.postedDate;
    }
    
    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }
    public String getSubject() {
        return this.subject;
    }
    
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

	
	
	public String getTableName() {
		return null;
	}

	public Integer getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(Integer postedBy) {
		this.postedBy = postedBy;
	}

	public Integer getCommunityId() {
		return communityId;
	}

	public void setCommunityId(Integer communityId) {
		this.communityId = communityId;
	}

	public Integer getNoticeBoardId() {
		return noticeBoardId;
	}

	public void setNoticeBoardId(Integer noticeBoardId) {
		this.noticeBoardId = noticeBoardId;
	}





}


