<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.dataobjects.ParkingDO"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.ParkingSlot"%>
<%@page import=" com.indialives.SetAttributeConstants"%>
<html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/addParkingSlot.js"></script>
</head>
<%	
	
     List propertTypeList=(List)request.getAttribute(SetAttributeConstants.PROPERTY_ENUM_LIST);
	 List propertyList=(List)request.getAttribute(SetAttributeConstants.PROPERTY_LIST_BASED_ON_TYPE);
	
	 List parkingList=(List)request.getAttribute(SetAttributeConstants.PARKING_LIST);
	 String propertyTypeId=(String)request.getAttribute(SetAttributeConstants.PROPERTY_TYPE_ID);
	 Integer propertyType=null;
	 if(propertyTypeId!=null){
		propertyType= new Integer(propertyTypeId);
	 }
	 
	 String parkingLocationAlreadyExists=(String)request.getAttribute(SetAttributeConstants.PARKING_LOCATION_ALREADY_EXISTS);
	 
	 ParkingSlot parkingSlot=(ParkingSlot)request.getAttribute(SetAttributeConstants.PARKING_SLOT_OBJ);
	 
	 Integer proId=new Integer(0);
	 Integer parkingId=new Integer(0);
	 String location="";
	 if(parkingSlot!=null){
		 propertyType=parkingSlot.getPropertyTypeId();
		 proId=parkingSlot.getPropertyId();
		 parkingId=parkingSlot.getParkingId();
		 location=parkingSlot.getLocation();
		 
	 }
	 
%>
<%@include file="header.jsp" %>
<body onload="showErrorMsg('<%=parkingLocationAlreadyExists%>')">
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;width: 100%">
	   <legend style="font-size:16px;">Create Parking Slot</legend>
	   	  
	   	  <form name="addParkingSlotFrm" action="/indialives/eventhandler" method="post">
	    	<table class="formFonts"  border="0"  align="center" style="margin-left: 50px;margin-top: 120px;">
				<tr>
				
				<td>Property Type</td> 			
				<td class="formFonts"   ><select  onchange="showProperty()" name="propertyTypeId" style="width: 235px">
					<%if(propertTypeList!=null){
							for(int i=0;i<propertTypeList.size();i++){
								PropertyTypeEnumDO propertyTypeEnumDO=(PropertyTypeEnumDO)propertTypeList.get(i);
								%>
						
						<%if(propertyType.equals(propertyTypeEnumDO.getId())){ %>
						<option value="<%=propertyTypeEnumDO.getId()%>" selected="selected"><%=propertyTypeEnumDO.getName()%></option>
						<%}else{%>
						<option value="<%=propertyTypeEnumDO.getId()%>" ><%=propertyTypeEnumDO.getName()%></option>
						<%}%>
						<%}}%>	
				</select>	
				</td>	
			</tr>
				<tr>
				<td>Property </td>			
				<td><select name="propertyId" style="width: 235px">
				<option>--Select--</option>
					<%if(propertyList!=null){
							for(int i=0;i<propertyList.size();i++){
								PropertiesVO propertiesVO=(PropertiesVO)propertyList.get(i);
					%>		
					<%if(proId.equals(propertiesVO.getPropertyId())) {%>
					<option value="<%=propertiesVO.getPropertyId()%>" selected="selected"><%=propertiesVO.getPropertyName()%></option>
														
					<%}else{%>
					<option value="<%=propertiesVO.getPropertyId()%>"><%=propertiesVO.getPropertyName()%></option>	
					<%}}}%>	
				</select>	
				</td>	
			</tr>
				
					
		<tr>
			<td>Parking Name</td>
			<td>
			<select name="parkingId" style="width: 235px" >
			<option>--Select--</option>
			<%if(parkingList!=null){
			for(int i=0;i<parkingList.size();i++){
				ParkingDO parkingDO=(ParkingDO)parkingList.get(i);
			%>	
			<%if(parkingId.equals(parkingDO.getId())){ %>
			<option value="<%=parkingDO.getId()%>" selected="selected"><%=parkingDO.getName()%></option>
			<%}else{%>
			<option value="<%=parkingDO.getId()%>"><%=parkingDO.getName()%></option>
			<%}}}%>
		 </select>		 
		</td>
		</tr>
		<tr>
			<td>Location </td>
			<td><input type="text" name="location" size="35" value="<%=location%>"></td>
		</tr>		
		<tr>
		<td colspan="2"  align="right">
			<input  type="button" name="add" value="Add" onclick="addParkingSlot()">
		</td>		
		</tr>
		</table>		
		<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=ParkingSlot.class.getName()%>">
		 <!--<input type="hidden" name="propertyTypeIds">	
	     <input type="hidden" name="pTypeId">
	     <input type="hidden" name="pId">
	     -->
	     <input type="hidden" name="event"/>
		</form>
		</fieldset>	
	</td>
	<td valign="top" width="15%">
		<%@include file="advBoard.jsp" %>
	</td>

	</tr>
</table>
<%@include file="footer.jsp" %>
</body>
</html>