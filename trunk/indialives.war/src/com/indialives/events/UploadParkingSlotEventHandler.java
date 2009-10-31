package com.indialives.events;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.Constants;
import com.easymvc.eventhandler.EventHandler;
import com.easymvc.http.multipart.MultipartConstants;
import com.easymvc.http.multipart.MultipartFileItem;
import com.easymvc.persistence.RowObject;
import com.easymvc.property.PropertyLoader;
import com.easymvc.reader.csv.CsvReader;
import com.indialives.ApplicationConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dataobjects.ParkingDO;
import com.indialives.dofactory.ParkingDOFactory;
import com.indialives.dofactory.ParkingSlotDOFactory;

public class UploadParkingSlotEventHandler implements EventHandler,Constants,MultipartConstants,ApplicationConstants,SetAttributeConstants {
	
	private CsvReader csvReader=null;
	private List<RowObject> parkingList=null;
	
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=communityAdmin");
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession=request.getSession();
		String communityId=request.getParameter("gatedCommunityId");
		
	
		if(communityId==null){
			communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		}
		httpSession.setAttribute(COMMUNITY_ID, communityId);
		
		
		csvReader=getCsvReader(request);
		parkingList=ParkingDOFactory.getParkingList(communityId);
		
		HashMap<String,Integer> hashMap=new HashMap<String, Integer>();
		for(RowObject rowObject : parkingList){
			ParkingDO parkingDO=(ParkingDO) rowObject;
			hashMap.put(parkingDO.getName(),parkingDO.getId());
		}		
		
		List<String> list =ParkingSlotDOFactory.addParkingSlots(hashMap,csvReader);
		String message=getErrorMessage(list);
		httpSession.setAttribute(PARKING_ERROR_LIST,message);			
	}

	

	private String getErrorMessage(List<String> list) {
		if(list.size()>0){
			String message="";				
			for(int i=0;i<list.size();i++){
				message=message+list.get(i);
			}
			return message;
		}
		return "";
	}



	

	private CsvReader getCsvReader(HttpServletRequest request) {
		Properties properties=PropertyLoader.getProperties(APPLICATION_PROPERTIES_FILE_NAME);
		String serverLocation=properties.getProperty(FILE_STORAGE_LOCATION);
		StringBuilder builder=new StringBuilder();
		builder.append(serverLocation);			
		Map<?,?> fileParameterMap=(Map<?,?>)request.getAttribute(MULTIPART_FILE_PARAMETER_MAP);
		MultipartFileItem multipartFileItem=(MultipartFileItem)fileParameterMap.get(FILE_TYPE_NAME);
		if(multipartFileItem!=null)
		{
			String userFileName=multipartFileItem.getClientFileName();
			builder.append("/"+userFileName);
		}		
		String csvUploadFile =  builder.toString();		
		File csvFile=new File(csvUploadFile);		
		CsvReader csvReader=new CsvReader(csvFile.getAbsolutePath());	
		return csvReader;
	}

}
