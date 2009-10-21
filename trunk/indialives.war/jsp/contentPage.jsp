<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>
<title>Welcome to IndiaLives</title>
</head>
<%@page import="com.indialives.SetAttributeConstants"%>
<body>
<%

String  gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);

%>
<form name="contentFrm" action="/indialives/eventhandler" method="post">
<table border="0" width="100%" height="100%">
	<tr class="indiaLivesFonts">

	<td width="20%">
		<fieldset style="height: 98%">
		<legend>Contents</legend>
		<table border="0" width="100%" height="50%">
		
			<tr>
				<td><a href="eventhandler?event=communityHome&gatedCommunityId=<%=gatedCommunityId%>" style="text-decoration: none;" onclick="submitContentPage()">Properties</a></td>
			</tr>
			<tr>
				<td><a href="eventhandler?event=complaintsList" style="text-decoration: none;">Complaints</a></td>
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
</form>
</body>

</html>