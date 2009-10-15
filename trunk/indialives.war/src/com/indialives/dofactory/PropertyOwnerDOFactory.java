package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.PropertyTypeEnumDO;

public class PropertyOwnerDOFactory implements SQLConstants{

	public static List<RowObject> getPropertiesList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> propertyList=persistenceManager.findCollection(PropertyTypeEnumDO.class,GET_PROPERTIES_LIST, paramList);
		return propertyList;
	}

}
