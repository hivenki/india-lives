package com.indialives.events;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.VillaDOFactory;

public class ShowVillaEventHandler implements EventHandler,PageNameConstants,SetAttributeConstants {
	
	private List<RowObject> villaList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(ADD_VILLAS);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		villaList=VillaDOFactory.getVillaListForAdd();
		request.setAttribute(VILLA_LIST,villaList);
		
	}

}
