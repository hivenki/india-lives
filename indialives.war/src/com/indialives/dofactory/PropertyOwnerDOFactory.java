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

	public static List<RowObject> getPropertiesNameList(int userId, String propertyTypeId, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(userId);
		paramList.add(propertyTypeId);
		paramList.add(communityId);
		List<RowObject> propertyNameList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES__NAME_LIST, paramList);
		return propertyNameList;
		
	}

	public static List<RowObject> getProperties(String propertyTypeId, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyTypeId);
		paramList.add(communityId);
		paramList.add(propertyTypeId);
		List<RowObject> propertyList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES_LIST_BASED_ON_TYPE, paramList);
		return propertyList;
		
	}

	public static void addPropertyToOwner(String propertyId,String propertyTypeId,
			 String ownerId, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyId);
		paramList.add(propertyTypeId);
		paramList.add(ownerId);
		paramList.add(communityId);
		persistenceManager.create(ADD_PROPERTY_OWNER, paramList);
		
	}


	public static void uploadPropertyToOwner(Integer proId, Integer proTypeId,
			Integer userId,String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();	
		paramList.add(proId);
		paramList.add(proTypeId);
		paramList.add(userId);
		paramList.add(communityId);
		persistenceManager.create(ADD_PROPERTY_OWNER, paramList);
		
	}

	public static List<RowObject> getPropertiesList() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		List<RowObject> propertiesList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES_LIST_FROM_PROPERTIES, paramList);
		return propertiesList;
	}

	public static void addParkingSlotProperty(String parkingSlotId, int propertTypeId,
			int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();	
		paramList.add(parkingSlotId);
		paramList.add(propertTypeId);
		paramList.add(userId);
		persistenceManager.create(ADD_PROPERTY_OWNER, paramList);
	}

	public static List<RowObject> getPropertyOwnerList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();	
		paramList.add(communityId);
		List<RowObject> propertyOwnerList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES_OWNER_LIST, paramList);
		return propertyOwnerList;
	}


}
