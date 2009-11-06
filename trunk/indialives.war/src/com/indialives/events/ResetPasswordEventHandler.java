package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.eventhandler.NonAuthenticatedHandler;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dataobjects.UserDO;
import com.indialives.dofactory.UserDOFactory;

public class ResetPasswordEventHandler implements NonAuthenticatedHandler,EventHandler,SetAttributeConstants,PageNameConstants{
	private String message="";
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=forgotPassword&message="+message);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String resetPassword=request.getParameter("resetPasword");
		UserDO userDO=UserDOFactory.findPassword(username);
		if(userDO!=null){
			UserDOFactory.updatePassword(resetPassword,username);
			System.out.println(resetPassword);
			message="Your password has been reset.";
		//	request.setAttribute(RESET_PASSWORD_SUCCESS_MSG,message);
			
		}
		else{
			 message="Sorry! We are unable to reset password kindly contact the admin.";
			//request.setAttribute(RESET_PASSWORD_ERROR_MSG,message);
		}
	}

}
