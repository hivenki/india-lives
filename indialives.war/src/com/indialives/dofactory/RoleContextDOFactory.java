package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.indialives.SQLConstants;
import com.indialives.formbean.jaxb.UserRoleContexts;

public class RoleContextDOFactory implements SQLConstants{

	public static void addUserRoleContexts(UserRoleContexts userRoleContexts,
			String communityId) {
		for(int i=0;i<userRoleContexts.getUserIdCount();i++){
			String userId=userRoleContexts.getUserId(i);
			String roleId=userRoleContexts.getRoleId(i);
			addUserRoleContexts(userId,roleId,communityId);
		}
	}

	private static void addUserRoleContexts(String userId, String roleId,String communityId) {
		PersistenceManager persistenceManager = PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList = new ArrayList<Object>();
		paramList.add(userId);
		paramList.add(communityId);
		paramList.add(roleId);
		persistenceManager.create(ADD_USER_ROLE_CONTEXT, paramList);
	}

}
