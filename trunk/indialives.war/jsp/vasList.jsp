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
<%@page import="com.indialives.voobjects.RolePrivilegesVO"%>
<%@page import="com.indialives.dataobjects.ParkingDO"%>
<%@page import="com.indialives.dataobjects.ParkingSlotDO"%>
<%@page import="com.indialives.voobjects.ParkingSlotVO"%>

<html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
</head>

<script type="text/javascript" src="/indialives/js/parkingList.js"></script>
<body>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>	
	<td width="15%">
	<%@include file="contentPage.jsp" %>	
	</td>	
	 <td  valign="top"  height="100%">	
	  <fieldset style="height: 99%;" >
	  <legend class="indiaLivesFonts" >Value Added Services</legend>
	 	<form name="vasFrm" action="/indialives/eventhandler" method="post">
	 
	
		<table border="0" width="90%" height="80%" style="margin-left: 50px">
		<tr class="indiaLivesFonts" valign="top">
			<td>
				This page is a gateway to value added services provided on IndiaLives.		
			</td>
		</tr>
		<tr class="indiaLivesFonts">
				<td> The Grocery Stores</td>
		 </tr>								
		<tr class="indiaLivesFonts">
				<td> Using grocery stores a customer can plan the list of groceries needed for a given
				 family size, nature of food consumption and other details.The system will generate a most
				 appropriate list of grocery items for the given inputs.Then the customer can edit, delete or add
				 to that list, depending on his requirement.The finalized order can be initially emailed to
				 his favourate grocery store, which will serve him the order.Later, popular grocery stories will be
				 integrated into the IndiaLives grocery store and one can check out the grocery order just from
				 IndiaLives.IndiaLives grocery store will attach a unique id to the order.Depending on whether the physical grocery
				 will support home delivery or not, the customer will either go and just pick up the groceries or order home delivery. </td>
		 </tr>								

		</table>
	
		<input type="hidden" name="parkingId" >
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