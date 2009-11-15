package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.ParkingSlotDO;
import com.indialives.formbean.ParkingSlot;
import com.indialives.voobjects.ParkingSlotVO;

public class ParkingSlotDOFactory implements SQLConstants {

	public static ParkingSlotVO getParkingDetails(String propertyId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyId);
		ParkingSlotVO parkingSlotVO=(ParkingSlotVO) persistenceManager.find(ParkingSlotVO.class,PARKING_PROPERTIES_INFO,paramList);
		return parkingSlotVO;
	}

	public static List<RowObject> getParkingSlotList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(ParkingSlotVO.class,GET_PARKING_SLOT_LIST, paramList); 
		return list;	
	}

	public static void addParkingSlot(Integer parkingId, String location, Integer propertyId, Integer propertyTypeId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyTypeId);
		paramList.add(propertyId);
		paramList.add(parkingId);
		paramList.add(location);
		persistenceManager.create(ADD_PARKING_SLOT, paramList);	
		
	}

	public static List<RowObject> getParkingSlotListForAssigningProperty(String propertyId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyId);
		List<RowObject> list=persistenceManager.findCollection(ParkingSlotVO.class,GET_PARKING_SLOT_LIST_FOR_ASSIGNING_PROPERTY, paramList); 
		return list;
	}

	public static void addParkingSlot(ParkingSlot parkingSlot) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(parkingSlot.getPropertyTypeId());
		paramList.add(parkingSlot.getPropertyId());
		paramList.add(parkingSlot.getParkingId());
		paramList.add(parkingSlot.getLocation());
		persistenceManager.create(ADD_PARKING_SLOT, paramList);	
	}

	public static ParkingSlotDO getParkingSlot(ParkingSlot parkingSlot) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(parkingSlot.getParkingId());
		paramList.add(parkingSlot.getPropertyTypeId());
		paramList.add(parkingSlot.getPropertyId());
		paramList.add(parkingSlot.getLocation());
		ParkingSlotDO parkingSlotDO=(ParkingSlotDO) persistenceManager.find(ParkingSlotDO.class, GET_PARKING_SLOT_BY_LOCATION, paramList);
		return parkingSlotDO;
	}

}
