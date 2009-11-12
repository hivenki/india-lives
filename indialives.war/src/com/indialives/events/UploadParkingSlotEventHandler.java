package com.indialives.events;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
	
	private Properties applicationProperties=null;
	private String[] uploadColumnNameOrder;
	private List<String> columnNames;
	private List<String> row;
	String formatErrorString="";
	
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
		List<RowObject> parkingList=ParkingDOFactory.getParkingList(communityId);
		CsvReader csvReader=getCsvReader(request);
		 if(csvReader!=null){
				columnNames=csvReader.getColumnNames();
				if( (columnNames.size()==2) == false ){
					formatErrorString="CSV File Must have 2 headers like this - Parking Name,Location";				
				}			
				else{
					isValidColumnOrder();					
					if(formatErrorString.length()==0){
						for(int i=1;i<csvReader.getNumberOfRows();i++){
							row = (List<String>) csvReader.getRowValues(i);
							row=updateRow(row);
							if(row.size()==2){							
							HashMap<String,Integer> parkingHashMap=getParkingHashMap(parkingList);
							validateParkingSlots(row,i,parkingHashMap,csvReader);
						   }
						}
					}		
				}
		 }
				
	    formatErrorString="Invalid CSV "+","+formatErrorString;
		httpSession.setAttribute(FORMAT_ERROR_STRING,formatErrorString);
	}
	private List<String> updateRow(List<String> src) {
		List<String> list = new ArrayList<String>();
		for(int i=0;i<src.size();i++){
			if(src.get(i).trim().length()!=0){
				list.add(src.get(i));
			}
		}
		return list;
	}

	private HashMap<String, Integer> getParkingHashMap(List<RowObject> parkingList) {
		HashMap<String,Integer> parkingHashMap=new HashMap<String, Integer>();
			for(RowObject rowObject : parkingList){
				ParkingDO parkingDO=(ParkingDO) rowObject;
				parkingHashMap.put(parkingDO.getName(),parkingDO.getId());
			}
		return parkingHashMap;
	}

	public  void validateParkingSlots(List<String> row,Integer rowIndex, HashMap<String, Integer> hashMap,CsvReader csvReader) {		
			isValidRow(rowIndex);
			Integer parkingId=hashMap.get(row.get(0));
			String location=(String)row.get(1);	
			if(parkingId!=null && location!=null){
				ParkingSlotDOFactory.addParkingSlot(parkingId, location);
			}
			else{
				if(parkingId==null){
					formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[0]+"' is not available in DB,";
				}
				if(location==null){
					formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[1]+"' is not available in DB,";
				}	
			}
	}


	private CsvReader getCsvReader(HttpServletRequest request) {
		applicationProperties=PropertyLoader.getProperties(APPLICATION_PROPERTIES_FILE_NAME);
		String serverLocation=applicationProperties.getProperty(FILE_STORAGE_LOCATION);
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
	
	private void isValidColumnOrder() {
		String columnNameOrder=applicationProperties.getProperty(UPLOAD_PARKING_COLUMN_NAME_ORDER);
		uploadColumnNameOrder=columnNameOrder.split(",");
		for(int i=0;i<columnNames.size();i++){
			String item=columnNames.get(i);
			if(item.equals(Constants.EMPTY_STRING)){
				formatErrorString="Headers should not be empty\n";
				break;
			}
			else if(item.equalsIgnoreCase(uploadColumnNameOrder[i])==false){
				formatErrorString="CSV File headers should be this order - Parking Name,Location";
				break;
			}			
		}		
	}
	private void isValidRow(int rowIndex) {
		if(row.size()==2){
			for(int i=0;i<row.size();i++){
				String item=row.get(i);				
				if(item.equalsIgnoreCase(Constants.EMPTY_STRING)){
					formatErrorString=formatErrorString+".Row No :"+rowIndex+"ColumnName - "+uploadColumnNameOrder[i]+" should not be empty,";
				}
			}
	    }
	}
}
