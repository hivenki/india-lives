package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class NoticeBoardEnumDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;
     private String description;
     private Set noticeDOs = new HashSet(0);

    public NoticeBoardEnumDO() {
    }

	
    public NoticeBoardEnumDO(Integer id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }
    public NoticeBoardEnumDO(Integer id, String name, String description, Set noticeDOs) {
       this.id = id;
       this.name = name;
       this.description = description;
       this.noticeDOs = noticeDOs;
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
    public Set getNoticeDOs() {
        return this.noticeDOs;
    }
    
    public void setNoticeDOs(Set noticeDOs) {
        this.noticeDOs = noticeDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


