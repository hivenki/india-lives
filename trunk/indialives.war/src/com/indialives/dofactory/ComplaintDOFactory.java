package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.formbean.Compliants;
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
		paramList.add(compliants.getAvailableStartTime());
		paramList.add(compliants.getAvailableEndTime());
		paramList.add(compliants.getSeverityId());	
		persistenceManager.create(ADD_COMPLAINTS, paramList);		
	}

	public static List<RowObject> getComplaintsList(int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(userId);
		List<RowObject> list=persistenceManager.findCollection(ComplaintsVO.class,GET_COMPLIANTS_LIST, paramList);
		return list;
	}

}