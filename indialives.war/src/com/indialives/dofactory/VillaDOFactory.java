package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
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

}
