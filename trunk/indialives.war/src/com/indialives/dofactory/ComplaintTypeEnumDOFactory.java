package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.ComplaintTypeEnumDO;

public class ComplaintTypeEnumDOFactory implements SQLConstants{

	public static List<RowObject> getComplaintTypes() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		List<RowObject> list=persistenceManager.findCollection(ComplaintTypeEnumDO.class,GET_COMPLAINT__TYPE_LIST, paramList);		
		return list;
	}

}
