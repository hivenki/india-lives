package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.VillaDOFactory;
import com.indialives.formbean.Villas;

public class AddVillaEventHandler implements EventHandler,Constants,SetAttributeConstants,PageNameConstants{

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=communityAdmin");
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession=request.getSession();
		String communityId=request.getParameter("gatedCommunityId");
		
	
		if(communityId==null){
			communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		}
		httpSession.setAttribute(COMMUNITY_ID, communityId);
		
		Villas villas=(Villas)request.getAttribute(FORM_BEAN);
		VillaDOFactory.addVilla(villas,communityId);
		
	}

}
