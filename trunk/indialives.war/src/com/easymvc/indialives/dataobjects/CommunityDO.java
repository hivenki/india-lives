package com.easymvc.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Sep 15, 2009 12:24:10 PM
 * 
 */


public class CommunityDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;
     private String address;
     private Integer city;
     private Integer state;
     private Integer country;
     private String pinCode;

    public CommunityDO() {
    }

    public CommunityDO(Integer id, String name, String address, Integer city, Integer state, Integer country, String pinCode) {
       this.id = id;
       this.name = name;
       this.address = address;
       this.city = city;
       this.state = state;
       this.country = country;
       this.pinCode = pinCode;
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
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public Integer getCity() {
        return this.city;
    }
    
    public void setCity(Integer city) {
        this.city = city;
    }
    public Integer getState() {
        return this.state;
    }
    
    public void setState(Integer state) {
        this.state = state;
    }
    public Integer getCountry() {
        return this.country;
    }
    
    public void setCountry(Integer country) {
        this.country = country;
    }
    public String getPinCode() {
        return this.pinCode;
    }
    
    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }

	
	
	public String getTableName() {
		return "COMMUNITIES";
	}





}


