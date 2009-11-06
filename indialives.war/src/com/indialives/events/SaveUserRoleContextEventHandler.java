package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.RoleContextDOFactory;
import com.indialives.formbean.jaxb.UserRoleContexts;

public class SaveUserRoleContextEventHandler implements EventHandler,Constants,SetAttributeConstants {

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("eventhandler?event=communityAdmin");
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession=request.getSession();
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		UserRoleContexts userRoleContexts=(UserRoleContexts) request.getAttribute(Constants.FORM_BEAN);
		RoleContextDOFactory.addUserRoleContexts(userRoleContexts,communityId);
	}

}
