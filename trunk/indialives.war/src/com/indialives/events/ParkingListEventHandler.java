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
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.ParkingDOFactory;
import com.indialives.dofactory.ParkingSlotDOFactory;
import com.indialives.voobjects.ParkingSlotVO;

public class ParkingListEventHandler implements EventHandler,SetAttributeConstants,PageNameConstants {
	
	List<RowObject> parkingList=null;
	List<RowObject> parkingSlotList=null;
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(ParkingListEventHandler.PARKING_LIST_PAGE);
		dispatcher.forward(request,response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		parkingSlotList=ParkingSlotDOFactory.getParkingSlotList();
		HashMap<Integer,List<ParkingSlotVO>> parkingMap=new HashMap<Integer, List<ParkingSlotVO>>();
	
		for(int i=0;i<parkingSlotList.size();i++){
			ParkingSlotVO parkingSlotVO=(ParkingSlotVO) parkingSlotList.get(i);
			Integer parkingId=parkingSlotVO.getParkingId();
			List<ParkingSlotVO> list = parkingMap.get(parkingId);
			if(list==null){
				list = new ArrayList<ParkingSlotVO>();
			}
	        list.add(parkingSlotVO);
	        parkingMap.put(parkingId,list);
		}	
		
		HttpSession httpSession = request.getSession();		
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		
		
		parkingList=ParkingDOFactory.getParkingList(communityId);
		request.setAttribute(PARKING_SLOT_LIST,parkingMap);
		request.setAttribute(PARKING_LIST,parkingList);
		
	}
	


}
