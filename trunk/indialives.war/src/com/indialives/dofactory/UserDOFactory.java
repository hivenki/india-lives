package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.CommunityDO;
import com.indialives.dataobjects.UserDO;
import com.indialives.formbean.LoginUser;

public class UserDOFactory implements SQLConstants{

	public static UserDO findValidUser(LoginUser loginUser) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> userList=new ArrayList<Object>();
		userList.add(loginUser.getUsername());
		userList.add(loginUser.getUsername());
		userList.add(loginUser.getPassword());
		UserDO userDO=(UserDO) persistenceManager.find(UserDO.class,FIND_VALID_USER,userList);
		return userDO;
	}

	public static List<RowObject> getCommunitiesBasedOnId(int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(userId);
		List<RowObject> list=persistenceManager.findCollection(CommunityDO.class,GET_USER_COMMUNITIES, paramList);
		return list;
	}

}
