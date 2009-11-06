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
import com.indialives.dofactory.ComplaintDOFactory;
import com.indialives.dofactory.ComplaintStatusEnumDOFactory;
import com.indialives.voobjects.ComplaintsVO;

public class ComplaintDetailsEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {
	
	private List<RowObject> complaintStatusList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(COMPLAINT_DETAILS_PAGE);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String complaintId=request.getParameter("complaintId");
		
		ComplaintsVO complaintsVO=ComplaintDOFactory.getComplaintsListDetails(complaintId);
		
		complaintStatusList=ComplaintStatusEnumDOFactory.getComplaintStatusList();
		
		request.setAttribute(COMPLAINT_DETAILS,complaintsVO);
		request.setAttribute(COMPLAINT_STATUS_LIST,complaintStatusList);
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute(COMPLAINT_ID, complaintId);
	}

}
