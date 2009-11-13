package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.eventhandler.EventHandler;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.NoticeDOFactory;
import com.indialives.voobjects.NoticeVO;

public class ShowNoticeDetailEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants{
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(SHOW_NOTICE_DETAIL);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();		
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		String editNoticeId=request.getParameter("editNoticeId");
		if(editNoticeId==null){
			editNoticeId=httpSession.getAttribute(EDIT_NOTICE_ID).toString();
		}
		httpSession.setAttribute(EDIT_NOTICE_ID, editNoticeId);
		NoticeVO noticeVO=NoticeDOFactory.findNoticeForDetails(editNoticeId,communityId);
		request.setAttribute(NOTICE__OBJ, noticeVO);
	}

}
