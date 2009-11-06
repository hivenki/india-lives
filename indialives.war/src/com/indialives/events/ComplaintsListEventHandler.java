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
	
	private List<RowObject> complaintsListForOpen=null;
	private List<RowObject> complaintsListForInProgress=null;
	private List<RowObject> complaintsListForClosed=null;
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
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		String noRecords="18";
		
		/*if(request.getParameter(noRecords)!=null){
			noRecords=request.getParameter(noRecords);
		}*/
		httpSession.setAttribute(NO_RECORDS, noRecords);
		int roleId=session.getUser().getRoleId();
		
		if(roleId==1){
			complaintsListForOpen=ComplaintDOFactory.getComplaintsListBasedOnAdminForOpen(communityId);
			complaintsListForInProgress=ComplaintDOFactory.getComplaintsListBasedOnAdminForInProgress(communityId);
			complaintsListForClosed=ComplaintDOFactory.getComplaintsListBasedOnAdminForClosed(communityId);
		
		}else{
			complaintsListForOpen=ComplaintDOFactory.getComplaintsListForOpen(userId, communityId);
			complaintsListForInProgress=ComplaintDOFactory.getComplaintsListForInProgress(userId, communityId);
			complaintsListForClosed=ComplaintDOFactory.getComplaintsListForClosed(userId, communityId);
		}
		
		request.setAttribute(GET_COMPLIANTS_LIST_FOR_OPEN,complaintsListForOpen);
		request.setAttribute(GET_COMPLIANTS_LIST_FOR_IN_PROGRESS,complaintsListForInProgress);
		request.setAttribute(GET_COMPLIANTS_LIST_FOR_CLOSED,complaintsListForClosed);
		
		
		
		
		
	}

}
