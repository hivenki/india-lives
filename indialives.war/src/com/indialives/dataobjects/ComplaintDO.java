package com.indialives.dataobjects;
/**
 * Generated through EasyMVC Code Generation Framework
 * @author Vijayan Srinivasan
 * @since Oct 12, 2009 7:27:45 PM
 * 
 */

import java.util.Date;

public class ComplaintDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
 {

	private static final long serialVersionUID = 1L;

     private Integer id;
     private Integer propertyContextId;
     private Integer severityId;
     private FlatDO flatDO;
     private UserDO userDO;
     private ComplaintTypeEnumDO complaintTypeEnumDO;
     private SeverityEnumDO severityEnumDO;
     private Date raisedTime;
     private String description;
     private Date availableStartTime;
     private Date availableEndTime;
     private Integer raisedBy;
     private Integer statusId;

    public ComplaintDO() {
    }

    public ComplaintDO(Integer id, FlatDO flatDO, UserDO userDO, ComplaintTypeEnumDO complaintTypeEnumDO, SeverityEnumDO severityEnumDO, Date raisedTime, String description, Date availableStartTime, Date availableEndTime) {
       this.id = id;
       this.flatDO = flatDO;
       this.userDO = userDO;
       this.complaintTypeEnumDO = complaintTypeEnumDO;
       this.severityEnumDO = severityEnumDO;
       this.raisedTime = raisedTime;
       this.description = description;
       this.availableStartTime = availableStartTime;
       this.availableEndTime = availableEndTime;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public FlatDO getFlatDO() {
        return this.flatDO;
    }
    
    public void setFlatDO(FlatDO flatDO) {
        this.flatDO = flatDO;
    }
    public UserDO getUserDO() {
        return this.userDO;
    }
    
    public void setUserDO(UserDO userDO) {
        this.userDO = userDO;
    }
    public ComplaintTypeEnumDO getComplaintTypeEnumDO() {
        return this.complaintTypeEnumDO;
    }
    
    public void setComplaintTypeEnumDO(ComplaintTypeEnumDO complaintTypeEnumDO) {
        this.complaintTypeEnumDO = complaintTypeEnumDO;
    }
    public SeverityEnumDO getSeverityEnumDO() {
        return this.severityEnumDO;
    }
    
    public void setSeverityEnumDO(SeverityEnumDO severityEnumDO) {
        this.severityEnumDO = severityEnumDO;
    }
    public Date getRaisedTime() {
        return this.raisedTime;
    }
    
    public void setRaisedTime(Date raisedTime) {
        this.raisedTime = raisedTime;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public Date getAvailableStartTime() {
        return this.availableStartTime;
    }
    
    public void setAvailableStartTime(Date availableStartTime) {
        this.availableStartTime = availableStartTime;
    }
    public Date getAvailableEndTime() {
        return this.availableEndTime;
    }
    
    public void setAvailableEndTime(Date availableEndTime) {
        this.availableEndTime = availableEndTime;
    }

	
	
	public String getTableName() {
		return null;
	}

	public Integer getPropertyContextId() {
		return propertyContextId;
	}

	public void setPropertyContextId(Integer propertyContextId) {
		this.propertyContextId = propertyContextId;
	}

	public Integer getSeverityId() {
		return severityId;
	}

	public void setSeverityId(Integer severityId) {
		this.severityId = severityId;
	}

	public Integer getRaisedBy() {
		return raisedBy;
	}
	public void setRaisedBy(Integer raisedBy) {
		this.raisedBy = raisedBy;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	



}


