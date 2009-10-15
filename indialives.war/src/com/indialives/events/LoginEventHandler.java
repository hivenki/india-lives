package com.indialives.events;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.easymvc.eventhandler.NonAuthenticatedHandler;
import com.easymvc.exception.AuthenticationException;
import com.easymvc.log.Logger;
import com.easymvc.property.PropertyLoader;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.IndiaLiveMessageConstants;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;

public class LoginEventHandler implements NonAuthenticatedHandler,EventHandler,PageNameConstants,IndiaLiveMessageConstants,Constants,SetAttributeConstants {

	private boolean validationFlag=false;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(validationFlag){
			RequestDispatcher dispatcher=request.getRequestDispatcher("eventhandler?event=memberHome");
			dispatcher.forward(request,response);
		}else{
			Properties properties=PropertyLoader.getProperties(MESSAGE_PROPERTIES_FILE_NAME);
			String message=properties.getProperty(INVALID_USER);
			request.setAttribute(AUTH_ERROR_MSG,message);
			response.sendRedirect(INDEX+"?AUTH_ERROR_MSG="+message);
		}
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session session;
		try {
			session=SessionFactory.createSession(request);
			if(session!=null){
				validationFlag=true;
			}
		} catch (AuthenticationException e) {
			Logger.infoMessage(e.getMessage());
		}
		
	}

}
