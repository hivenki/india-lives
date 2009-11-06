package com.indialives.events;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.PropertyOwnerDOFactory;

public class PropertyOwnersEventHandler implements EventHandler,SetAttributeConstants {

	private List<RowObject> propertyList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=communityAdmin");
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession=request.getSession();
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		
		String propertyTypeId=request.getParameter("propertyTypeIds");
		
		propertyList=PropertyOwnerDOFactory.getProperties(propertyTypeId,communityId);
		httpSession.setAttribute(PROPERTY_LIST_BASED_ON_TYPE, propertyList);
		httpSession.setAttribute(PROPERTY_TYPE_ID, propertyTypeId);
		
	}

}
