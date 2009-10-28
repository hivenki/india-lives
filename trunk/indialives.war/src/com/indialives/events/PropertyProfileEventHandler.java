package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dataobjects.VillaDO;
import com.indialives.dofactory.FlatDOFactory;
import com.indialives.dofactory.VillaDOFactory;
import com.indialives.voobjects.FlatVO;

public class PropertyProfileEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {

	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(PROPERTY_INFO);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String propertyId=request.getParameter("propertyId");
		String propertyTypeId=request.getParameter("propertyTypeId");
		
		if(propertyTypeId.equals("1")){
			FlatVO flatVO=FlatDOFactory.getFlatDetails(propertyId);
			request.setAttribute(PROPERTY_OBJ, flatVO);
			
		}
		else if(propertyTypeId.equals("2")){
			VillaDO villaDO=VillaDOFactory.getVillaDetails(propertyId);
			request.setAttribute(PROPERTY_OBJ, villaDO);
		}/*else{
			ParkingSlotVO parkingSlotVO=ParkingSlotDOFactory.getParkingDetails(propertyId);
			request.setAttribute(PROPERTY_OBJ, parkingSlotVO);
		}*/		
	}

}
