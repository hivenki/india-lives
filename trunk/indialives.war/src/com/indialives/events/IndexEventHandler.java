/**
 * 
 */
package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.eventhandler.NonAuthenticatedHandler;
import com.indialives.PageNameConstants;

/**
 * @author Vijayan Srinivasan
 * @since Sep 7, 2009 4:24:55 PM
 */
public class IndexEventHandler implements NonAuthenticatedHandler, EventHandler,PageNameConstants{

	public void forward(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		RequestDispatcher dispatcher=request.getRequestDispatcher(INDEX);
		dispatcher.forward(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	}

}
