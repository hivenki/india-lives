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
import com.indialives.dataobjects.BlockDO;
import com.indialives.dataobjects.FlatTypeEnumDO;
import com.indialives.dofactory.BlockDOFactory;
import com.indialives.dofactory.FlatDOFactory;

public class UploadFlatEventHandler implements EventHandler,Constants,ApplicationConstants,MultipartConstants,SetAttributeConstants {
	
	
	private Properties applicationProperties=null;
	private String[] uploadColumnNameOrder;
	private List<String> columnNames;
	private List<String> row;
	String formatErrorString="";
	private static final String INT_SEQ="^[0-9]+$";
	
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=communityAdmin");
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession=request.getSession();
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();		
		List<RowObject> blockList=BlockDOFactory.getBlockList(communityId);
		List<RowObject> flatTypeEnumList=FlatDOFactory.getFlatTypeList();
		CsvReader csvReader=getCsvReader(request);
		 
		 if(csvReader!=null){
				columnNames=csvReader.getColumnNames();
				if( (columnNames.size()==5) == false ){
					formatErrorString="CSV File Must have 5 headers like this - Block Name,Floor,Flat No,Flat Type,No of Bedrooms";				
				}			
				else{
					isValidColumnOrder();
					if(formatErrorString.length()==0){
						for(int i=1;i<csvReader.getNumberOfRows();i++){
								row = (List<String>) csvReader.getRowValues(i);
								row=updateRow(row);
								if(row.size()==5){
									HashMap<String, Integer> blockHashMap=getBlockHashMap(blockList);
									HashMap<String, Integer> flatTypehashMap=getFlatHashMap(flatTypeEnumList);
									addFlatsIfValid(row,i,blockHashMap,flatTypehashMap);
								}
						 }
					}
				}
		 }
		 formatErrorString="Invalid CSV "+","+formatErrorString;
		 httpSession.setAttribute(FORMAT_ERROR_STRING, formatErrorString);		 
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

	private HashMap<String, Integer> getFlatHashMap(List<RowObject> flatTypeEnumList) {
		HashMap<String, Integer> flatTypehashMap = new HashMap<String, Integer>();
		 for(RowObject rowObject : flatTypeEnumList){
				FlatTypeEnumDO flatTypeEnumDO=(FlatTypeEnumDO) rowObject;
				flatTypehashMap.put(flatTypeEnumDO.getName(),flatTypeEnumDO.getId());
			}	
		 return flatTypehashMap;
	}

	private HashMap<String, Integer> getBlockHashMap(List<RowObject> blockList) {
		HashMap<String, Integer> blockHashMap = new HashMap<String, Integer>();
			for(RowObject rowObject : blockList){
				BlockDO blockDO=(BlockDO) rowObject;
				blockHashMap.put(blockDO.getName(),blockDO.getId());
			}	
		return blockHashMap;
	}
	

	public void addFlatsIfValid(List<String> row,Integer rowIndex, HashMap<String, Integer> blockHashMap,HashMap<String, Integer> flatTypehashMap) {
			isValidRow(rowIndex);
			Integer blockId=blockHashMap.get(row.get(0));
			Integer flatTypeId=flatTypehashMap.get(row.get(3));
			if(blockId!=null && flatTypeId!=null ){
			  String floor=row.get(1).toString();
			  String flatNo=row.get(2).toString();
			  String noOfBedRooms=row.get(4).toString();
			  FlatDOFactory.addBulkFlats(blockId,floor,flatNo,flatTypeId,noOfBedRooms);			
			}
			else{		    	
			  	if(blockId==null){
			   		formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[0]+"' is not available in DB,";
			    }
			    if(flatTypeId==null){
			    	formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[3]+"'is not available in DB,";
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
		String columnNameOrder=applicationProperties.getProperty(UPLOAD_FLAT_COLUMN_NAME_ORDER);
		uploadColumnNameOrder=columnNameOrder.split(",");
		for(int i=0;i<columnNames.size();i++){
			String item=columnNames.get(i);
			if(item.equals(Constants.EMPTY_STRING)){
				formatErrorString="Headers should not be empty";
				break;
			}
			else if(item.equalsIgnoreCase(uploadColumnNameOrder[i])==false){
				formatErrorString="CSV File headers should be this order - Block Name,Floor,Flat No,Flat Type,No of Bedrooms";
				break;
			}			
		}		
	}
	
	private void isValidRow(int rowIndex) {		
		if(row.size()==5){
			for(int i=0;i<row.size();i++){
				String item=row.get(i);				
				if(item.equalsIgnoreCase(Constants.EMPTY_STRING)){
					formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[i]+"' should not be empty,";
				}
				else if((i==1 || i==4)&& isNumber(item)==false){					   					
						formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[i]+"' should be integer value,";
				}
		}
	  }
	}
	
	private  boolean isNumber(String valueString){		
		return valueString.matches(INT_SEQ);
	}

}
