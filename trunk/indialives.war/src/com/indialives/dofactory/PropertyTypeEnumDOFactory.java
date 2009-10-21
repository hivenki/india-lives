package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.PropertyTypeEnumDO;

public class PropertyTypeEnumDOFactory  implements SQLConstants{

	public static List<RowObject> getPropertyList() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		List<RowObject> list=persistenceManager.findCollection(PropertyTypeEnumDO.class,GET_PROPERTY_ENUM_LIST, paramList);		
		return list;
	}

}
