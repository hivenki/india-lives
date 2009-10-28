package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.voobjects.RolePrivilegesVO;

public class RolePrivilegesVOFactory implements SQLConstants {

	public static List<RowObject> getRolePrivilegesList() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		List<RowObject> rolePrivilegesList=persistenceManager.findCollection(RolePrivilegesVO.class,GET_ROLE_PRIVILEGS_LIST, paramList);
		return rolePrivilegesList;
	}

}
