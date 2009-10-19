package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.indialives.SQLConstants;
import com.indialives.voobjects.ParkingSlotVO;

public class ParkingSlotDOFactory implements SQLConstants {

	public static ParkingSlotVO getParkingDetails(String propertyId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyId);
		ParkingSlotVO parkingSlotVO=(ParkingSlotVO) persistenceManager.find(ParkingSlotVO.class,PARKING_PROPERTIES_INFO,paramList);
		return parkingSlotVO;
	}

}
