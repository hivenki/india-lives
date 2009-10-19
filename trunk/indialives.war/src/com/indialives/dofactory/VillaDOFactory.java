package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.VillaDO;

public class VillaDOFactory implements SQLConstants {

	public static VillaDO getVillaDetails(String propertyId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyId);
		VillaDO villaDO=(VillaDO) persistenceManager.find(VillaDO.class,VILLA_PROPERTIES_INFO,paramList);
		return villaDO;
	}

}
