<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.formbean.Compliants"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<%@page import="com.indialives.dataobjects.ComplaintTypeEnumDO"%>
<%@page import="com.indialives.dataobjects.SeverityEnumDO"%><html>
<head>
<title>Welcome to IndiaLives</title>
</head>
<%@include file="showComplaints.jspf"%>
<%@include file="indialives_css.jspf"%>
<body>
<%

List propertyEnumlist=(List)request.getAttribute(SetAttributeConstants.PROPERTY_ENUM_LIST);

List propertyNameList=(List)request.getAttribute(SetAttributeConstants.PROPERTY_NAME_LIST);

String propertyTypeId=request.getParameter("propertyTypeId");
int propertyType=1;
if(propertyTypeId==null){
	propertyType=1;
}
else{
	propertyType=Integer.parseInt(propertyTypeId);
}

List complaintTypeEnumlist=(List)request.getAttribute(SetAttributeConstants.COMPLAINT_TYPE_LIST);

List severityTypeList=(List)request.getAttribute(SetAttributeConstants.SEVERITY_TYPE_LIST);

//String  gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);

%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="76%">

	<tr>
	<td width="20%">
		<%@include file="contentPage.jsp"%>
	</td>	
	<td  valign="top"  width="65%" height="100%">		
	 <fieldset style="height: 98%" >
	  <legend class="indiaLivesFonts" style="font-size:16px ">Create Complaint</legend>
	  <form name="showComplaintFrm" action="/indialives/eventhandler" method="post">
		<table border="0" width="100%" height="76%">
				
		<tr class="indiaLivesFonts" style="font-size:14px">
			
			<td width="50%" align="right">Property Type			
			<select name="propertyTypeId">
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
			
		<td><input type="button" name="create" value="Generate" onclick="createComplaint()"></td>
	
		</tr>
		</fieldset>	
		<tr>
		<td colspan="2"></br></td>
		</tr>
		
		<tr>
		
		 <td colspan="2" valign="top" align="center">	
		 <fieldset style="width: 80%">
			<table style="font-size:14px;" class="indiaLivesFonts" border="0" width="60%" style="margin-left:40px" >
			
			
			<tr>
				<td>Property Name</td>
				<td>
				<select name="propertyId">
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
				<select name="typeId">
		
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
				<td>Description</td>
				<td><input type="text" name="description"></td>
			</tr>
			<tr>
				<td>Severity</td>
				<td>
				<select name="severityId">
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
				<td><input type="text" name="availableStartTime"></td>
			</tr>
			<tr>
				<td>Available End Time</td>
				<td><input type="text" name="availableEndTime"></td>
			</tr>
							
			<tr>
				<td colspan="2">
					<input type="button" name="create" value="Create" onclick="addComplaint()">
				</td>
			</tr>
		
		</table>
		</fieldset>
	
		</td>	
		
		</tr>
		
		
	</table>
	<input type="hidden" name="event">
	<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=Compliants.class.getName()%>">
	
	</form>
	</fieldset>
	</td>
	<td valign="top" width="20%" class="indiaLivesFonts">
		 <fieldset style="height: 98%" >
	    	<legend>Adv Board</legend>			
		</fieldset>
	</td>
	</tr>
	
</table>



<%@include file="footer.jsp" %>
</body>
</html>