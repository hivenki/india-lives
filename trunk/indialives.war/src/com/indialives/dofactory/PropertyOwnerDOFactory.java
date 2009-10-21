package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.voobjects.PropertiesVO;

public class PropertyOwnerDOFactory implements SQLConstants{

	public static List<RowObject> getPropertiesList(String communityId,int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		paramList.add(userId);
		List<RowObject> propertyList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES_LIST, paramList);
		return propertyList;
	}

	public static List<RowObject> getPropertiesNameList(int userId, Integer propertyType) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(userId);
		paramList.add(propertyType);
		List<RowObject> propertyNameList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES__NAME_LIST, paramList);
		return propertyNameList;
		
	}

}
