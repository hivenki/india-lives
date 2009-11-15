package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dataobjects.ParkingSlotDO;
import com.indialives.dofactory.ParkingSlotDOFactory;
import com.indialives.formbean.ParkingSlot;

public class AddParkingSlotEventHandler implements EventHandler,Constants,SetAttributeConstants,PageNameConstants{
	
	private boolean successAdd=true;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(successAdd){
			response.sendRedirect("eventhandler?event=communityAdmin");
		}
		else{
			RequestDispatcher dispatcher=request.getRequestDispatcher("eventhandler?event=showParkingSlot");
			dispatcher.forward(request, response);
		}
			
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ParkingSlot parkingSlot=(ParkingSlot) request.getAttribute(FORM_BEAN);
		ParkingSlotDO parkingSlotDO=ParkingSlotDOFactory.getParkingSlot(parkingSlot);
		
			if(parkingSlotDO==null){
				ParkingSlotDOFactory.addParkingSlot(parkingSlot);
				successAdd=true;
			}
			else{
				request.setAttribute(PARKING_SLOT_OBJ,parkingSlot);
				request.setAttribute(PARKING_LOCATION_ALREADY_EXISTS,"Parking Location already exists");
				successAdd=false;
			}
			
		
	}

}
