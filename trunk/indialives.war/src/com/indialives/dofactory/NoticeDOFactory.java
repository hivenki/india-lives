package com.indialives.dofactory;

import java.util.ArrayList;
import java.util.List;

import com.easymvc.persistence.PersistenceManager;
import com.easymvc.persistence.PersistenceManagerFactory;
import com.easymvc.persistence.RowObject;
import com.indialives.SQLConstants;
import com.indialives.formbean.Notice;
import com.indialives.util.DateUtil;
import com.indialives.voobjects.NoticeVO;

public class NoticeDOFactory implements SQLConstants{

	public static List<RowObject> getNoticeList(String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(NoticeVO.class,GET_NOTICE_LIST, paramList);		
		return list;		
	}

	public static void addNotice(Notice notice, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		paramList.add(notice.getNoticeTypeId());
		paramList.add(DateUtil.getDateFromString(notice.getPostedDate()));
		paramList.add(notice.getSubject());
		paramList.add(notice.getDescription());
		paramList.add(notice.getPostedById());
		persistenceManager.create(ADD_NOTICE, paramList);
	}

	public static NoticeVO findNotice(String editNoticeId, String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		paramList.add(editNoticeId);
		NoticeVO noticeVO=(NoticeVO) persistenceManager.find(NoticeVO.class,EDIT_NOTICE, paramList);
		return noticeVO;
	}

	public static void updateNotice(Notice notice, String noticeId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(notice.getNoticeTypeId());
		paramList.add(DateUtil.getDateFromString(notice.getPostedDate()));
		paramList.add(notice.getSubject());
		paramList.add(notice.getDescription());
		paramList.add(notice.getPostedById());
		paramList.add(noticeId);
		persistenceManager.update(UPDATE_NOTICE, paramList);
		
	}

	public static void deleteNotice(String query) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();	
		persistenceManager.delete(query, paramList);		
	}
}
