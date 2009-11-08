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
import com.indialives.dofactory.UserDOFactory;
import com.indialives.voobjects.NoticeVO;

public class ShowEditNoticeEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants{
	
	private List<RowObject> noticeBoardTypeList=null;
	private List<RowObject> postedByList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(SHOW_EDIT_NOTICE);
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
		
		NoticeVO noticeVO=NoticeDOFactory.findNotice(editNoticeId,communityId);
		
		noticeBoardTypeList=NoticeBoardEnumDOFactory.getNoticeBoardTypeList();
		postedByList=UserDOFactory.getUserList(communityId);
		
		request.setAttribute(NOTICE__TYPE_LIST,noticeBoardTypeList);
		request.setAttribute(GET_USER_LIST, postedByList);
		request.setAttribute(NOTICE__OBJ, noticeVO);
	}

}
