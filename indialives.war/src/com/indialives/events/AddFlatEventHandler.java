package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.indialives.dofactory.FlatDOFactory;
import com.indialives.formbean.Flats;

public class AddFlatEventHandler implements EventHandler,Constants{

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=communityAdmin");
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Flats flats=(Flats)request.getAttribute(FORM_BEAN);
		FlatDOFactory.addFlat(flats);
		
	}

}
