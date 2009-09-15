package com.easymvc.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Sep 15, 2009 12:24:10 PM
 * 
 */


public class UserDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private Integer communityId;
     private String emailId;
     private String password;
     private String mobileNo;
     private String firstName;
     private String lastName;
     private Integer roleId;

    public UserDO() {
    }

    public UserDO(Integer id, Integer communityId, String emailId, String password, String mobileNo, String firstName, String lastName, Integer roleId) {
       this.id = id;
       this.communityId = communityId;
       this.emailId = emailId;
       this.password = password;
       this.mobileNo = mobileNo;
       this.firstName = firstName;
       this.lastName = lastName;
       this.roleId = roleId;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getCommunityId() {
        return this.communityId;
    }
    
    public void setCommunityId(Integer communityId) {
        this.communityId = communityId;
    }
    public String getEmailId() {
        return this.emailId;
    }
    
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getMobileNo() {
        return this.mobileNo;
    }
    
    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public Integer getRoleId() {
        return this.roleId;
    }
    
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

	
	
	public String getTableName() {
		return "USERS";
	}





}


