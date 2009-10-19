<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.easymvc.session.SessionFactory"%><html>
<head>
<title>Welcome to IndiaLives</title>
</head>
<%@ include file="header.jspf" %>
<body>
<form name="headerFrm" action="/indialives/eventhandler" method="post">
<table border="0" width="100%">
	<tr>
		<td width="25%" style="font-family: calibri;font-size: x-large;">IndiaLives</td>
		<td>
		<div style="border-style: ridge;border-width:2px">
			<table width="90%">
			 <tr style="font-family: calibri;font-size:16px;">
				<td><a href="eventhandler?event=memberHome" style="text-decoration: none ">Home</a></td>
				<td><a href="#" style="text-decoration: none ">Profile</a></td>
				
				<td align="right"><%=SessionFactory.getSession(request).getUser().getFirstName()+" "+ SessionFactory.getSession(request).getUser().getLastName()%></td>				
				<td align="right"><a href="#" style="text-decoration: none " onclick="submitSignOut()">Sign Out</a></td>
			</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td colspan="2"></br></td>
	</tr>
</table>
<input type="hidden" name="event" value="signOut">
</form>
</body>
</html>