package com.indialives.events;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.ParkingDOFactory;
import com.indialives.dofactory.PropertyOwnerDOFactory;
import com.indialives.dofactory.PropertyTypeEnumDOFactory;

public class ShowParkingSlotEventHandler implements EventHandler,PageNameConstants,SetAttributeConstants {
	
	private List<RowObject> parkingList=null;
	private List<RowObject> propertyList=null;
	private List<RowObject> propertyTypeList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(ADD_PARKING_SLOT);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession=request.getSession();
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		String propertyTypeId=request.getParameter("propertyTypeId");
		
		if(propertyTypeId==null){
			propertyTypeId="1";
		}
		
		request.setAttribute(PROPERTY_TYPE_ID,propertyTypeId);	
		
		propertyList=PropertyOwnerDOFactory.getPropertiesForParkingSlot(propertyTypeId,communityId);
		request.setAttribute(PROPERTY_LIST_BASED_ON_TYPE, propertyList);
		
		propertyTypeList=PropertyTypeEnumDOFactory.getPropertyList();
		request.setAttribute(PROPERTY_ENUM_LIST,propertyTypeList);
		
		parkingList=ParkingDOFactory.getParkingList(communityId);
		request.setAttribute(PARKING_LIST,parkingList);
		
	}

}
