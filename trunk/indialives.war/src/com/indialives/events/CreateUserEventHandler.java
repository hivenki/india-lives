package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.eventhandler.NonAuthenticatedHandler;
import com.indialives.PageNameConstants;

public class CreateUserEventHandler implements NonAuthenticatedHandler,EventHandler,PageNameConstants{

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(ADD_USER);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
	}

}
