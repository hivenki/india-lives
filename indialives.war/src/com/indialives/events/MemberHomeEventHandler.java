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
import com.indialives.dofactory.UserDOFactory;


public class MemberHomeEventHandler implements EventHandler,PageNameConstants,SetAttributeConstants{
	
	private List<RowObject> gatedCommunityList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(MEMBER_HOME);
		dispatcher.forward(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		gatedCommunityList=UserDOFactory.getCommunitiesBasedOnId(userId);
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute(COMMUNITY_ID,null);
		request.setAttribute(COMMUNITY_LIST,gatedCommunityList);
		
	}

}
