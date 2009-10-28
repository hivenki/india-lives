package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.indialives.SQLConstants;
import com.indialives.formbean.LoginUser;
import com.indialives.voobjects.UsersVO;

public class UserDOFactory implements SQLConstants{

	public static UsersVO findValidUser(LoginUser loginUser) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> userList=new ArrayList<Object>();
		userList.add(loginUser.getUsername());
		userList.add(loginUser.getUsername());
		userList.add(loginUser.getPassword());
		UsersVO userVO=(UsersVO) persistenceManager.find(UsersVO.class,FIND_VALID_USER,userList);
		return userVO;
	}

	

}
