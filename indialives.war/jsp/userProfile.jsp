<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.indialives.dataobjects.UserDO"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/userProfile.js"></script>
</head>
<%
 	UserDO userDO=(UserDO )request.getAttribute(SetAttributeConstants.GET_USER_INFO);
	String message=(String)request.getAttribute(SetAttributeConstants.UPDATE_PROFILE_MSG);
%>
<body onload="updateMsg('<%=message%>')">
<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;width: 100%">
	   <legend style="font-size:16px;">User Profile</legend>
	   	  
	   	  <form name="userProfileFrm" action="/indialives/eventhandler" method="post">
	    	<table class="formFonts" border="0" width="50%" align="center" style="margin-left: 50px;margin-top: 120px">
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName" size="35" value="<%=userDO.getFirstName() %>"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName" size="35" value="<%=userDO.getLastName() %>"></td>
			</tr>		
			<tr>
				<td>Email Id</td>
				<td><input type="text" name="emailId" readonly="readonly" size="35" value="<%=userDO.getEmailId() %>"></td>
			</tr>
			<tr>
				<td>Mobile No</td>
				<td><input type="text" name="mobileNo" readonly="readonly" size="35" value="<%=userDO.getMobileNo()%>"></td>
			</tr>		
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" size="35" value="<%=userDO.getPassword() %>"></td>
			</tr>
			<tr>
			<td >&nbsp;</td>
			<td width="50%" align="right" style="margin-left: 100px">
			<input type="button" name="add" value="Update" onclick="updateUser()">
			</td>		
			</tr>
		</table>
		<input type="hidden" name="event" value="updateUser">
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