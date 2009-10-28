package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
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

}
