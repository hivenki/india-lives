<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@include file="index.jspf"%>
<%@include file="indialives_css.jspf"%>
<%@ include file="header.jspf" %>
</head>



<body 
	onload="fillLastLogin();errorMsg('<%=request.getParameter(SetAttributeConstants.AUTH_ERROR_MSG)%>')">
<form name="loginFrm" action="/indialives/eventhandler" method="post">
<table border="1" height="92%" width="100%" cellpadding="0" cellspacing="0">
<tr>
<td width="70%" height="100%"  valign="top" >
	<table border="0" width="100%" height="100%">
		<tr class="indiaLivesFontsForHeader">
			<td style="font-size:x-large;">Indialives</td>
			<td style="font-size:25px;">Welcome to IndiaLives</td>
		</tr>
		<tr>
			<td colspan="2"><hr/></td>
		</tr>
		<tr>
		<td height="100%" colspan="2" align="center">
			<table border="0" width="70%" height="50%">
				<tr class="indiaLivesFonts" >
					<td>
					<ul>			
						<li type="square">Pay community bills</li>
					</ul>
					</td>
				</tr>
				<tr class="indiaLivesFonts">
					<td>	
					<ul>		
						<li type="square"> Raise complaints</li>
					</ul>
					</td>
				</tr>
				<tr class="indiaLivesFonts" style="font-size:14px;">
					<td>
					<ul>
						<li type="square">Book Amenities</li>
					</ul>
					</td>
				</tr>
				<tr class="indiaLivesFonts" style="font-size:14px;">
					<td style="font-size:14px;";>
					 <ul>		
						<li type="square">Manage the community</li>
					 </ul>	
					</td>
				</tr>
				<tr class="indiaLivesFonts" style="font-size:14px;">
				<td>
					<ul>
						<li type="square">Manage the visitors</li>
					</ul>
				</td>
				</tr>
				<tr class="indiaLivesFonts" style="font-size:14px;">
				<td>
					<ul>
						<li type="square">Complete online solutions</li>
					</ul>
				</td>
				</tr>			
			</table>	
		</td>
		</tr>	
	</table>
</td>

<td valign="top" align="center">

<fieldset style="width:300px">
<legend class="indiaLivesFonts"><b>Sign In</b></legend>
<table border="0" align="left" cellpadding="1" cellspacing="1" class="indiaLivesFonts">
	<tr>
		<td>Email/Mobile</td>
		<td><input  type="text" name="username" value=""></td>
		<td colspan="1">&nbsp;</td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password" value=""></td>
		<td colspan="1">&nbsp;</td>
	</tr>
	<tr>
		<td>Remember Me</td>
		<td><input type="checkbox" name="remember" ></td>
		<td colspan="1">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="1">&nbsp;</td>
		<td align="right" colspan="1"><input type="button"
			value="Sign In" onclick="submitLogin()"><input type="reset"
			value="Clear"></td>
		<td colspan="1">&nbsp;</td>	
	</tr>
	<tr>
		<td colspan="1">&nbsp;</td>
		<td align="right" colspan="1"><a href="#">Sign In Problems?</a></td>
		<td colspan="1">&nbsp;</td>
	</tr>
	</table>
</fieldset>

<fieldset style="width:300px">
<legend class="indiaLivesFonts"><b>Don't have IL Account?</b></legend>
<table border="0" align="left" cellpadding="1" cellspacing="1" class="indiaLivesFonts">
	<tr>
		<td colspan="1">&nbsp;</td>
		<td colspan="1" align="left"><input type="button" name="newUser" value="Start Here"></td>
		<td colspan="1">&nbsp;</td>
	</tr>
	</table>
</fieldset>
</td>



</tr>


</table>
<%@include file="footer.jsp" %>

<input type="hidden" name="event" value="login"> <input
	type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"
	value="<%=LoginUser.class.getName()%>">
	<input type="hidden" name="username" >
</form>
</body>
</html>