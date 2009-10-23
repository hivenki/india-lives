
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <html>
<head>
<title>Welcome to IndiaLives</title>
</head>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@ include file="contentPage.jspf" %>
<body>
<form name="contentFrm" action="/indialives/eventhandler" method="post">
<table border="0" width="100%" height="100%">
	<tr class="indiaLivesFonts">

	<td width="20%">
		<fieldset style="height: 98%;">
		<legend>Contents</legend>
		<table border="0" width="100%" height="50%">
		
			<tr>
				<td><a href="#"  style="text-decoration: none;" onclick="submitPropertyPage()">Properties</a></td>
			</tr>
			<tr>
				<td><a href="#" style="text-decoration: none;" onclick="submitComplaintPage()">Complaints</a></td>
			</tr>
			<tr>
				<td><a href="#" style="text-decoration: none;">Notice Board</a></td>
			</tr>
			<tr>
				<td><a href="#" style="text-decoration: none;">Parking</a></td>
			</tr>			
		</table>
		</fieldset>
	</td>
	</tr>

</table>

	<input type="hidden" name="event">
</form>
</body>

</html>