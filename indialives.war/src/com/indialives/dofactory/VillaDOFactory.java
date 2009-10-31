package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.easymvc.reader.csv.CsvReader;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.VillaDO;
import com.indialives.formbean.Villas;

public class VillaDOFactory implements SQLConstants {

	public static VillaDO getVillaDetails(String propertyId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(propertyId);
		VillaDO villaDO=(VillaDO) persistenceManager.find(VillaDO.class,VILLA_PROPERTIES_INFO,paramList);
		return villaDO;
	}

	public static List<RowObject> getVillaList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(VillaDO.class,GET_VILLA_LIST, paramList);
		return list;
	}

	public static List<RowObject> getVillaListForAdd() {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		List<RowObject> list=persistenceManager.findCollection(VillaDO.class,GET_VILLA_LIST_FOR_ADMIN, paramList);
		return list;		
	}

	public static void addVilla(Villas villas, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		paramList.add(villas.getPlotNo());
		paramList.add(villas.getNoOfFloors());
		paramList.add(villas.getName());
		paramList.add(villas.getNoOfBedRooms());
		paramList.add(villas.getNoOfParkings());
		persistenceManager.create(ADD_VILLA, paramList);
		
	}

	public static void addVillasCSV(CsvReader csvReader, String communityId) {
		
		for(int i=1;i<csvReader.getNumberOfRows();i++){
			List<?> rowList=csvReader.getRowValues(i);			
			String plotNo=  rowList.get(0).toString();
			String noOfFloors=rowList.get(1).toString();
			String name=rowList.get(2).toString();
			String noOfBedRooms=rowList.get(3).toString();
			String noOfParkings=rowList.get(4).toString();
			addBulkVillas(communityId,plotNo,noOfFloors,name,noOfBedRooms,noOfParkings);
		}
		
	}
	
	public static void addBulkVillas(String communityId,String plotNo, String noOfFloors,String name,String noOfBedRooms,String noOfParkings ) {
		Integer pNo=Integer.valueOf(plotNo);
		Integer noFloors=Integer.valueOf(noOfFloors);
		String villaName=String.valueOf(name);
		Integer noBedrooms=Integer.valueOf(noOfBedRooms);
		Integer noParkings=Integer.valueOf(noOfParkings);
		
		addBulkVillas(communityId,pNo,noFloors,villaName,noBedrooms,noParkings);
		
	}

	private static void addBulkVillas(String communityId, Integer plotNo,
			Integer noOfFloors, String name, Integer noOfBedRooms,
			Integer noOfParkings) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		paramList.add(plotNo);
		paramList.add(noOfFloors);
		paramList.add(name);
		paramList.add(noOfBedRooms);
		paramList.add(noOfParkings);
		persistenceManager.create(ADD_VILLA, paramList);
		
	}

}
