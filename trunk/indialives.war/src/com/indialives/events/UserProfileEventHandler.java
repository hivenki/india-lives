package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dataobjects.UserDO;
import com.indialives.dofactory.UserDOFactory;

public class UserProfileEventHandler implements EventHandler,PageNameConstants,SetAttributeConstants{

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(USER_PROFILE);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		UserDO userDO=UserDOFactory.getUserInfo(userId);
		request.setAttribute(GET_USER_INFO, userDO);
		
	}

}
