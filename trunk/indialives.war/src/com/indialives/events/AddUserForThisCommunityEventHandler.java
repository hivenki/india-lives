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
import com.indialives.dofactory.RoleDOFactory;
import com.indialives.dofactory.UserDOFactory;

public class AddUserForThisCommunityEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants{
	private List<RowObject> userListForThisCommunity=null;
	private List<RowObject> roleList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(ADD_USER_FOR_THIS_COMMUNITY);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		userListForThisCommunity=UserDOFactory.getUserListNotThisCommunity();
		roleList=RoleDOFactory.getRoleList();
		request.setAttribute(GET_USER_LIST_FOR_THIS_COMMUNITY ,userListForThisCommunity);
		request.setAttribute(GET_ROLE_LIST ,roleList);
	}

}

