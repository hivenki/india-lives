package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class CommunityDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private CityDO cityDO;
     private String name;
     private String address;
     private String pinCode;
     private Set noticeDOs = new HashSet(0);
     private Set blockDOs = new HashSet(0);
     private Set parkingDOs = new HashSet(0);
     private Set amenityDOs = new HashSet(0);
     private Set villaDOs = new HashSet(0);
     private Set advertisementDOs = new HashSet(0);
     private Set roleContextDOs = new HashSet(0);

    public CommunityDO() {
    }

	
    public CommunityDO(Integer id, CityDO cityDO, String name, String address, String pinCode) {
        this.id = id;
        this.cityDO = cityDO;
        this.name = name;
        this.address = address;
        this.pinCode = pinCode;
    }
    public CommunityDO(Integer id, CityDO cityDO, String name, String address, String pinCode, Set noticeDOs, Set blockDOs, Set parkingDOs, Set amenityDOs, Set villaDOs, Set advertisementDOs, Set roleContextDOs) {
       this.id = id;
       this.cityDO = cityDO;
       this.name = name;
       this.address = address;
       this.pinCode = pinCode;
       this.noticeDOs = noticeDOs;
       this.blockDOs = blockDOs;
       this.parkingDOs = parkingDOs;
       this.amenityDOs = amenityDOs;
       this.villaDOs = villaDOs;
       this.advertisementDOs = advertisementDOs;
       this.roleContextDOs = roleContextDOs;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public CityDO getCityDO() {
        return this.cityDO;
    }
    
    public void setCityDO(CityDO cityDO) {
        this.cityDO = cityDO;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPinCode() {
        return this.pinCode;
    }
    
    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }
    public Set getNoticeDOs() {
        return this.noticeDOs;
    }
    
    public void setNoticeDOs(Set noticeDOs) {
        this.noticeDOs = noticeDOs;
    }
    public Set getBlockDOs() {
        return this.blockDOs;
    }
    
    public void setBlockDOs(Set blockDOs) {
        this.blockDOs = blockDOs;
    }
    public Set getParkingDOs() {
        return this.parkingDOs;
    }
    
    public void setParkingDOs(Set parkingDOs) {
        this.parkingDOs = parkingDOs;
    }
    public Set getAmenityDOs() {
        return this.amenityDOs;
    }
    
    public void setAmenityDOs(Set amenityDOs) {
        this.amenityDOs = amenityDOs;
    }
    public Set getVillaDOs() {
        return this.villaDOs;
    }
    
    public void setVillaDOs(Set villaDOs) {
        this.villaDOs = villaDOs;
    }
    public Set getAdvertisementDOs() {
        return this.advertisementDOs;
    }
    
    public void setAdvertisementDOs(Set advertisementDOs) {
        this.advertisementDOs = advertisementDOs;
    }
    public Set getRoleContextDOs() {
        return this.roleContextDOs;
    }
    
    public void setRoleContextDOs(Set roleContextDOs) {
        this.roleContextDOs = roleContextDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


