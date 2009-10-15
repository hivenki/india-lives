package com.indialives.events;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.indialives.dataobjects.PropertyOwnerDO;
import com.indialives.dofactory.PropertyOwnerDOFactory;

public class CommunityHomeEventHandler implements EventHandler {
	
	private List<RowObject> propertyList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String communityId=request.getParameter("gatedCommunityId");
		propertyList=PropertyOwnerDOFactory.getPropertiesList(communityId);
		
	}

}
