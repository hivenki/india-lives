package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class StateDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private CountryDO countryDO;
     private String name;
     private Set<CityDO> cityDOs = new HashSet<CityDO>(0);

    public StateDO() {
    }

	
    public StateDO(Integer id, CountryDO countryDO, String name) {
        this.id = id;
        this.countryDO = countryDO;
        this.name = name;
    }
    public StateDO(Integer id, CountryDO countryDO, String name, Set<CityDO> cityDOs) {
       this.id = id;
       this.countryDO = countryDO;
       this.name = name;
       this.cityDOs = cityDOs;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public CountryDO getCountryDO() {
        return this.countryDO;
    }
    
    public void setCountryDO(CountryDO countryDO) {
        this.countryDO = countryDO;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Set<CityDO> getCityDOs() {
        return this.cityDOs;
    }
    
    public void setCityDOs(Set<CityDO> cityDOs) {
        this.cityDOs = cityDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


