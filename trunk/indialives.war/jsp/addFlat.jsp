<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<%@page import="com.indialives.dataobjects.FlatDO"%>
<%@page import="com.indialives.dataobjects.VillaDO"%>
<%@page import="com.indialives.voobjects.FlatVO"%>
<%@page import="com.indialives.dataobjects.ParkingSlotDO"%>
<%@page import="com.indialives.voobjects.ParkingSlotVO"%>
<%@page import="com.indialives.dataobjects.FlatTypeEnumDO"%>
<%@page import="com.indialives.dataobjects.BlockDO"%>
<%@page import="com.indialives.formbean.Flats"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<%@include file="addFlat.jspf"%>
</head>



<body>
<%
 List list=(List)request.getAttribute(SetAttributeConstants.FLATS_TYPE_LIST);
 List blockList=(List)request.getAttribute(SetAttributeConstants.BLOCK_LIST);
%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 98%;">
	   <legend style="font-size:16px;">Create Flat</legend>
	   	  <form name="addFlatFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="53%" align="center" style="margin-left: 50px;margin-top: 120px">
					
		<tr>
			<td>Block Name</td>
			<td>
			<select name="blockId" style="width: 235px" >
			<option>--Select--</option>
			<%if(blockList!=null){
			for(int i=0;i<blockList.size();i++){
				BlockDO blockDO=(BlockDO)blockList.get(i);
			%>	
			<option value="<%=blockDO.getId()%>"><%=blockDO.getName()%></option>
			<%}}%>
		 </select>		 
		</td>
		</tr>
		<tr>
			<td>Floor </td>
			<td><input type="text" name="floor" size="35"></td>
		</tr>
		<tr>
			<td>Flat No </td>
			<td><input type="text" name="flatNo" size="35"></td>
		</tr>		
		<tr>	
			<td>Flat Type</td>
			<td>
			<select name="flatTypeId" style="width: 235px" >
			<option>--Select--</option>
			<%if(list!=null){
			for(int i=0;i<list.size();i++){
				FlatTypeEnumDO enumDO=(FlatTypeEnumDO)list.get(i);
			%>	
			<option value="<%=enumDO.getId()%>"><%=enumDO.getName()%></option>
			<%}}%>
		 </select>		 
		</td>
		</tr>	
		<tr>
			<td>No of Bedrooms </td>
			<td><input type="text" name="noOfBedRooms" size="35"></td>
		</tr>
		<tr>
		<td colspan="2"  align="right">
			<input type="button" name="add" value="Add" onclick="addFlat()">
		</td>		
		</tr>
		</table>
		<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=Flats.class.getName()%>">
		<input type="hidden" name="event" value="addFlat">
		</form>
	</fieldset>	
	</td>
	<td valign="top" width="15%" class="indiaLivesFonts">
		<fieldset style="height: 98%;" >
	    	<legend>Adv Board</legend>			
		</fieldset>
	</td>

	</tr>
	
</table>
<%@include file="footer.jsp" %>

</body>
</html>