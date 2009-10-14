package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class CountryDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;
     private Set<StateDO> stateDOs = new HashSet<StateDO>(0);

    public CountryDO() {
    }

	
    public CountryDO(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
    public CountryDO(Integer id, String name, Set<StateDO> stateDOs) {
       this.id = id;
       this.name = name;
       this.stateDOs = stateDOs;
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
    public Set<StateDO> getStateDOs() {
        return this.stateDOs;
    }
    
    public void setStateDOs(Set<StateDO> stateDOs) {
        this.stateDOs = stateDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


