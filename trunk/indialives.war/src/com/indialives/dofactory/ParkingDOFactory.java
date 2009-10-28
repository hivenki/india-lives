package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.ParkingDO;

public class ParkingDOFactory  implements SQLConstants{

	public static List<RowObject> getParkingList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ParkingDO.class,GET_PARKING_LIST, paramList); 
		return list;

	}

	public static void addParking(String name, String description, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(name);
		paramList.add(description);
		paramList.add(communityId);
		persistenceManager.create(ADD_PARKING, paramList);		
	}

}
