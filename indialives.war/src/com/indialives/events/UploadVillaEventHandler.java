package com.indialives.events;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import com.easymvc.property.PropertyLoader;
import com.easymvc.reader.csv.CsvReader;
import com.indialives.ApplicationConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.VillaDOFactory;

public class UploadVillaEventHandler implements EventHandler,Constants,MultipartConstants,ApplicationConstants,SetAttributeConstants {
	
	
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
		String communityId=request.getParameter("gatedCommunityId");
		
	
		if(communityId==null){
			communityId=httpSession.getAttribute(COMMUNITY_ID).toString();
		}
		httpSession.setAttribute(COMMUNITY_ID, communityId);
		
		
		CsvReader csvReader=getCsvReader(request);
		 if(csvReader!=null){
				columnNames=csvReader.getColumnNames();
				if( (columnNames.size()==5) == false ){
					formatErrorString="CSV File Must have 5 headers like this - Plot No,No of Floor,Name,No of Bedrooms,No of Parkings";				
				}			
				else{
					isValidColumnOrder();
					if(formatErrorString.length()==0){
						for(int i=1;i<csvReader.getNumberOfRows();i++){
								row = (List<String>) csvReader.getRowValues(i);
								row=updateRow(row);
								if(row.size()==5){							
									ValidateVillasCSV(row,i,communityId);
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
	
public  void ValidateVillasCSV(List<String> row,Integer rowIndex, String communityId) {
	isValidRow(rowIndex);
	String plotNo=  row.get(0).toString();
	String noOfFloors=row.get(1).toString();
	String name=row.get(2).toString();
	String noOfBedRooms=row.get(3).toString();
	String noOfParkings=row.get(4).toString();
	if(plotNo!=null && noOfFloors!=null && name!=null && noOfBedRooms!=null && noOfParkings!=null){
		 VillaDOFactory.addBulkVillas(communityId,plotNo,noOfFloors,name,noOfBedRooms,noOfParkings);
	 }
	/*else{
		if(plotNo==null){
			formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[0]+"' is not available in DB,";
		}
		if(noOfFloors==null){
			formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[1]+"' is not available in DB,";
		}
		if(name==null){
			formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[2]+"' is not available in DB,";
		}
		if(noOfBedRooms==null){
			formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[3]+"' is not available in DB,";
		}
		
		if(noOfParkings==null){
			formatErrorString=formatErrorString+"Row No : "+rowIndex+" '"+uploadColumnNameOrder[4]+"' is not available in DB,";
		}
	}*/
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
		String columnNameOrder=applicationProperties.getProperty(UPLOAD_VILLA_COLUMN_NAME_ORDER);
		uploadColumnNameOrder=columnNameOrder.split(",");
		for(int i=0;i<columnNames.size();i++){
			String item=columnNames.get(i);
			if(item.equals(Constants.EMPTY_STRING)){
				formatErrorString="Headers should not be empty\n";
				break;
			}
			else if(item.equalsIgnoreCase(uploadColumnNameOrder[i])==false){
				formatErrorString="CSV File headers should be this order - Plot No,No of Floor,Name,No of Bedrooms,No of Parkings";
				break;
			}			
		}		
	}
	private void isValidRow(int rowIndex) {
		if(row.size()==5){
			for(int i=0;i<row.size();i++){
				String item=row.get(i);				
				if(item.equalsIgnoreCase(Constants.EMPTY_STRING)){
					formatErrorString=formatErrorString+".Row No :"+rowIndex+"ColumnName - "+uploadColumnNameOrder[i]+" should not be empty,";
				}else if((i==1 || i==3)&& isNumber(item)==false){					   					
					formatErrorString=formatErrorString+".Row No :"+rowIndex+"ColumnName -"+uploadColumnNameOrder[i]+" should be integer value,";
			}
			}
		}
	}
	
	private  boolean isNumber(String valueString){		
		return valueString.matches(INT_SEQ);
	}

}
