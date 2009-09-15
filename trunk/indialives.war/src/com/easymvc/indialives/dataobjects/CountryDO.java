package com.easymvc.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Sep 15, 2009 12:24:10 PM
 * 
 */


public class CountryDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;

    public CountryDO() {
    }

    public CountryDO(Integer id, String name) {
       this.id = id;
       this.name = name;
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

	
	
	public String getTableName() {
		return "COUNTRIES";
	}





}


