package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class RoleDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;
     private String description;
     private Set<RoleContextDO> roleContextDOs = new HashSet<RoleContextDO>(0);
     private Set<RolePrivilegeDO> rolePrivilegeDOs = new HashSet<RolePrivilegeDO>(0);

    public RoleDO() {
    }

	
    public RoleDO(Integer id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }
    public RoleDO(Integer id, String name, String description, Set<RoleContextDO> roleContextDOs, Set<RolePrivilegeDO> rolePrivilegeDOs) {
       this.id = id;
       this.name = name;
       this.description = description;
       this.roleContextDOs = roleContextDOs;
       this.rolePrivilegeDOs = rolePrivilegeDOs;
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
    public Set<RoleContextDO> getRoleContextDOs() {
        return this.roleContextDOs;
    }
    
    public void setRoleContextDOs(Set<RoleContextDO> roleContextDOs) {
        this.roleContextDOs = roleContextDOs;
    }
    public Set<RolePrivilegeDO> getRolePrivilegeDOs() {
        return this.rolePrivilegeDOs;
    }
    
    public void setRolePrivilegeDOs(Set<RolePrivilegeDO> rolePrivilegeDOs) {
        this.rolePrivilegeDOs = rolePrivilegeDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


