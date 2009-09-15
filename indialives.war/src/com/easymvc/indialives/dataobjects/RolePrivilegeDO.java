package com.easymvc.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Sep 15, 2009 12:24:10 PM
 * 
 */


public class RolePrivilegeDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private Integer roleId;
     private Integer privilegeId;

    public RolePrivilegeDO() {
    }

    public RolePrivilegeDO(Integer id, Integer roleId, Integer privilegeId) {
       this.id = id;
       this.roleId = roleId;
       this.privilegeId = privilegeId;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getRoleId() {
        return this.roleId;
    }
    
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
    public Integer getPrivilegeId() {
        return this.privilegeId;
    }
    
    public void setPrivilegeId(Integer privilegeId) {
        this.privilegeId = privilegeId;
    }

	
	
	public String getTableName() {
		return "ROLE_PRIVILEGES";
	}





}


