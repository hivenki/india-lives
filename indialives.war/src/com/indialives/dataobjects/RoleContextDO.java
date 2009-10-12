package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */


public class RoleContextDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private UserDO userDO;
     private RoleDO roleDO;
     private CommunityDO communityDO;

    public RoleContextDO() {
    }

    public RoleContextDO(Integer id, UserDO userDO, RoleDO roleDO, CommunityDO communityDO) {
       this.id = id;
       this.userDO = userDO;
       this.roleDO = roleDO;
       this.communityDO = communityDO;
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
    public RoleDO getRoleDO() {
        return this.roleDO;
    }
    
    public void setRoleDO(RoleDO roleDO) {
        this.roleDO = roleDO;
    }
    public CommunityDO getCommunityDO() {
        return this.communityDO;
    }
    
    public void setCommunityDO(CommunityDO communityDO) {
        this.communityDO = communityDO;
    }

	
	
	public String getTableName() {
		return null;
	}





}


