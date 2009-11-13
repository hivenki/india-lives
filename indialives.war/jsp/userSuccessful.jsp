<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.Users"%>
<%@page import="com.indialives.SetAttributeConstants"%><html>
<head>
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
	   <legend style="font-size:16px;"></legend>
	   	  
	   	  <form name="addUserFrm" action="/indialives/eventhandler" method="post">
	    
		<table border="0" width="80%" align="center" style="margin-left: 15px;margin-top: 180px">	

		<tr align="center" style="margin-left: 100px;font-size:18px;">
		<td >
		Your account has been created successfully!!!
		</td>
		</tr>
		<tr  align="center"  style="margin-left: 50px;font-size:18px;">
		<td>Click back to login page to sign into IndiaLives.</td>
		</tr>
		<tr>
		<td align="center"  style="margin-left: 50px;font-size:18px;"><a style="text-decoration: none;color: blue" href="eventhandler?event=index"> Back </a></td>
		</tr>
		</table>
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