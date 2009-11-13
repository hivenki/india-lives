package com.indialives.events;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.NoticeBoardEnumDOFactory;
import com.indialives.dofactory.NoticeDOFactory;

public class NoticeBoardListEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {

	private List<RowObject> noticeTypeList=null;
	private List<RowObject> noticeBoardList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher= request.getRequestDispatcher(NOTICE_LIST_PAGE);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();		
		httpSession.setAttribute(CURRENT_CONTENT_LINK,"Notice Board");
		
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();		
		
		String noticeTypeId=request.getParameter("noticeTypeId");
		 
		if(noticeTypeId==null){
			noticeTypeId="1";		
		}
		request.setAttribute(NOTICE_TYPE_ID, noticeTypeId);
		noticeBoardList=NoticeDOFactory.getNoticeListBasedOnType(noticeTypeId,communityId);
		noticeTypeList=NoticeBoardEnumDOFactory.getNoticeBoardTypeList();
			
		request.setAttribute(NOTICE__TYPE_LIST,noticeTypeList);
		request.setAttribute(NOTICE_LIST_BASED_ON_NOTICE_TYPE, noticeBoardList);
	}

}
