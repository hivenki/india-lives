package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.HashSet;
import java.util.Set;

public class AdTypeDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private String name;
     private String description;
     private Integer width;
     private Integer height;
     private String fileFormat;
     private Set<AdvertisementDO> advertisementDOs = new HashSet<AdvertisementDO>(0);

    public AdTypeDO() {
    }

	
    public AdTypeDO(Integer id, String name, String description, Integer width, Integer height, String fileFormat) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.width = width;
        this.height = height;
        this.fileFormat = fileFormat;
    }
    public AdTypeDO(Integer id, String name, String description, Integer width, Integer height, String fileFormat, Set<AdvertisementDO> advertisementDOs) {
       this.id = id;
       this.name = name;
       this.description = description;
       this.width = width;
       this.height = height;
       this.fileFormat = fileFormat;
       this.advertisementDOs = advertisementDOs;
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
    public Integer getWidth() {
        return this.width;
    }
    
    public void setWidth(Integer width) {
        this.width = width;
    }
    public Integer getHeight() {
        return this.height;
    }
    
    public void setHeight(Integer height) {
        this.height = height;
    }
    public String getFileFormat() {
        return this.fileFormat;
    }
    
    public void setFileFormat(String fileFormat) {
        this.fileFormat = fileFormat;
    }
    public Set<AdvertisementDO> getAdvertisementDOs() {
        return this.advertisementDOs;
    }
    
    public void setAdvertisementDOs(Set<AdvertisementDO> advertisementDOs) {
        this.advertisementDOs = advertisementDOs;
    }

	
	
	public String getTableName() {
		return null;
	}





}


