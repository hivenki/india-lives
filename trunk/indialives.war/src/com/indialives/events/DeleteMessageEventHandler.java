package com.indialives.events;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easymvc.eventhandler.EventHandler;
import com.indialives.dofactory.MessageDOFactory;

public class DeleteMessageEventHandler implements EventHandler {

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=inboxMessagesList");
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String deleteMessageIds=request.getParameter("deleteMessageIds");
		String query="DELETE FROM MESSAGES WHERE ID IN(" + deleteMessageIds + ")";
		MessageDOFactory.deleteMessage(query);
		
	}
}
