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

public class ManagementHandler implements EventHandler,SetAttributeConstants,PageNameConstants {
	
	List<RowObject> managementTaskList=null;
	List<RowObject> parkingSlotList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(ManagementHandler.MANAGEMENT_TASK_LIST_PAGE);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}
	
}
