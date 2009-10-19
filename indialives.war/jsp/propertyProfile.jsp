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
<%@page import="com.indialives.voobjects.ParkingSlotVO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
</head>
<%@include file="indialives_css.jspf"%>

<body>
<%
	Object object=request.getAttribute(SetAttributeConstants.PROPERTY_OBJ);



%>
<%@include file="header.jsp" %>
<form name="propertyHome" action="/indialives/eventhandler" method="post">

<table border="0" width="100%" height="76%">

	<tr>
	
	<td valign="top" width="20%">
		<div class="indiaLivesFonts" style="border-style: ridge;border-width: 2px;height: 100%;font-size: 16px">
		<table border="0" width="100%" height="50%">
		
			<tr>
				<td><a href="#" style="text-decoration: none;">Properties</a></td>
			</tr>
			<tr>
				<td><a href="#" style="text-decoration: none;">Complaints</a></td>
			</tr>
			<tr>
				<td><a href="#" style="text-decoration: none;">Notice Board</a></td>
			</tr>
			<tr>
				<td><a href="#" style="text-decoration: none;">Parking</a></td>
			</tr>			
		</table>
		</div>
	</td>	
	 <td valign="top" width="65%">	
	  <div class="indiaLivesFonts" style="border-style: ridge;border-width: 2px;font-size: 16px;width=92%;height: 100%" >
		<table border="0" width="100%" style="margin-left: 50px">
		
			<%if(object instanceof FlatDO){
				
				FlatVO flatVO=(FlatVO)object;
				
				
		%>
		<tr class="indiaLivesFonts" style="font-size:18px;">
			<td>Block Name </td>
			<td><%=flatVO.getBlockName()%></td>
		</tr>
		<tr>
			<td>Floor</td>
			<td><%=flatVO.getFloor()%></td>
		</tr>
		<tr>
			<td>Flat No</td>
			<td><%=flatVO.getFlatNo()%></td>
		</tr>
		<tr>
			<td>Flat Type Name</td>
			<td><%=flatVO.getFlatTypeName()%></td>
		</tr>
		<tr>
			<td>No of Bedroom</td>
			<td><%=flatVO.getNoOfBedRooms()%></td>
		</tr>
		
		<%	}else if(object instanceof VillaDO){
				VillaDO villaDO=(VillaDO) object;				
	%>			
			<tr class="indiaLivesFonts" style="font-size:18px;">
			<td>Plot No </td>
			<td><%=villaDO.getPlotNo()%></td>
		</tr>
		<tr>
			<td>No of Floor</td>
			<td><%=villaDO.getNoOfFloors()%></td>
		</tr>
		<tr>
			<td>Villa Name</td>
			<td><%=villaDO.getName()%></td>
		</tr>
		<tr>
			<td>No of Bedroom</td>
			<td><%=villaDO.getNoOfBedRooms()%></td>
		</tr>
		<tr>
			<td>No of parkings</td>
			<td><%=villaDO.getNoOfParkings()%></td>
		</tr>
	
	<%}else{
	
		ParkingSlotVO parkingSlotVO=(ParkingSlotVO)object;
	%>
	
		<tr>
			<td>Parking Name</td>
			<td><%=parkingSlotVO.getParkingSlotName()%></td>
		</tr>
		<tr>
			<td>Parking Location</td>
			<td><%=parkingSlotVO.getLocation()%></td>
		</tr>
		
				
	<%}%>
			
				
				
		</table>
	</div>
	</td>
	<td valign="top" width="20%" class="indiaLivesFonts">
		<div style="border-style: ridge;border-width: 2px;height: 100%;width: 100%">
			<table border="0">
				<tr>
					<td>Adv Board</td>
				</tr>
			</table>
		
		</div>
	
	</td>
	</tr>
</table>
<%@include file="footer.jsp" %>
<input type="hidden" name="event" value="propertyProfile">
<input type="hidden" name="propertyId">
<input type="hidden" name="propertyTypeId" >
</form>
</body>
</html>