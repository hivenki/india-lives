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
import com.indialives.dofactory.FlatDOFactory;

public class ShowFlatTypeEventHandler implements EventHandler,PageNameConstants,SetAttributeConstants {
	
	private List<RowObject> flatTypeList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(ADD_FLAT_TYPE);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		HttpSession httpSession=request.getSession();
		String communityId=request.getParameter("gatedCommunityId");
		
	
		if(communityId==null){
			communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		}
		httpSession.setAttribute(COMMUNITY_ID, communityId);	
		
		flatTypeList=FlatDOFactory.getFlatTypeList();		
		request.setAttribute(FLATS_TYPE_LIST,flatTypeList);		
		
	}

}
