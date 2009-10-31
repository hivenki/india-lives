package com.indialives.events;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.eventhandler.NonAuthenticatedHandler;
import com.easymvc.log.Logger;
import com.indialives.PageNameConstants;

public class ErrorEventHandler implements NonAuthenticatedHandler,EventHandler,PageNameConstants {
	
	private String errorMessage;
	Throwable errorObject=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Logger.debugMessage("Error Event Handler Forward Start\n\n");
		String errorPage=ERROR_PAGE;
		response.sendRedirect(errorPage+"?error="+errorMessage);
		Logger.debugMessage("Error Event Handler Forward Ends\n\n");

		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		errorObject=(Throwable) request.getAttribute("errObj");
		errorMessage=errorObject.getMessage();
		StringWriter stringWriter=new StringWriter();
		errorObject.printStackTrace(new PrintWriter(stringWriter));
		
	}

}
