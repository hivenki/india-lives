package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.FlatDOFactory;

public class AddFlatTypeEventHandler implements EventHandler,Constants,SetAttributeConstants{

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=communityAdmin");
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String name=request.getParameter("name");
		String description=request.getParameter("description");
		FlatDOFactory.addFlatType(name,description);
		
		
	}

}
