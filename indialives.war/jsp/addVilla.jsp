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
<%@page import="com.indialives.formbean.Villas"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<%@include file="addVilla.jspf"%>
</head>


<body>
<%
 
	
%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 98%;">
	   <legend style="font-size:16px;">Create Villa</legend>
	   	  <div style="margin-top: 100px;width:90%;margin-left:100px;border-style:ridge;border-width:2px;" >	
	   	  <form name="addVillaFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;">
					
		<tr>
			<td>Plot No</td>
			<td><input type="text" name="plotNo"></td>
		</tr>
		<tr>
			<td>No of Floors </td>
			<td><input type="text" name="noOfFloors"></td>
		</tr>
		<tr>
			<td>Villa Name </td>
			<td><input type="text" name="name"></td>
		</tr>		
		<tr>
			<td>No of Bedrooms </td>
			<td><input type="text" name="noOfBedRooms"></td>
		</tr>
		<tr>
			<td>No of Parkings </td>
			<td><input type="text" name="noOfParkings"></td>
		</tr>
		
		<tr>
		<td>
			<input type="button" name="add" value="Add Villa" onclick="addVilla()">
		</td>		
		</tr>
		</table>
		<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=Villas.class.getName()%>">
		<input type="hidden" name="event" value="addVilla">
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

</body>
</html>