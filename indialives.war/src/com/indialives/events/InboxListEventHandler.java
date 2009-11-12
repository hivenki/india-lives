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
import com.indialives.dofactory.MessageDOFactory;

public class InboxListEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {

	private List<RowObject> inboxMessagesList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher= request.getRequestDispatcher(MESSAGE_LIST_PAGE);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();		
		String communityId = httpSession.getAttribute(COMMUNITY_ID).toString();		
		
		Session session=SessionFactory.getSession(request);
		Integer userid = session.getUser().getId();
		
		inboxMessagesList = MessageDOFactory.getMessagesList(userid, new Integer(Integer.parseInt(communityId)));
		request.setAttribute(MESSAGES_LIST, inboxMessagesList);
		
		Integer roleId=session.getUser().getRoleId().intValue();
		
		
		httpSession.setAttribute(CURRENT_CONTENT_LINK, "Inbox");
		request.setAttribute(ROLE_ID, roleId);
		
		
		
	}

}
