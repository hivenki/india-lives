package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.UserDO;
import com.indialives.formbean.LoginUser;
import com.indialives.formbean.Users;
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

	public static void addUser(Users users) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(users.getEmailId());
		paramList.add(users.getPassword());
		paramList.add(users.getMobileNo());
		paramList.add(users.getFirstName());
		paramList.add(users.getLastName());
		persistenceManager.create(ADD_USER, paramList);		
	}

	public static UserDO findPassword(String username) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(username);
		paramList.add(username);
		UserDO userDO=(UserDO) persistenceManager.find(UserDO.class,FIND_PASSWORD,paramList);
		return userDO;
	}

	public static void updatePassword(String resetPassword,String username) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(resetPassword);
		paramList.add(username);
		paramList.add(username);
		persistenceManager.update(UPDATE_PASSWORD, paramList);		
	}

	public static List<RowObject> getUserList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> userList=persistenceManager.findCollection(UsersVO.class,GET_USER_LIST, paramList);
		return userList;
	}

	public static List<RowObject> getUserListNotThisCommunity() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		List<RowObject> userList=persistenceManager.findCollection(UsersVO.class,GET_USER_LIST_NOT_THIS_COMMUNITY, paramList);
		return userList;		
	}

	public static UserDO getUserInfo(int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(userId);
		UserDO userDO=(UserDO) persistenceManager.find(UserDO.class, GET_USER_INFO, paramList);
		return userDO;
	}

	public static void updateUserProfile(int userId, String firstName, String lastName,String password) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(firstName);
		paramList.add(lastName);
		paramList.add(password);
		paramList.add(userId);
		persistenceManager.update(UPDATE_USER_PROFILE, paramList);		
	}

	

	

}
