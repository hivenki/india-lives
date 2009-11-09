<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.dataobjects.ParkingDO"%>
<%@page import="java.util.List"%>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/addParkingSlot.js"></script>
</head>
<%
	 List parkingList=(List)request.getAttribute(SetAttributeConstants.PARKING_LIST);
%>
<%@include file="header.jsp" %>
<body>
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;width: 100%">
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
	<td valign="top" width="15%">
		<%@include file="advBoard.jsp" %>
	</td>

	</tr>
</table>
<%@include file="footer.jsp" %>
</body>
</html>