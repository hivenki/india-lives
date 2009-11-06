package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.easymvc.eventhandler.NonAuthenticatedHandler;
import com.indialives.PageNameConstants;
import com.indialives.dofactory.UserDOFactory;
import com.indialives.formbean.Users;

public class AddUserEventHandler implements NonAuthenticatedHandler,EventHandler,Constants,PageNameConstants {

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(INDEX);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Users users=(Users) request.getAttribute(FORM_BEAN);
		UserDOFactory.addUser(users);
	}

}
