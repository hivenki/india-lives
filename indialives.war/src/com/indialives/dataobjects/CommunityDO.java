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
     private Set<NoticeDO> noticeDOs = new HashSet<NoticeDO>(0);
     private Set<BlockDO> blockDOs = new HashSet<BlockDO>(0);
     private Set<ParkingDO> parkingDOs = new HashSet<ParkingDO>(0);
     private Set<AmenityDO> amenityDOs = new HashSet<AmenityDO>(0);
     private Set<VillaDO> villaDOs = new HashSet<VillaDO>(0);
     private Set<AdvertisementDO> advertisementDOs = new HashSet<AdvertisementDO>(0);
     private Set<RoleContextDO> roleContextDOs = new HashSet<RoleContextDO>(0);

    public CommunityDO() {
    }

	
    public CommunityDO(Integer id, CityDO cityDO, String name, String address, String pinCode) {
        this.id = id;
        this.cityDO = cityDO;
        this.name = name;
        this.address = address;
        this.pinCode = pinCode;
    }
    public CommunityDO(Integer id, CityDO cityDO, String name, String address, String pinCode, Set<NoticeDO> noticeDOs, Set<BlockDO> blockDOs, Set<ParkingDO> parkingDOs, Set<AmenityDO> amenityDOs, Set<VillaDO> villaDOs, Set<AdvertisementDO> advertisementDOs, Set<RoleContextDO> roleContextDOs) {
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
    public Set<NoticeDO> getNoticeDOs() {
        return this.noticeDOs;
    }
    
    public void setNoticeDOs(Set<NoticeDO> noticeDOs) {
        this.noticeDOs = noticeDOs;
    }
    public Set<BlockDO> getBlockDOs() {
        return this.blockDOs;
    }
    
    public void setBlockDOs(Set<BlockDO> blockDOs) {
        this.blockDOs = blockDOs;
    }
    public Set<ParkingDO> getParkingDOs() {
        return this.parkingDOs;
    }
    
    public void setParkingDOs(Set<ParkingDO> parkingDOs) {
        this.parkingDOs = parkingDOs;
    }
    public Set<AmenityDO> getAmenityDOs() {
        return this.amenityDOs;
    }
    
    public void setAmenityDOs(Set<AmenityDO> amenityDOs) {
        this.amenityDOs = amenityDOs;
    }
    public Set<VillaDO> getVillaDOs() {
        return this.villaDOs;
    }
    
    public void setVillaDOs(Set<VillaDO> villaDOs) {
        this.villaDOs = villaDOs;
    }
    public Set<AdvertisementDO> getAdvertisementDOs() {
        return this.advertisementDOs;
    }
    
    public void setAdvertisementDOs(Set<AdvertisementDO> advertisementDOs) {
        this.advertisementDOs = advertisementDOs;
    }
    public Set<RoleContextDO> getRoleContextDOs() {
        return this.roleContextDOs;
    }
    
    public void setRoleContextDOs(Set<RoleContextDO> roleContextDOs) {
        this.roleContextDOs = roleContextDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


