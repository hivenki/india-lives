<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
</head>
<%@include file="index.jspf"%>
<body 
	onload="errorMsg('<%=request.getAttribute(SetAttributeConstants.AUTH_ERROR_MSG)%>')">
<form name="loginFrm" action="/indialives/eventhandler" method="get">
<table border="1" align="right" cellpadding="2" cellspacing="2">
	<tr>
		<td colspan="2" align="center">Sign In</td>
	</tr>
	<tr>
		<td>Email/Mobile</td>
		<td><input type="text" name="username"></td>

	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td align="right" colspan="2"><input type="button"
			value="Sign In" name="signIn" onclick="submitLogin()"></td>
	</tr>
</table>
<input type="hidden" name="event" value="login"> <input
	type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"
	value="<%=LoginUser.class.getName()%>"></form>
</body>
</html>