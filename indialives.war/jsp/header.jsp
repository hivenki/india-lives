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
		<td width="20%" style="font-size: large;text-indent: 40px">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	    <div class="contentb">
		IndiaLives
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		
		</td>
		<td>
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	    <div class="contentb">
		<table width="90%">
			 <tr style="font-family: calibri;font-size:16px;">
				<td><a href="#" onclick="submitHome()" style="text-decoration: none ">Home</a></td>
				<td><a href="#" style="text-decoration: none ">Profile</a></td>
				
				<td align="right"><%=SessionFactory.getSession(request).getUser().getFirstName()+" "+ SessionFactory.getSession(request).getUser().getLastName()%></td>				
				<td align="right"><a href="#" style="text-decoration: none " onclick="submitSignOut()">Sign Out</a></td>
			</tr>
			</table>
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</td>
	</tr>
	<tr>
		<td colspan="2"></br></td>
	</tr>
</table>
<input type="hidden" name="event">
</form>
</body>
</html>