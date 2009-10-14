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
     private Set<ComplaintDO> complaintDOs = new HashSet<ComplaintDO>(0);
     private Set<RoleContextDO> roleContextDOs = new HashSet<RoleContextDO>(0);
     private Set<NoticeDO> noticeDOs = new HashSet<NoticeDO>(0);
     private Set<AdvertisementDO> advertisementDOs = new HashSet<AdvertisementDO>(0);
     private Set<PropertyOwnerDO> propertyOwnerDOs = new HashSet<PropertyOwnerDO>(0);
     private Set<AmenityBookingDO> amenityBookingDOs = new HashSet<AmenityBookingDO>(0);

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
    public UserDO(Integer id, String emailId, String password, String mobileNo, String firstName, String lastName, Set<ComplaintDO> complaintDOs, Set<RoleContextDO> roleContextDOs, Set<NoticeDO> noticeDOs, Set<AdvertisementDO> advertisementDOs, Set<PropertyOwnerDO> propertyOwnerDOs, Set<AmenityBookingDO> amenityBookingDOs) {
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
    public Set<ComplaintDO> getComplaintDOs() {
        return this.complaintDOs;
    }
    
    public void setComplaintDOs(Set<ComplaintDO> complaintDOs) {
        this.complaintDOs = complaintDOs;
    }
    public Set<RoleContextDO> getRoleContextDOs() {
        return this.roleContextDOs;
    }
    
    public void setRoleContextDOs(Set<RoleContextDO> roleContextDOs) {
        this.roleContextDOs = roleContextDOs;
    }
    public Set<NoticeDO> getNoticeDOs() {
        return this.noticeDOs;
    }
    
    public void setNoticeDOs(Set<NoticeDO> noticeDOs) {
        this.noticeDOs = noticeDOs;
    }
    public Set<AdvertisementDO> getAdvertisementDOs() {
        return this.advertisementDOs;
    }
    
    public void setAdvertisementDOs(Set<AdvertisementDO> advertisementDOs) {
        this.advertisementDOs = advertisementDOs;
    }
    public Set<PropertyOwnerDO> getPropertyOwnerDOs() {
        return this.propertyOwnerDOs;
    }
    
    public void setPropertyOwnerDOs(Set<PropertyOwnerDO> propertyOwnerDOs) {
        this.propertyOwnerDOs = propertyOwnerDOs;
    }
    public Set<AmenityBookingDO> getAmenityBookingDOs() {
        return this.amenityBookingDOs;
    }
    
    public void setAmenityBookingDOs(Set<AmenityBookingDO> amenityBookingDOs) {
        this.amenityBookingDOs = amenityBookingDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


