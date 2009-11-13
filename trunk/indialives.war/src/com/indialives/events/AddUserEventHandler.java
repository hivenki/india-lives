package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.easymvc.eventhandler.NonAuthenticatedHandler;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dataobjects.UserDO;
import com.indialives.dofactory.UserDOFactory;
import com.indialives.formbean.Users;

public class AddUserEventHandler implements NonAuthenticatedHandler,EventHandler,Constants,PageNameConstants,SetAttributeConstants {

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(USER_SUCCESSFULL_PAGE);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Users users=(Users) request.getAttribute(FORM_BEAN);
		UserDO userDOForEmail=UserDOFactory.findUserBasedOnEmail(users.getEmailId());
		UserDO userDOForMobile=UserDOFactory.findUserBasedOnMobileNo(users.getMobileNo());
		
		if(userDOForEmail==null && userDOForMobile==null){
			UserDOFactory.addUser(users);
		}else if(userDOForEmail!=null){
			request.setAttribute(USER_OBJECT, users);
			request.setAttribute(EMAIL_ALREADY_EXISTS,"Email Id already exists");
		}else if(userDOForMobile!=null){
			request.setAttribute(USER_OBJECT, users);
			request.setAttribute(MOBILE_NO_ALREADY_EXISTS,"Mobile No already exists");
		}
		
	}

}
