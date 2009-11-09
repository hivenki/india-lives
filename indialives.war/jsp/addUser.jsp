<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.Users"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
</head>
<script type="text/javascript" language="javascript" src="/indialives/js/addUser.js"></script>
<body>
<table border="0" width="100%">
	<tr>
		<td width="15%"style="font-size: large;text-indent: 25px">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	    <div class="contentb">
		IndiaLives
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</td>		
	</tr>
	
</table>

<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 100%;width: 100%">
	   <legend style="font-size:16px;">Create User</legend>
	   	  
	   	  <form name="addUserFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;margin-top: 120px">
					
		<tr>
			<td>First Name</td>
			<td><input type="text" name="firstName" size="35"></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="lastName" size="35"></td>
		</tr>		
		<tr>
			<td>Email Id</td>
			<td><input type="text" name="emailId" size="35"></td>
		</tr>
		<tr>
			<td>Mobile No</td>
			<td><input type="text" name="mobileNo" size="35"></td>
		</tr>		
		<tr>
			<td>Password</td>
			<td><input type="password" name="password" size="35"></td>
		</tr>
		<tr>
		<td >&nbsp;</td>
		<td width="50%" align="right" style="margin-left: 100px">
		<input type="button" onclick="submitBack()"	value="Back">
		<input type="button" name="add" value="Add" onclick="addUser()">
		<input type="reset" value="Clear">
		</td>
		</tr>
		</table>
		<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=Users.class.getName()%>">
		<input type="hidden" name="event">
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