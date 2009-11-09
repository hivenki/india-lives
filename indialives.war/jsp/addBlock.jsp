<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.Blocks"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/addBlock.js"></script>
</head>



<body>

<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;width: 100%">
	   <legend style="font-size:16px;">Create Block</legend>
	   	  
	   	  <form name="addBlockFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;margin-top: 120px">
					
		<tr>
			<td>Block Name</td>
			<td><input type="text" name="name" size="35"></td>
		</tr>
		<tr>
			<td>Description </td>
			<td><input type="text" name="description" size="35"></td>
		</tr>		
		<tr>
			<td>No of Floors </td>
			<td><input type="text" name="noOfFloors" size="35"></td>
		</tr>
		<tr>
		<td colspan="2"  align="right" >
			<input type="button" name="add" value="Add" onclick="addBlock()">
		</td>		
		</tr>
		</table>
		<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=Blocks.class.getName()%>">
		<input type="hidden" name="event" value="addBlock">
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