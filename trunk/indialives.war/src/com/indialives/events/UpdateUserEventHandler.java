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
import com.easymvc.session.UserImpl;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.UserDOFactory;

public class UpdateUserEventHandler implements EventHandler,Constants,SetAttributeConstants,PageNameConstants{
	private String message="";
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("eventhandler?event=userProfile&message="+message);
		dispatcher.forward(request,response);		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");		
		UserImpl userImpl=(UserImpl) session.getUser();
		userImpl.setFirstName(firstName);
		userImpl.setLastName(lastName);
		String password=request.getParameter("password");
		
		UserDOFactory.updateUserProfile(userId,firstName,lastName,password);
		message="Your Profile has been updated.";
		request.setAttribute(UPDATE_PROFILE_MSG, message);
	}

}
