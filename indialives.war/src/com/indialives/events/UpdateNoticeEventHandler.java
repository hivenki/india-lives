package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.NoticeDOFactory;
import com.indialives.formbean.Notice;

public class UpdateNoticeEventHandler implements EventHandler,SetAttributeConstants,Constants,PageNameConstants{
	private String message="";
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("eventhandler?event=showEditNotice&message="+message);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Notice notice=(Notice) request.getAttribute(FORM_BEAN);
		String noticeId=request.getParameter("noticeId");
		NoticeDOFactory.updateNotice(notice,noticeId);
		message="Your notice is updated.";
		request.setAttribute(NOTICE__UPDATED_MSG, message);
	}

}
