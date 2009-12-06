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
<title>Pay your maintenance and other utility bills</title>
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
	  <legend class="indiaLivesFonts" >Payments</legend>
	 	<form name="vasFrm" action="/indialives/eventhandler" method="post">
	 
	
		<table border="0" width="90%" height="80%" style="margin-left: 50px">
		<tr class="indiaLivesFonts" valign="top">
			<td>
				View the payments already made, make a new payment, dispute a bill etc		
			</td>
		</tr>
		<tr class="indiaLivesFonts">
				<td> Make a new Payment</td>
		 </tr>								
		<tr class="indiaLivesFonts">
				<td> Payments Already Made </td>
		 </tr>								
		</table>
	
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