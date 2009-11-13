package com.indialives.events;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.NoticeDOFactory;
import com.indialives.formbean.Notice;

public class UpdateNoticeEventHandler implements EventHandler,SetAttributeConstants,Constants,PageNameConstants{
	
	private String message="";
	private Integer noticeTypeId=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("eventhandler?event=noticeBoardList&message="+message+"&noticeTypeId="+noticeTypeId);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Notice notice=(Notice) request.getAttribute(FORM_BEAN);
		noticeTypeId=notice.getNoticeTypeId();
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		NoticeDOFactory.updateNotice(notice,userId);
		message="Notice is updated.";
		request.setAttribute(NOTICE__UPDATED_MSG, message);
	}

}
