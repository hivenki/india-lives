package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.easymvc.reader.csv.CsvReader;
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
	public static List<String> addParkingSlots(HashMap<String, Integer> hashMap,
			CsvReader csvReader) {		
		List<String> list=new ArrayList<String>();
		for(int i=1;i<csvReader.getNumberOfRows();i++){
			List<?> rowList=csvReader.getRowValues(i);
			Integer parkingId=hashMap.get(rowList.get(0));
			if(parkingId==null){
				list.add((String) rowList.get(0));
			}else{
				String location=(String)rowList.get(1);	
				addParkingSlot(parkingId, location);
			}
		}
		
		return list;
	}

}
