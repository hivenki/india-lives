<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<%@include file="addParkingSlot.jspf"%>
</head>



<body>
<%
	
 List parkingSlotList=(List)request.getAttribute(SetAttributeConstants.PARKING_SLOT_LIST);
 List parkingList=(List)request.getAttribute(SetAttributeConstants.PARKING_LIST);
%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 98%;width: 100%">
	   <legend style="font-size:16px;">Create Parking Slot</legend>
	   	  
	   	  <form name="addParkingSlotFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="51%" align="center" style="margin-left: 50px;margin-top: 120px">
					
		<tr>
			<td>Parking Name</td>
			<td>
			<select name="parkingId" style="width: 235px" >
			<option>--Select--</option>
			<%if(parkingList!=null){
			for(int i=0;i<parkingList.size();i++){
				ParkingDO parkingDO=(ParkingDO)parkingList.get(i);
			%>	
			<option value="<%=parkingDO.getId()%>"><%=parkingDO.getName()%></option>
			<%}}%>
		 </select>		 
		</td></tr>
		<tr>
			<td>Location </td>
			<td><input type="text" name="location" size="35"></td>
		</tr>		
		<tr>
		<td colspan="2"  align="right" >
			<input type="button" name="add" value="Add" onclick="addParkingSlot()">
		</td>		
		</tr>
		</table>		
		<input type="hidden" name="event" value="addParkingSlot">
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

<%@page import="com.indialives.dataobjects.ParkingDO"%></html>