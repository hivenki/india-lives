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

	public static void addNotice(Notice notice, String communityId, int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		paramList.add(notice.getNoticeTypeId());
		paramList.add(DateUtil.getDateFromString(notice.getPostedDate()));
		paramList.add(notice.getSubject());
		paramList.add(notice.getDescription());
		paramList.add(userId);
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

	public static void updateNotice(Notice notice, int userId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(notice.getNoticeTypeId());
		paramList.add(DateUtil.getDateFromString(notice.getPostedDate()));
		paramList.add(notice.getSubject());
		paramList.add(notice.getDescription());
		paramList.add(userId);
		paramList.add(notice.getId());
		persistenceManager.update(UPDATE_NOTICE, paramList);
		
	}

	public static void deleteNotice(String query) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();	
		persistenceManager.delete(query, paramList);		
	}

	public static List<RowObject> getNoticeListBasedOnType(String noticeTypeId,String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(noticeTypeId);
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(NoticeVO.class, NOTICE_LIST_BASED_ON_NOTICE_TYPE, paramList);
		return list;
	}

	public static List<RowObject> getNoticeList(String noticeTypeId,String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(noticeTypeId);
		paramList.add(communityId);
		List<RowObject> list=persistenceManager.findCollection(NoticeVO.class, NOTICE_LIST_BASED_ON_NOTICE_TYPE, paramList);
		return list;
	}

	public static NoticeVO findNoticeForDetails(String editNoticeId,
			String communityId) {
		PersistenceManager persistenceManager=PersistenceManagerFactory.getJDBCManager();
		List<Object> paramList=new ArrayList<Object>();
		paramList.add(communityId);
		paramList.add(editNoticeId);
		NoticeVO noticeVO=(NoticeVO) persistenceManager.find(NoticeVO.class,NOTICE_DETAIL, paramList);
		return noticeVO;
	}
}
