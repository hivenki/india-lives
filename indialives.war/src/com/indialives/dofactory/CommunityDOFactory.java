package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.voobjects.CommunityVO;

public class CommunityDOFactory implements SQLConstants{
	public static List<RowObject> getCommunitiesBasedOnId(int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(userId);
		List<RowObject> list=persistenceManager.findCollection(CommunityVO.class,GET_USER_COMMUNITIES, paramList);
		return list;
	}
}
