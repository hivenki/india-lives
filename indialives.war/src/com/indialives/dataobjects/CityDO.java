package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class CityDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private StateDO stateDO;
     private String name;
     private Set communityDOs = new HashSet(0);

    public CityDO() {
    }

	
    public CityDO(Integer id, StateDO stateDO, String name) {
        this.id = id;
        this.stateDO = stateDO;
        this.name = name;
    }
    public CityDO(Integer id, StateDO stateDO, String name, Set communityDOs) {
       this.id = id;
       this.stateDO = stateDO;
       this.name = name;
       this.communityDOs = communityDOs;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public StateDO getStateDO() {
        return this.stateDO;
    }
    
    public void setStateDO(StateDO stateDO) {
        this.stateDO = stateDO;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Set getCommunityDOs() {
        return this.communityDOs;
    }
    
    public void setCommunityDOs(Set communityDOs) {
        this.communityDOs = communityDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


