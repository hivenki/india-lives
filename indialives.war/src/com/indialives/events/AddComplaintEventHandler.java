package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.dofactory.ComplaintDOFactory;
import com.indialives.formbean.Complaint;

public class AddComplaintEventHandler implements EventHandler,Constants,PageNameConstants{

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("eventhandler?event=complaintsList");
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Complaint compliants=(Complaint)request.getAttribute(FORM_BEAN);
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		ComplaintDOFactory.addComplaint(compliants,userId);
	}

}
