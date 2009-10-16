package com.indialives.events;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.PropertyOwnerDOFactory;

public class CommunityHomeEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {
	
	private List<RowObject> propertyList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher=request.getRequestDispatcher(PROPERTY_HOME);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String communityId=request.getParameter("gatedCommunityId");
		System.out.println(communityId);
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		propertyList=PropertyOwnerDOFactory.getPropertiesList(communityId,userId);
		request.setAttribute(PROPERTY_LIST,propertyList);
		
	}

}
