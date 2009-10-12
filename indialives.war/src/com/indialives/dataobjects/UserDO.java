package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class UserDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String emailId;
     private String password;
     private String mobileNo;
     private String firstName;
     private String lastName;
     private Set complaintDOs = new HashSet(0);
     private Set roleContextDOs = new HashSet(0);
     private Set noticeDOs = new HashSet(0);
     private Set advertisementDOs = new HashSet(0);
     private Set propertyOwnerDOs = new HashSet(0);
     private Set amenityBookingDOs = new HashSet(0);

    public UserDO() {
    }

	
    public UserDO(Integer id, String emailId, String password, String mobileNo, String firstName, String lastName) {
        this.id = id;
        this.emailId = emailId;
        this.password = password;
        this.mobileNo = mobileNo;
        this.firstName = firstName;
        this.lastName = lastName;
    }
    public UserDO(Integer id, String emailId, String password, String mobileNo, String firstName, String lastName, Set complaintDOs, Set roleContextDOs, Set noticeDOs, Set advertisementDOs, Set propertyOwnerDOs, Set amenityBookingDOs) {
       this.id = id;
       this.emailId = emailId;
       this.password = password;
       this.mobileNo = mobileNo;
       this.firstName = firstName;
       this.lastName = lastName;
       this.complaintDOs = complaintDOs;
       this.roleContextDOs = roleContextDOs;
       this.noticeDOs = noticeDOs;
       this.advertisementDOs = advertisementDOs;
       this.propertyOwnerDOs = propertyOwnerDOs;
       this.amenityBookingDOs = amenityBookingDOs;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
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
    public Set getComplaintDOs() {
        return this.complaintDOs;
    }
    
    public void setComplaintDOs(Set complaintDOs) {
        this.complaintDOs = complaintDOs;
    }
    public Set getRoleContextDOs() {
        return this.roleContextDOs;
    }
    
    public void setRoleContextDOs(Set roleContextDOs) {
        this.roleContextDOs = roleContextDOs;
    }
    public Set getNoticeDOs() {
        return this.noticeDOs;
    }
    
    public void setNoticeDOs(Set noticeDOs) {
        this.noticeDOs = noticeDOs;
    }
    public Set getAdvertisementDOs() {
        return this.advertisementDOs;
    }
    
    public void setAdvertisementDOs(Set advertisementDOs) {
        this.advertisementDOs = advertisementDOs;
    }
    public Set getPropertyOwnerDOs() {
        return this.propertyOwnerDOs;
    }
    
    public void setPropertyOwnerDOs(Set propertyOwnerDOs) {
        this.propertyOwnerDOs = propertyOwnerDOs;
    }
    public Set getAmenityBookingDOs() {
        return this.amenityBookingDOs;
    }
    
    public void setAmenityBookingDOs(Set amenityBookingDOs) {
        this.amenityBookingDOs = amenityBookingDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


