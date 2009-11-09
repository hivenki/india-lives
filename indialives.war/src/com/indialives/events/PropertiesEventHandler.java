package com.indialives.events;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.easymvc.session.UserImpl;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dataobjects.PropertyTypeEnumDO;
import com.indialives.dofactory.PropertyOwnerDOFactory;
import com.indialives.voobjects.PropertiesVO;
import com.indialives.voobjects.RolePrivilegesVO;

public class PropertiesEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {
	
	
	private List<RowObject> propertyList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher=request.getRequestDispatcher(PROPERTY_HOME);
		dispatcher.forward(request,response);
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HttpSession httpSession=request.getSession();
		String communityId=request.getParameter("gatedCommunityId");
		if(communityId==null){
			communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		}
		httpSession.setAttribute(COMMUNITY_ID, communityId);
		Session session=SessionFactory.getSession(request);
		Integer roleId=(Integer) session.get(new Integer(communityId));
		UserImpl userImpl=(UserImpl) session.getUser();
		userImpl.setRoleId(roleId);	    
		
		HashMap<Integer, List<RolePrivilegesVO>> rolePrivilegesMap=(HashMap<Integer, List<RolePrivilegesVO>>) session.get(ROLE_PRIVILEGE_MAP);
		List<RolePrivilegesVO> rolePrivilegesList=rolePrivilegesMap.get(roleId);
		
		session.put(ROLE_PRIVILEGES_LIST,rolePrivilegesList);
		
		int userId=session.getUser().getId();
		propertyList=PropertyOwnerDOFactory.getPropertiesList(communityId,userId);
		HashMap<Integer,List<PropertiesVO>> propertyMap=new HashMap<Integer,List<PropertiesVO>>();
		for(int i=0;i<propertyList.size();i++){
			PropertiesVO propertiesVO=(PropertiesVO) propertyList.get(i);
			Integer propertTypeId=propertiesVO.getPropertyTypeId();
			List<PropertiesVO> list = propertyMap.get(propertTypeId);
			if(list==null){
				list = new ArrayList<PropertiesVO>();
			}
	        list.add(propertiesVO);
	        propertyMap.put(propertTypeId,list);
		}		
		
		List<PropertyTypeEnumDO> propertyEnumList=getPropertyEnumList();
		
				
		request.setAttribute(PROPERTY_LIST,propertyMap);
		request.setAttribute(PROPERTY_ENUM_LIST,propertyEnumList);
		httpSession.setAttribute(CURRENT_CONTENT_LINK,"Properties");
	
		
	}

	private List<PropertyTypeEnumDO> getPropertyEnumList() {
		List<PropertyTypeEnumDO> propertyEnumList=new ArrayList<PropertyTypeEnumDO>();
		PropertyTypeEnumDO propertyTypeEnumDO=new  PropertyTypeEnumDO();
		propertyTypeEnumDO.setId(1);
		propertyTypeEnumDO.setName("Flat");
		PropertyTypeEnumDO propertyTypeEnumDO1=new  PropertyTypeEnumDO();
		propertyTypeEnumDO1.setId(2);
		propertyTypeEnumDO1.setName("Villa");
	/*	PropertyTypeEnumDO propertyTypeEnumDO2=new  PropertyTypeEnumDO();
		propertyTypeEnumDO2.setId(3);
		propertyTypeEnumDO2.setName("Parking");*/
	   propertyEnumList.add(propertyTypeEnumDO);
	   propertyEnumList.add(propertyTypeEnumDO1);
  //   propertyEnumList.add(propertyTypeEnumDO2);
	   return propertyEnumList;
	}

}
