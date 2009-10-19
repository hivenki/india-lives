package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.indialives.SQLConstants;
import com.indialives.voobjects.FlatVO;

public class FlatDOFactory implements SQLConstants {

	public static FlatVO getFlatDetails(String propertyId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> list=new ArrayList<Object>();
		list.add(propertyId);
		FlatVO flatVO=(FlatVO) persistenceManager.find(FlatVO.class,FLAT_PROPERTIES_INFO,list);
		return flatVO;
	}

}
