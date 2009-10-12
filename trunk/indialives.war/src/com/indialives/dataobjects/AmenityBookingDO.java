package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.Date;

public class AmenityBookingDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private AmenityTypeEnumDO amenityTypeEnumDO;
     private UserDO userDO;
     private Date bookingTime;
     private Date startTime;
     private Date endTime;

    public AmenityBookingDO() {
    }

    public AmenityBookingDO(Integer id, AmenityTypeEnumDO amenityTypeEnumDO, UserDO userDO, Date bookingTime, Date startTime, Date endTime) {
       this.id = id;
       this.amenityTypeEnumDO = amenityTypeEnumDO;
       this.userDO = userDO;
       this.bookingTime = bookingTime;
       this.startTime = startTime;
       this.endTime = endTime;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public AmenityTypeEnumDO getAmenityTypeEnumDO() {
        return this.amenityTypeEnumDO;
    }
    
    public void setAmenityTypeEnumDO(AmenityTypeEnumDO amenityTypeEnumDO) {
        this.amenityTypeEnumDO = amenityTypeEnumDO;
    }
    public UserDO getUserDO() {
        return this.userDO;
    }
    
    public void setUserDO(UserDO userDO) {
        this.userDO = userDO;
    }
    public Date getBookingTime() {
        return this.bookingTime;
    }
    
    public void setBookingTime(Date bookingTime) {
        this.bookingTime = bookingTime;
    }
    public Date getStartTime() {
        return this.startTime;
    }
    
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
    public Date getEndTime() {
        return this.endTime;
    }
    
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

	
	
	public String getTableName() {
		return null;
	}





}


