package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
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

	public static List<RowObject> getParkingSlotList() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		List<RowObject> list=persistenceManager.findCollection(ParkingSlotVO.class,GET_PARKING_SLOT_LIST, paramList); 
		return list;	
	}

	public static void addParkingSlot(String parkingId, String location) {
		Integer parId=Integer.valueOf(parkingId);		
		addParkingSlot(parId, location);
		
	}
	
	
	public static void addParkingSlot(Integer parkingId, String location) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(parkingId);
		paramList.add(location);		
		persistenceManager.create(ADD_PARKING_SLOT, paramList);	
		
	}

	public static List<RowObject> getParkingSlotListForAssigningProperty(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ParkingSlotVO.class,GET_PARKING_SLOT_LIST_FOR_ASSIGNING_PROPERTY, paramList); 
		return list;
	}

}
