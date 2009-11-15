<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/forgotPassword.js"></script>
</head>
<%

	String messag=request.getParameter("message");
%>
<body onload="showMsg('<%=messag%>')">
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
	  <fieldset style="height: 99%;width: 100%">
	   <legend style="font-size:16px;">Forgot Password</legend>
	   	  
	   	  <form name="forgotPasswordFrm" action="/indialives/eventhandler" method="post">
	    	<table class="formFonts" border="0" width="50%" align="center" style="margin-left: 50px;margin-top: 120px">
					
		<tr>
			<td>Email/Mobile No</td>
			<td><input  type="text" name="username"  size="35"></td>			
		</tr>
		<tr>
			<td>Reset Password</td>
			<td><input  type="password" name="resetPasword" size="35" ></td>			
		</tr>
		<tr>
		<td >&nbsp;</td>
		<td width="50%" align="right" style="margin-left: 100px">
		<input type="button" onclick="submitBack()"	value="Back">
		<input type="button" value="Submit" onclick="submitForgot()">
		<input type="reset" value="Clear"></td>
		<td colspan="1">&nbsp;</td>	
		</tr>
		</table>
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