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
import com.indialives.dataobjects.ParkingSlotDO;
import com.indialives.dataobjects.PropertyTypeEnumDO;
import com.indialives.dofactory.ParkingDOFactory;
import com.indialives.dofactory.ParkingSlotDOFactory;
import com.indialives.dofactory.PropertyOwnerDOFactory;
import com.indialives.dofactory.PropertyTypeEnumDOFactory;
import com.indialives.formbean.ParkingSlot;
import com.indialives.voobjects.PropertiesVO;

public class UploadParkingSlotEventHandler implements EventHandler,Constants,MultipartConstants,ApplicationConstants,SetAttributeConstants {
	
	private Properties applicationProperties=null;
	private String[] uploadColumnNameOrder;
	private List<String> columnNames;
	private List<String> rowValues;
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
		List<RowObject> propertyTypeList=PropertyTypeEnumDOFactory.getPropertyList();
		List<RowObject> propertyList=PropertyOwnerDOFactory.getPropertiesList();
		
		
		
		CsvReader csvReader=getCsvReader(request);
		 if(csvReader!=null){
				columnNames=csvReader.getColumnNames();
				if( (columnNames.size()==4) == false ){
					formatErrorString="CSV File Must have 4 headers like this - Property Type,Property Name,Parking Name,Location";				
				}			
				else{
					isValidColumnOrder();					
					if(formatErrorString.length()==0){
						for(int i=1;i<csvReader.getNumberOfRows();i++){
							rowValues = (List<String>) csvReader.getRowValues(i);
							rowValues=updateRow(rowValues);
							if(rowValues.size()==4){	
							HashMap<String, Integer>propertyTypeMap=getPropertyTypeMap(propertyTypeList);
							HashMap<Integer, Map<String, Integer>>propertyMap=getPropertyMap(propertyList);	
							HashMap<String,Integer> parkingHashMap=getParkingHashMap(parkingList);
							validateParkingSlots(rowValues,i,parkingHashMap,csvReader,propertyTypeMap,propertyMap);
						   }
							else{
								if(rowValues.size()!=0){
									formatErrorString=formatErrorString+"Row No :"+i+" is invalid row ,";
								}
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
	
	private HashMap<Integer, Map<String, Integer>> getPropertyMap(List<RowObject> propertyList) {
		HashMap<Integer, Map<String, Integer>> propertyMap=new HashMap<Integer, Map<String,Integer>>();
		 for(RowObject rowObject : propertyList){
				PropertiesVO propertiesVO=(PropertiesVO) rowObject;
				Map<String, Integer> map=propertyMap.get(propertiesVO.getPropertyTypeId());
				if(map==null){
					map=new HashMap<String, Integer>();
				}
				map.put(propertiesVO.getPropertyName(), propertiesVO.getPropertyId());			
				propertyMap.put(propertiesVO.getPropertyTypeId(),map);

			}	
		return propertyMap;
	}

	private HashMap<String, Integer> getPropertyTypeMap(List<RowObject> propertyTypeList) {
		HashMap<String, Integer>propertyTypeMap=new HashMap<String, Integer>();
		 for(RowObject rowObject : propertyTypeList){
				PropertyTypeEnumDO propertyTypeEnumDO=(PropertyTypeEnumDO) rowObject;
				propertyTypeMap.put(propertyTypeEnumDO.getName(),propertyTypeEnumDO.getId());
			}
		return propertyTypeMap;
	}

	public  void validateParkingSlots(List<String> row,Integer rowIndex, HashMap<String, Integer> hashMap,CsvReader csvReader, HashMap<String, Integer> propertyTypeMap, HashMap<Integer, Map<String, Integer>> propertyMap) {		
			Integer parkingId=hashMap.get(row.get(2));
			String location=(String)row.get(3);	
				
			if(propertyTypeMap.get(row.get(0))==null){
	    		formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[0]+"' is not available in DB,";
	    	}
	    	if(propertyTypeMap.get(row.get(0))!=null){
	    		if(propertyMap.get(propertyTypeMap.get(row.get(0))).get(row.get(1))==null){
	        		formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[1]+"' is not available in DB,";
	        	}
	    	}
	    	if(parkingId==null){
				formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[2]+"' is not available in DB,";
			}
			if(location==null){
				formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[3]+"' is not available in DB,";
			}	
			if (propertyTypeMap.get(row.get(0))!=null && propertyMap.get(propertyTypeMap.get(row.get(0))).get(row.get(1))!=null && parkingId!=null && location!=null){
		    	Integer propertyTypeId=propertyTypeMap.get(row.get(0).toString().trim());
				Map<String, Integer> propertyNameMap=propertyMap.get(propertyTypeId);
				Integer propertyId=propertyNameMap.get(row.get(1).toString().trim());	
				ParkingSlot parkingSlot=new ParkingSlot();
				parkingSlot.setPropertyTypeId(propertyTypeId);
				parkingSlot.setPropertyId(propertyId);
				parkingSlot.setParkingId(parkingId);
				parkingSlot.setLocation(location); 
				ParkingSlotDO parkingSlotDO=ParkingSlotDOFactory.getParkingSlot(parkingSlot);
				if(parkingSlotDO==null){
					ParkingSlotDOFactory.addParkingSlot(parkingSlot);
				}
				else{
					formatErrorString=formatErrorString+"Row No : "+rowIndex+" Parking Location already exists,";
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
				formatErrorString="CSV File headers should be this order - Property Type,Property Name,Parking Name,Location";
				break;
			}			
		}		
	}
	
}
