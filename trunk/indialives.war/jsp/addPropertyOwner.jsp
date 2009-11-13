<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="com.indialives.voobjects.UsersVO"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/addPropertyOwner.js"></script>
</head>
<body>
<%
	List propertTypeList=(List)request.getAttribute(SetAttributeConstants.PROPERTY_ENUM_LIST);
	List propertyList=(List)request.getAttribute(SetAttributeConstants.PROPERTY_LIST_BASED_ON_TYPE);
	List userForPropertyList=(List)request.getAttribute(SetAttributeConstants.USER_LIST_FOR_PROPERTY);
	String propertyTypeId=(String)request.getAttribute(SetAttributeConstants.PROPERTY_TYPE_ID);
	int propertyType=Integer.parseInt(propertyTypeId);
%>
<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;width: 100%">
	   <legend style="font-size:16px;">Create Flat Type</legend>
	   	   <form name="addPropertyOwnerFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;margin-top: 120px">
			 <tr>
				
				<td>Property Type</td> 			
				<td><select onchange="showProperty()" name="propertyTypeId" style="width: 250px">
					<%if(propertTypeList!=null){
							for(int i=0;i<propertTypeList.size();i++){
								PropertyTypeEnumDO propertyTypeEnumDO=(PropertyTypeEnumDO)propertTypeList.get(i);
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
				<td>Property </td>			
				<td><select name="propertyId" style="width: 250px">
				<option>--Select--</option>
					<%if(propertyList!=null){
							for(int i=0;i<propertyList.size();i++){
								PropertiesVO propertiesVO=(PropertiesVO)propertyList.get(i);
								%>
						
						<option value="<%=propertiesVO.getPropertyId()%>"><%=propertiesVO.getPropertyName()%></option>
															
						<%}}%>	
				</select>	
				</td>	
			</tr>
			
			<tr>
				<td>Owner</td> 			
				<td><select name="ownerId" style="width: 250px" >
				<option>--Select--</option>
					<%if(userForPropertyList!=null){
							for(int i=0;i<userForPropertyList.size();i++){
								UsersVO usersVO=(UsersVO)userForPropertyList.get(i);
								%>
						
						<option value="<%=usersVO.getId()%>"><%=usersVO.getFirstName()%></option>
															
						<%}}%>	
				</select>	
				</td>	
			</tr>
			 <tr>
				<td colspan="2" align="right"><input type="button"  value="Add" onclick="addPropertyOwner()"></td>
			</tr>
			 </table>
		 <input type="hidden" name="propertyTypeIds">	
	     <input type="hidden" name="pTypeId">
	     <input type="hidden" name="pId">
	     <input type="hidden" name="oId">
	     <input type="hidden" name="event">
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