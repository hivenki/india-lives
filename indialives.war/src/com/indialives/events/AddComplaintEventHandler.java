package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.dofactory.ComplaintDOFactory;
import com.indialives.formbean.Compliants;

public class AddComplaintEventHandler implements EventHandler,Constants,PageNameConstants{

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher=request.getRequestDispatcher("eventhandler?event=complaintsList");
		dispatcher.forward(request,response);
		
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Compliants compliants=(Compliants)request.getAttribute(FORM_BEAN);
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		ComplaintDOFactory.addComplaint(compliants,userId);
	}

}
