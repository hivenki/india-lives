<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.formbean.Compliants"%><html>
<head>
<title>Welcome to IndiaLives</title>
</head>
<%@include file="memberHome.jspf"%>
<%@include file="indialives_css.jspf"%>
<body>
<%
	



%>
<%@include file="header.jsp" %>
<form name="createComplaintFrm" action="/indialives/eventhandler" method="post">
<table border="0" width="100%" height="76%">
	<tr>
	 <td colspan="2" valign="top">	
		<table style="font-size:14px;" class="indiaLivesFonts" border="0" width="50%" style="margin-left: 240px" >
		<tr>
			<td>Property Name</td>
			
		</tr>
		<tr>
			<td>Type</td>
			<td><input type="text" name="typeId"></td>
		</tr>
		<tr>
			<td>Severity</td>
			<td><input type="text" name="severityId"></td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" name="description"></td>
		</tr>
		<tr>
			<td>Ad Home</td>
			<td><input type="text" name="adHome"></td>
		</tr>
						
		<tr>
			<td>
				<input type="button" name="create" value="Create" onclick="submitComplaint()">
			</td>
		</tr>
	</table>
	</td>	
	</tr>
	
</table>

<%@include file="footer.jsp" %>
<input type="hidden" name="event" value="createComplaint">
<input
	type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"
	value="<%=Compliants.class.getName()%>">
</form>
</body>
</html>