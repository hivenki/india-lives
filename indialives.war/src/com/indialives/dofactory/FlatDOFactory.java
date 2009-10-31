package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.easymvc.persistence.dataobject.CountDO;
import com.easymvc.reader.csv.CsvReader;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.FlatTypeEnumDO;
import com.indialives.formbean.Flats;
import com.indialives.voobjects.FlatVO;

public class FlatDOFactory implements SQLConstants {

	public static FlatVO getFlatDetails(String propertyId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> list=new ArrayList<Object>();
		list.add(propertyId);
		FlatVO flatVO=(FlatVO) persistenceManager.find(FlatVO.class,FLAT_PROPERTIES_INFO,list);
		return flatVO;
	}

	public static List<RowObject> getFlatList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(FlatVO.class,GET_FLAT_LIST, paramList); 
		return list;
	}

	public static List<RowObject> getFlatTypeList() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		List<RowObject> list=persistenceManager.findCollection(FlatTypeEnumDO.class,GET_FLAT__TYPE_LIST, paramList); 
		return list;
	}

	public static void addFlat(Flats flats) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(flats.getBlockId());
		paramList.add(flats.getFloor());
		paramList.add(flats.getFlatNo());
		paramList.add(flats.getFlatTypeId());
		paramList.add(flats.getNoOfBedRooms());
		persistenceManager.create(ADD_FLAT, paramList);		
	}

	public static void addFlatType(String name, String description) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(name);
		paramList.add(description);
		persistenceManager.create(ADD_FLAT_TYPE, paramList);	
		
	}

	public static void addBulkFlats(HashMap<String, Integer> bulkHashMap,
			HashMap<String, Integer> flatTypehashMap,CsvReader csvReader) {
		for(int i=1;i<csvReader.getNumberOfRows();i++){
			List<?> rowList=csvReader.getRowValues(i);
			Integer blockId=bulkHashMap.get(rowList.get(0));
			String floor=rowList.get(1).toString();
			String flatNo=rowList.get(2).toString();
			Integer flatTypeId=flatTypehashMap.get(rowList.get(3));
			String noOfBedRooms=rowList.get(4).toString();
			addBulkFlats(blockId,floor,flatNo,flatTypeId,noOfBedRooms);
		}
		
	}

	private static void addBulkFlats(Integer blockId, String floor,
			String flatNo, Integer flatTypeId, String noOfBedRooms) {
		Integer blockType=Integer.valueOf(blockId);
		Integer floorNo=Integer.valueOf(floor);
		String flatNumber=String.valueOf(flatNo);
		Integer flatType=Integer.valueOf(flatTypeId);
		Integer noBedRooms=Integer.valueOf(noOfBedRooms);
		
		addBulkFlats(blockType,floorNo,flatNumber,flatType,noBedRooms);
		
	}

	private static void addBulkFlats(Integer blockType, Integer floorNo,
			String flatNumber, Integer flatType, Integer noBedRooms) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		paramList.add(blockType);
		paramList.add(floorNo);
		paramList.add(flatNumber);
		paramList.add(flatType);
		paramList.add(noBedRooms);
		persistenceManager.create(ADD_FLAT, paramList);
		
	}

	public static List<RowObject> getAvailbleBlocks(String deleteBlockIds) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();		
		String query="SELECT DISTINCT (B.ID) AS BLOCK_ID,B.NAME AS BLOCK_NAME FROM FLATS F JOIN  BLOCKS B ON B.ID=F.BLOCK_ID WHERE F.BLOCK_ID IN  ("+deleteBlockIds+")";
		List<RowObject> list=persistenceManager.findCollection(FlatVO.class,query, paramList);
		return list;
	}

}
