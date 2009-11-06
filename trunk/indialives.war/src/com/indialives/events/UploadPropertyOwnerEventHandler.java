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
import com.indialives.dataobjects.PropertyTypeEnumDO;
import com.indialives.dofactory.PropertyOwnerDOFactory;
import com.indialives.dofactory.PropertyTypeEnumDOFactory;
import com.indialives.dofactory.UserDOFactory;
import com.indialives.voobjects.PropertiesVO;
import com.indialives.voobjects.UsersVO;

public class UploadPropertyOwnerEventHandler implements EventHandler,Constants,MultipartConstants,ApplicationConstants,SetAttributeConstants {
	
	private CsvReader csvReader=null;
	private List<RowObject> propertyList=null;
	private List<RowObject> propertyTypeList=null;
	private List<RowObject> userList=null;

	
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=communityAdmin");
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();		
		String communityId=httpSession.getAttribute(COMMUNITY_ID).toString();		
		csvReader=getCsvReader(request);
		propertyTypeList=PropertyTypeEnumDOFactory.getPropertyList();
		propertyList=PropertyOwnerDOFactory.getPropertiesList();
		userList=UserDOFactory.getUserList(communityId);
		
		HashMap<String,Integer> propertyTypeMap=new HashMap<String, Integer>();
		HashMap<Integer,Map<String, Integer>> propertyMap=new HashMap<Integer,Map<String, Integer>> ();
		HashMap<String,Integer> userMap=new HashMap<String, Integer>();
		
		for(RowObject rowObject : propertyTypeList){
			PropertyTypeEnumDO propertyTypeEnumDO=(PropertyTypeEnumDO) rowObject;
			propertyTypeMap.put(propertyTypeEnumDO.getName(),propertyTypeEnumDO.getId());
		}	
		
		for(RowObject rowObject : propertyList){
			PropertiesVO propertiesVO=(PropertiesVO) rowObject;
			Map<String, Integer> map=propertyMap.get(propertiesVO.getPropertyTypeId());
			if(map==null){
				map=new HashMap<String, Integer>();
			}
			map.put(propertiesVO.getPropertyName(), propertiesVO.getPropertyId());			
			propertyMap.put(propertiesVO.getPropertyTypeId(),map);

		}	
		
		for(RowObject rowObject : userList){
			UsersVO usersVO=(UsersVO) rowObject;
			userMap.put(usersVO.getFirstName(),usersVO.getId());
		}	
		
		PropertyOwnerDOFactory.addPropertyOwnerCSV(csvReader,propertyTypeMap,propertyMap,userMap);		
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
