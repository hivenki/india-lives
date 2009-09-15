package com.easymvc.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Sep 15, 2009 12:24:10 PM
 * 
 */


public class PrivilegeDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;
     private String description;

    public PrivilegeDO() {
    }

    public PrivilegeDO(Integer id, String name, String description) {
       this.id = id;
       this.name = name;
       this.description = description;
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

	
	
	public String getTableName() {
		return "PRIVILEGES";
	}





}


