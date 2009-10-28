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
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
</head>


<body>
<%
	Object object=request.getAttribute(SetAttributeConstants.PROPERTY_OBJ);
//	String gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);


%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 98%;">
	   <legend style="font-size:16px;">Property  Profile</legend>
	   	  <div style="margin-top: 100px;width:90%;margin-left:100px;border-style:ridge;border-width:2px;" >	
	   	  <form name="propertyHome" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;">
			
			<%if(object instanceof FlatDO){
				
				FlatVO flatVO=(FlatVO)object;
				
				
		%>
		<tr>
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
			<tr>
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
	
	<%}%>
	
		</table>
		</form>
		</div>	
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
<input type="hidden" name="event" value="propertyProfile">
<input type="hidden" name="propertyId">
<input type="hidden" name="propertyTypeId" >
</form>
</body>
</html>