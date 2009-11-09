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
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.BlockDOFactory;
import com.indialives.dofactory.FlatDOFactory;
import com.indialives.dofactory.ParkingDOFactory;
import com.indialives.dofactory.ParkingSlotDOFactory;
import com.indialives.dofactory.PropertyOwnerDOFactory;
import com.indialives.dofactory.PropertyTypeEnumDOFactory;
import com.indialives.dofactory.UserDOFactory;
import com.indialives.dofactory.VillaDOFactory;



public class CommunityAdminEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants{

	private List<RowObject> flatList=null;
	private List<RowObject> villaList=null;
	private List<RowObject> blockList=null;
	private List<RowObject> flatTypeList=null;
	private List<RowObject> parkingList=null;
	private List<RowObject> parkingSlotList=null;
	private List<RowObject> userList=null;
	private List<RowObject> propertyTypeList=null;
	private List<RowObject> propertyList=null;
	private List<RowObject> userForPropertyList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher=request.getRequestDispatcher(COMMUNITY_ADMIN);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession=request.getSession();
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		
		
		flatList=FlatDOFactory.getFlatList(communityId);
		villaList=VillaDOFactory.getVillaList(communityId);
		blockList=BlockDOFactory.getBlockList(communityId);
		flatTypeList=FlatDOFactory.getFlatTypeList();
		parkingList=ParkingDOFactory.getParkingList(communityId);
		parkingSlotList=ParkingSlotDOFactory.getParkingSlotList();
		userList=UserDOFactory.getUserList(communityId);
		
		
		
		if(httpSession.getAttribute(PROPERTY_TYPE_ID)==null){
			String propertyTypeId="1";
			httpSession.setAttribute(PROPERTY_TYPE_ID,propertyTypeId);		
			propertyList=PropertyOwnerDOFactory.getProperties(propertyTypeId,communityId);
			httpSession.setAttribute(PROPERTY_LIST_BASED_ON_TYPE, propertyList);
		}
		
		userForPropertyList=UserDOFactory.getUserList(communityId);		
		httpSession.setAttribute(USER_LIST_FOR_PROPERTY,userForPropertyList);
		
		propertyTypeList=PropertyTypeEnumDOFactory.getPropertyList();
		
		request.setAttribute(FLATS_LIST,flatList);
		request.setAttribute(VILLA_LIST,villaList);
		request.setAttribute(BLOCK_LIST,blockList);
		request.setAttribute(FLAT_TYPE_LIST,flatTypeList);
		request.setAttribute(PARKING_LIST,parkingList);
		request.setAttribute(PARKING_SLOT_LIST,parkingSlotList);
		request.setAttribute(GET_USER_LIST,userList);
		request.setAttribute(PROPERTY_ENUM_LIST,propertyTypeList);
		httpSession.setAttribute(CURRENT_CONTENT_LINK,"Admin");
	}

}
