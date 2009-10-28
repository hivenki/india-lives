package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.formbean.Compliants;
import com.indialives.util.DateUtil;
import com.indialives.voobjects.ComplaintsVO;

public class ComplaintDOFactory implements SQLConstants {

	public static void addComplaint(Compliants compliants, int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(compliants.getPropertyId());
		paramList.add(userId);
		paramList.add(new Date());
		paramList.add(compliants.getTypeId());		
		paramList.add(compliants.getDescription());
		Date avialStartTime=DateUtil.getDateFromString(compliants.getAvailableStartTime(),"dd-MM-yyyy");
		Date avialEndTime=DateUtil.getDateFromString(compliants.getAvailableEndTime(),"dd-MM-yyyy");		
		paramList.add(avialStartTime);
		paramList.add(avialEndTime);
		paramList.add(compliants.getSeverityId());	
		persistenceManager.create(ADD_COMPLAINTS, paramList);		
	}
	
	public static List<RowObject> getComplaintsListBasedOnAdmin(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST_BY_ADMIN, paramList);
		return list;
	}

	public static List<RowObject> getComplaintsList(int userId, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(userId);
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST, paramList);
		return list;
	}

}
