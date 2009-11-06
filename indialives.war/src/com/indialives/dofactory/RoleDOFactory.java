package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.RoleDO;

public class RoleDOFactory implements SQLConstants{

	public static List<RowObject> getRoleList() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		List<RowObject> userList=persistenceManager.findCollection(RoleDO.class,GET_ROLE_LIST, paramList);
		return userList;	
	}

}
