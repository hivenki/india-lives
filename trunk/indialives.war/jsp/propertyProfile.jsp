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
//	String gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);


%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="76%">

	<tr>
	<td width="20%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 98%;">
	   <legend style="font-size:16px;">Property  Profile</legend>
	   	  <fieldset style="margin-top: 50px;" >	
	   	  <form name="propertyHome" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;ma">
			
			<%if(object instanceof FlatDO){
				
				FlatVO flatVO=(FlatVO)object;
				
				
		%>
		<tr class="indiaLivesFonts">
			<td>Block Name </td>
			<td>:</td>
			<td><%=flatVO.getBlockName()%></td>
		</tr>
		<tr>
			<td>Floor</td>
			<td>:</td>
			<td><%=flatVO.getFloor()%></td>
		</tr>
		<tr>
			<td>Flat No</td>
			<td>:</td>
			<td><%=flatVO.getFlatNo()%></td>
		</tr>
		<tr>
			<td>Flat Type Name</td>
			<td>:</td>
			<td><%=flatVO.getFlatTypeName()%></td>
		</tr>
		<tr>
			<td>No of Bedroom</td>
			<td>:</td>
			<td><%=flatVO.getNoOfBedRooms()%></td>
		</tr>
		
		<%	}else if(object instanceof VillaDO){
				VillaDO villaDO=(VillaDO) object;				
	%>			
			<tr class="indiaLivesFonts" style="font-size:18px;">
			<td>Plot No </td>
			<td>:</td>
			<td><%=villaDO.getPlotNo()%></td>
		</tr>
		<tr>
			<td>No of Floor</td>
			<td>:</td>
			<td><%=villaDO.getNoOfFloors()%></td>
		</tr>
		<tr>
			<td>Villa Name</td>
			<td>:</td>
			<td><%=villaDO.getName()%></td>
		</tr>
		<tr>
			<td>No of Bedroom</td>
			<td>:</td>
			<td><%=villaDO.getNoOfBedRooms()%></td>
		</tr>
		<tr>
			<td>No of parkings</td>
			<td>:</td>
			<td><%=villaDO.getNoOfParkings()%></td>
		</tr>
	
	<%}else{
	
		ParkingSlotVO parkingSlotVO=(ParkingSlotVO)object;
	%>
	
		<tr>
			<td>Parking Name</td>
			<td>:</td>
			<td><%=parkingSlotVO.getParkingSlotName()%></td>
		</tr>
		<tr>
			<td>Parking Location</td>
			<td>:</td>
			<td><%=parkingSlotVO.getLocation()%></td>
		</tr>
		
				
	<%}%>
			
				
				
		</table>
		</form>
		</fieldset>	
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
<input type="hidden" name="event" value="propertyProfile">
<input type="hidden" name="propertyId">
<input type="hidden" name="propertyTypeId" >
</form>
</body>
</html>