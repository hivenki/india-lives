package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.indialives.dofactory.NoticeDOFactory;

public class DeleteNoticeEventHandler implements EventHandler {

	private String noticeTypeId="";
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=noticeBoardList&noticeTypeId="+noticeTypeId);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		noticeTypeId=request.getParameter("noticeTypeId");
	
		if(noticeTypeId==null){
			noticeTypeId="1";		
		}
		String deleteNoticeIds=request.getParameter("deleteNoticeIds");
		String query="DELETE FROM NOTICES WHERE ID IN("+deleteNoticeIds+")";
		NoticeDOFactory.deleteNotice(query);
		
	}
}
