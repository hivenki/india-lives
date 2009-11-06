package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.formbean.Complaint;
import com.indialives.util.DateUtil;
import com.indialives.voobjects.ComplaintsVO;

public class ComplaintDOFactory implements SQLConstants {

	public static void addComplaint(Complaint compliants, int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(compliants.getPropertyId());
		paramList.add(userId);
		paramList.add(new Date());
		paramList.add(compliants.getTypeId());		
		paramList.add(compliants.getDescription());
		Date avialStartTime=DateUtil.getDateFromString(compliants.getAvailableStartTime());
		Date avialEndTime=DateUtil.getDateFromString(compliants.getAvailableEndTime());		
		paramList.add(avialStartTime);
		paramList.add(avialEndTime);
		paramList.add(compliants.getSeverityId());	
		persistenceManager.create(ADD_COMPLAINTS, paramList);		
	}
	
	public static List<RowObject> getComplaintsListBasedOnAdminForOpen(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST_BY_ADMIN_FOR_OPEN, paramList);
		return list;
	}
	
	public static List<RowObject> getComplaintsListBasedOnAdminForInProgress(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST_BY_ADMIN_FOR_IN_PROGRESS, paramList);
		return list;
	}
	
	public static List<RowObject> getComplaintsListBasedOnAdminForClosed(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST_BY_ADMIN_FOR_CLOSED, paramList);
		return list;
	}


	public static List<RowObject> getComplaintsListForOpen(int userId, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(userId);
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST_FOR_OPEN, paramList);
		return list;
	}
	
	public static List<RowObject> getComplaintsListForInProgress(int userId,
			String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(userId);
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST_FOR_IN_PROGRESS, paramList);
		return list;
		
	}
	
	
	public static List<RowObject> getComplaintsListForClosed(int userId, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(userId);
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST_FOR_CLOSED, paramList);
		return list;
	}

	public static ComplaintsVO getComplaintsListDetails(String compliantId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(compliantId);
		ComplaintsVO complaintsVO=(ComplaintsVO) persistenceManager.find(ComplaintsVO.class,GET_COMPLIANTS_LIST_DETAILS, paramList);
		return complaintsVO;
		
	}

	

	public static void updateComplaintStaus(String statusId, String complaintId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(statusId);
		paramList.add(complaintId);
		persistenceManager.update(UPDATE_COMPLAINT_LIST, paramList);
		
	}

	

}
