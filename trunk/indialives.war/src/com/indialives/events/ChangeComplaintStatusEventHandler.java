package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.ComplaintDOFactory;

public class ChangeComplaintStatusEventHandler implements EventHandler,Constants,PageNameConstants,SetAttributeConstants {

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=complaintsList");
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
				
		HttpSession httpSession=request.getSession();
		String complaintId=httpSession.getAttribute(COMPLAINT_ID).toString();
		String statusId=request.getParameter("statusId");
		
		ComplaintDOFactory.updateComplaintStaus(statusId,complaintId);
	}

}
