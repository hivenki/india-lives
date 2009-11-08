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
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.NoticeDOFactory;

public class NoticeBoardListEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {

	private List<RowObject> noticeBoardList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher= request.getRequestDispatcher(NOTICE_LIST_PAGE);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();		
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();		
	
		noticeBoardList=NoticeDOFactory.getNoticeList(communityId);
		request.setAttribute(NOTICE_LIST,noticeBoardList);
		
		Session session=SessionFactory.getSession(request);
		Integer roleId=session.getUser().getRoleId().intValue();
		
		Integer privilegeId=4;
		httpSession.setAttribute("PrivilegeId",privilegeId);
		request.setAttribute(ROLE_ID, roleId);
		
		
		
	}

}
