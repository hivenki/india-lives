package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.BlockDO;
import com.indialives.formbean.Blocks;

public class BlockDOFactory implements SQLConstants{

	public static List<RowObject> getBlockList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(BlockDO.class,GET_BLOCK_LIST, paramList);
		return list;		
	}

	public static void addBlock(Blocks blocks, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(blocks.getName());
		paramList.add(blocks.getDescription());
		paramList.add(communityId);
		paramList.add(blocks.getNoOfFloors());
		persistenceManager.create(ADD_BLOCK, paramList);		
	}

}
