package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.easymvc.reader.csv.CsvReader;
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

	public static List<RowObject> getPropertiesNameList(int userId, Integer propertyType, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(userId);
		paramList.add(propertyType);
		paramList.add(communityId);
		List<RowObject> propertyNameList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES__NAME_LIST, paramList);
		return propertyNameList;
		
	}

	public static List<RowObject> getProperties(String propertyTypeId, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyTypeId);
		paramList.add(communityId);
		List<RowObject> propertyList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES_LIST_BASED_ON_TYPE, paramList);
		return propertyList;
		
	}

	public static void addPropertyToOwner(String propertyId,String propertyTypeId,
			 String ownerId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyId);
		paramList.add(propertyTypeId);
		paramList.add(ownerId);
		persistenceManager.create(ADD_PROPERTY_OWNER, paramList);
		
	}

	public static List<String>  addPropertyOwnerCSV(CsvReader csvReader, HashMap<String, Integer> propertyTypeMap, HashMap<Integer, Map<String, Integer>> propertyMap, HashMap<String, Integer> userMap) {
		List<String> list=new ArrayList<String>();
		for(int i=1;i<csvReader.getNumberOfRows();i++){
			List<?> rowList=csvReader.getRowValues(i);			
			Integer propertyTypeId=propertyTypeMap.get(rowList.get(1).toString().trim());
			
			Map<String, Integer> propertyNameMap=propertyMap.get(propertyTypeId);
			Integer propertyId=propertyNameMap.get(rowList.get(0).toString().trim());			
			Integer ownerId=userMap.get(rowList.get(2).toString().trim());	
			
			if(propertyTypeId==null){
				list.add((String) rowList.get(0));
			}
			if(propertyId==null){
				list.add((String) rowList.get(1));
			}
			if(ownerId==null){
				list.add((String) rowList.get(2));
			}
			else{
				addPropertyToOwner(propertyId,propertyTypeId,ownerId);
			}
			
		}
		return list;
		
	}


	private static void addPropertyToOwner(Integer proId, Integer proTypeId,
			Integer userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();	
		paramList.add(proId);
		paramList.add(proTypeId);
		paramList.add(userId);
		persistenceManager.create(ADD_PROPERTY_OWNER, paramList);
		
	}

	public static List<RowObject> getPropertiesList() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		List<RowObject> propertiesList=persistenceManager.findCollection(PropertiesVO.class,GET_PROPERTIES_LIST_FROM_PROPERTIES, paramList);
		return propertiesList;
	}


}
