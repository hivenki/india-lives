package com.indialives.events;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.ComplaintTypeEnumDOFactory;
import com.indialives.dofactory.PropertyOwnerDOFactory;
import com.indialives.dofactory.PropertyTypeEnumDOFactory;
import com.indialives.dofactory.SeverityEnumDOFactory;

public class ShowComplaintsEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {
	
	private List<RowObject> propertyList=null;
	private List<RowObject> propertyNameList=null;
	private List<RowObject> compliantTypeEnumList=null;
	private List<RowObject> severityTypeList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
		RequestDispatcher dispatcher=request.getRequestDispatcher(SHOW_COMPLAINTS);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		propertyList=PropertyTypeEnumDOFactory.getPropertyListWithoutParking();
		
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		String propertyTypeId=request.getParameter("propertyTypeIds");
		
		if(propertyTypeId==null){
			propertyTypeId="1";
		}
		
		request.setAttribute(PROPERTY_TYPE_ID,propertyTypeId);
		HttpSession httpSession=request.getSession();
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		
		propertyNameList=PropertyOwnerDOFactory.getPropertiesNameList(userId,propertyTypeId,communityId);
		compliantTypeEnumList=ComplaintTypeEnumDOFactory.getComplaintTypes();
		severityTypeList=SeverityEnumDOFactory.getSeverityTypeList();
		request.setAttribute(PROPERTY_ENUM_LIST,propertyList);
		request.setAttribute(PROPERTY_NAME_LIST, propertyNameList);
		request.setAttribute(COMPLAINT_TYPE_LIST, compliantTypeEnumList);
		request.setAttribute(SEVERITY_TYPE_LIST, severityTypeList);
		
	}

	

}
