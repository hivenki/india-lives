<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<%@page import="com.indialives.dataobjects.ComplaintTypeEnumDO"%>
<%@page import="com.indialives.dataobjects.SeverityEnumDO"%>
<%@page import="com.indialives.formbean.Complaint"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@include file="indialives_css.jspf"%>
<%@ include file="header.jspf" %>
<script type="text/javascript" language="javascript" src="/indialives/js/showComplaints.js"></script>
</head>
<body>
<%

List propertyEnumlist=(List)request.getAttribute(SetAttributeConstants.PROPERTY_ENUM_LIST);

List propertyNameList=(List)request.getAttribute(SetAttributeConstants.PROPERTY_NAME_LIST);



String propertyTypeId=(String)request.getAttribute(SetAttributeConstants.PROPERTY_TYPE_ID);
int propertyType=Integer.parseInt(propertyTypeId);

List complaintTypeEnumlist=(List)request.getAttribute(SetAttributeConstants.COMPLAINT_TYPE_LIST);

List severityTypeList=(List)request.getAttribute(SetAttributeConstants.SEVERITY_TYPE_LIST);

//String  gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);

%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%"  style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp"%>
	</td>	
	<td  valign="top"  height="100%">		
	 <fieldset style="height: 99%;" >
	  <legend class="indiaLivesFonts" style="font-size:16px ">Create Complaint</legend>
	  
		<table border="0" width="100%" height="75%" style="margin-top: 50px">
			<tr>
			
			 <td colspan="2" valign="top" align="center">	
			 <form name="showComplaintFrm" action="/indialives/eventhandler" method="post">
				<table style="font-size:16px;" class="indiaLivesFonts" border="0" width="65%" style="margin-left:40px" >
				 <tr class="indiaLivesFonts" style="font-size:14px">
				
				<td>Property Type</td>			
				<td><select name="propertyTypeId" onchange="createComplaint()"  style="width: 150px">
					<%
						if(propertyEnumlist!=null){
							for(int i=0;i<propertyEnumlist.size();i++){
								PropertyTypeEnumDO propertyTypeEnumDO=(PropertyTypeEnumDO)propertyEnumlist.get(i);
								%>
						
						<%if(propertyType==propertyTypeEnumDO.getId().intValue()){ %>
						<option value="<%=propertyTypeEnumDO.getId()%>" selected="selected"><%=propertyTypeEnumDO.getName()%></option>
						<%}else{%>
						<option value="<%=propertyTypeEnumDO.getId()%>" ><%=propertyTypeEnumDO.getName()%></option>
						<%}%>
										
						<%}}%>	
				</select>	
				</td>	
				</tr>
		
				 <tr>
					<td>Property Name</td>
					<td>
					<select name="propertyId" style="width: 150px">
					<option>--Select--</option>
					
						<%
							if(propertyNameList!=null){
								for(int i=0;i<propertyNameList.size();i++){
									PropertiesVO propertiesVO=(PropertiesVO)propertyNameList.get(i);
							%>
							<option value="<%=propertiesVO.getId()%>"><%=propertiesVO.getPropertyName()%></option>
										
							<%}}%>
						</select>
						</td>
					</tr>
					<tr>
						<td>Complaint Type</td>
						<td>
						<select name="typeId" style="width: 150px">
				
						<option>--Select--</option>
						
						<%
							if(complaintTypeEnumlist!=null){
								for(int i=0;i<complaintTypeEnumlist.size();i++){
									ComplaintTypeEnumDO complaintTypeEnumDO=(ComplaintTypeEnumDO)complaintTypeEnumlist.get(i);
							%>
							<option value="<%=complaintTypeEnumDO.getId()%>"><%=complaintTypeEnumDO.getName()%></option>
									
						<%}}%>
						</select>
						</td>
						
					</tr>
				
					<tr>
						<td valign="top">Description</td>
						<td><textarea style="font-size:14px;" class="indiaLivesFonts" rows="5" cols="18" name="description"></textarea>
						</td>
						
					</tr>
					<tr>
						<td>Severity</td>
						<td>
						<select name="severityId" style="width: 150px">
						<option>--Select--</option>
						
						<%
							if(severityTypeList!=null){
								for(int i=0;i<severityTypeList.size();i++){
									SeverityEnumDO severityEnumDO=(SeverityEnumDO)severityTypeList.get(i);
							%>
							<option value="<%=severityEnumDO.getId()%>"><%=severityEnumDO.getName()%></option>
									
						<%}}%>
						</select>
						</td>
					</tr>
					<tr>
						<td>Available Start Time</td>
						<td><input type="text" size="21" name="availableStartTime">(DD-MM-YYYY)</td>
					</tr>
					<tr>
						<td>Available End Time</td>
						<td><input type="text" size="21" name="availableEndTime">(DD-MM-YYYY)</td>
					</tr>
									
					<tr>
						<td colspan="2" >
							<input style="margin-left: 240px" type="button" name="create" value="Create" onclick="addComplaint()">
						</td>
					</tr>
				
				</table>
				<input type="hidden" name="event">
				<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=Complaint.class.getName()%>">
				<input type="hidden" name="propertyTypeIds"/>
				</form>
				</td>	
		
			</tr>
		
		
	</table>
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