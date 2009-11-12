package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.dofactory.PropertyOwnerDOFactory;

public class AddParkingSlotForPropertyEventHandle implements EventHandler{

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("eventhandler?event=propertiesList");
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String parkingSlotId=request.getParameter("parkingSlotId");
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		int propertTypeId=3;
		PropertyOwnerDOFactory.addParkingSlotProperty(parkingSlotId,propertTypeId,userId);
	}

}
