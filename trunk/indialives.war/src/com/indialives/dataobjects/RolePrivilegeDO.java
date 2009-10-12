package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */


public class RolePrivilegeDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private RoleDO roleDO;
     private PrivilegeDO privilegeDO;

    public RolePrivilegeDO() {
    }

    public RolePrivilegeDO(Integer id, RoleDO roleDO, PrivilegeDO privilegeDO) {
       this.id = id;
       this.roleDO = roleDO;
       this.privilegeDO = privilegeDO;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public RoleDO getRoleDO() {
        return this.roleDO;
    }
    
    public void setRoleDO(RoleDO roleDO) {
        this.roleDO = roleDO;
    }
    public PrivilegeDO getPrivilegeDO() {
        return this.privilegeDO;
    }
    
    public void setPrivilegeDO(PrivilegeDO privilegeDO) {
        this.privilegeDO = privilegeDO;
    }

	
	
	public String getTableName() {
		return null;
	}





}


