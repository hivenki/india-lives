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
import com.indialives.dataobjects.BlockDO;
import com.indialives.dataobjects.FlatTypeEnumDO;
import com.indialives.dofactory.BlockDOFactory;
import com.indialives.dofactory.FlatDOFactory;

public class UploadFlatEventHandler implements EventHandler,Constants,ApplicationConstants,MultipartConstants,SetAttributeConstants {
	private CsvReader csvReader=null;
	private List<RowObject> blockList=null;
	private List<RowObject> flatTypeEnumList=null;
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
		 
		 
		 
		 blockList=BlockDOFactory.getBlockList(communityId);
		 flatTypeEnumList=FlatDOFactory.getFlatTypeList();
			
		HashMap<String,Integer> bulkHashMap=new HashMap<String, Integer>();
		for(RowObject rowObject : blockList){
			BlockDO blockDO=(BlockDO) rowObject;
			bulkHashMap.put(blockDO.getName(),blockDO.getId());
		}		
		
		HashMap<String,Integer> flatTypehashMap=new HashMap<String, Integer>();
		for(RowObject rowObject : flatTypeEnumList){
			FlatTypeEnumDO flatTypeEnumDO=(FlatTypeEnumDO) rowObject;
			flatTypehashMap.put(flatTypeEnumDO.getName(),flatTypeEnumDO.getId());
		}		
		
		FlatDOFactory.addBulkFlats(bulkHashMap,flatTypehashMap,csvReader);
			
			
		        		
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
