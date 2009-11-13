package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.NoticeDOFactory;
import com.indialives.formbean.Notice;

public class AddNoticeEventHandler implements EventHandler,Constants,PageNameConstants,SetAttributeConstants{
	private Integer noticeTypeId=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=noticeBoardList&noticeTypeId="+noticeTypeId);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Notice notice=(Notice)request.getAttribute(FORM_BEAN);
				
		noticeTypeId=notice.getNoticeTypeId();
		
		HttpSession httpSession = request.getSession();		
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		
		NoticeDOFactory.addNotice(notice,communityId,userId);
	}

}
