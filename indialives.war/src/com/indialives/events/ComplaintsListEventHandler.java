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
import com.indialives.dofactory.ComplaintDOFactory;

public class ComplaintsListEventHandler implements  EventHandler,SetAttributeConstants,PageNameConstants{
	
	private List<RowObject> complaintsList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(COMPLAINTS_LIST);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		HttpSession httpSession=request.getSession();
		String communityId=request.getParameter("gatedCommunityId");

		if(communityId==null){
			communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		}
	
		httpSession.setAttribute(COMMUNITY_ID, communityId);
		
		complaintsList=ComplaintDOFactory.getComplaintsList(userId,communityId);
		request.setAttribute(GET_COMPLAINTS_LIST,complaintsList);
		
	}

}
