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
	onload="errorMsg('<%=request.getParameter(SetAttributeConstants.AUTH_ERROR_MSG)%>')">
<form name="loginFrm" action="/indialives/eventhandler" method="post">
<table border="1" height="92%">
<tr>
<td width="75%" height="100%"  valign="top" >
	<table border="0" width="100%" height="100%">
	<tr  style="font-family: calibri;font-size:xx-large;">
		<td >Indialives</td>
	</tr>
	<tr>
		<td><hr/></td>
	</tr>
	<tr>
	<td height="100%">
		<table border="0" style="margin-left: 200px;" width="70%" height="50%">
			<tr height="100%" style="font-family: calibri;font-size:14px;">
				<td style="font-size:14px;"; height="100%" >
				<ul>			
					<li type="square"><a href="paycommunitybils" style="text-decoration: none; "> Pay community bills</a></li>
				
				</ul>
				</td>
			</tr>
			<tr style="font-family: calibri;font-size:14px;">
				<td>	
				<ul>		
					<li type="square"><a href="paycommunitybils" style="text-decoration: none; "> Raise complaints</a></li>
				</ul>
				</td>
			</tr>
			<tr style="font-family: calibri;font-size:14px;">
				<td>
				<ul>
					<li type="square"><a href="paycommunitybils" style="text-decoration: none; "> Book Amenities</a></li>
				</ul>
				</td>
			</tr>
			<tr style="font-family: calibri;font-size:14px;">
				<td style="font-size:14px;";>
				 <ul>		
					<li type="square"><a href="paycommunitybils" style="text-decoration: none; "> Manage the community</a></li>
				 </ul>	
				</td>
			</tr>
			<tr style="font-family: calibri;font-size:14px;">
			<td>
				<ul>
					<li type="square"><a href="paycommunitybils" style="text-decoration: none; "> Manage the visitors</a></li>
				</ul>
			</td>
			</tr>
			<tr style="font-family: calibri;font-size:14px;">
			<td>
				<ul>
					<li type="square"><a href="paycommunitybils" style="text-decoration: none; "> Complete online Solutions</a></li>
				</ul>
			</td>
			</tr>			
		</table>	
	</td>
	</tr>	
	</table>
</td>

<td valign="top">
<div style="border-style:ridge;border-width:2px;width: 25%;float: right;" >
<table border="0" align="right" cellpadding="2" cellspacing="2" style="font-family: calibri;font-size:16px;">
	<tr>
		<td colspan="2"  >Sign In</td>
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
		<td>Remember</td>
		<td><input type="checkbox" name="remember"></td>
	
	</tr>
	<tr>
		<td align="right" colspan="2"><input type="button"
			value="Sign In" name="signIn" onclick="submitLogin()"></td>		
	</tr>
	<tr>
		<td align="right" colspan="2">Sing In Members</td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td colspan="2">Don't have IL Account</td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="button" name="newUser" value="Start Here"></td>
	</tr>
	</table>
	

</div>

<div style="border-style:ridge;border-width:2px;width: 100%;height: 100%"></div>
</td>



</tr>


</table>

<table border="0" width="100%" align="right">
	<tr align="right" style="font-family: calibri;font-size:14px;">
		<td width="70%">
			AboutIL |	
		</td>
		<td>
			Terms |
		</td>
		<td>
			Press |	
		</td>
		<td>
			Partners |
		</td>
		<td>
			Careers |
		</td>
		<td>
			Customers
		</td>
	
	</tr>
	<tr style="font-family: calibri;font-size:14px;">
		<td align="right" colspan="6">
			copyright 2009 IndiaLives all rights reserved.
		</td>
	</tr>

</table>
<input type="hidden" name="event" value="login"> <input
	type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"
	value="<%=LoginUser.class.getName()%>">
	<input type="hidden" name="username" >
</form>
</body>
</html>