package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.dataobjects.InboxDO;
import com.indialives.dataobjects.MessageDO;
import com.indialives.util.DateUtil;

public class MessageDOFactory implements SQLConstants {

	public static List<RowObject> getMessagesList(Integer userid, Integer communityId) {
		
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
        Integer inboxId = getInboxId(persistenceManager, userid, communityId);
        
		List<Object> paramList = new ArrayList<Object>();
		paramList.add(String.valueOf(inboxId));
		List<RowObject> list=persistenceManager.findCollection(MessageDO.class, GET_MESSAGE_LIST, paramList);		
		return list;		
	}
	

	public static void addMessage(MessageDO message, Integer userid, Integer communityId) {
		
		PersistenceManager persistenceManager = PersistenceManagerFactory.getJDBCManager();
		
        Integer inboxId = getInboxId(persistenceManager, userid, communityId);
		List<Object> paramList =new ArrayList<Object>();
		paramList.add(message.getSender());
		paramList.add(message.getSubject());
		paramList.add(message.getStatus());
		paramList.add(DateUtil.getDateFromString(message.getDate().toString()));
		paramList.add(message.getContent());
		paramList.add(inboxId);
		persistenceManager.create(ADD_MESSAGE, paramList);
	}

	public static void deleteMessage(String query) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();	
		persistenceManager.delete(query, paramList);		
	}
	
	private static Integer getInboxId(PersistenceManager pm,  Integer userid, Integer communityId ) {
		List<Object> paramList = new ArrayList<Object>();
		paramList.add(userid);
		paramList.add(communityId);
		InboxDO inboxDO=(InboxDO) pm.find(InboxDO.class, GET_INBOX_ID, paramList);
		if (inboxDO != null) {
		return inboxDO.getId();
		} else {
			return null;
		}
	}
	
}
