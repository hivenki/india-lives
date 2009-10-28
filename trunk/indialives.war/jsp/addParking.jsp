<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<%@include file="addParking.jspf"%>
</head>



<body>
<%
 List parkingList=(List)request.getAttribute(SetAttributeConstants.PARKING_LIST);
%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 98%;width: 100%">
	   <legend style="font-size:16px;">Create Parking</legend>
	   	  
	   	  <form name="addParkingFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;margin-top: 120px">
					
		<tr>
			<td>Name</td>
			<td><input type="text" name="name" size="37"></td>
		</tr>
		<tr>
			<td>Description </td>
			<td><input type="text" name="description" size="37"></td>
		</tr>		
		<tr>
		<td colspan="2"  align="right" >
			<input type="button" name="add" value="Add" onclick="addParking()">
		</td>		
		</tr>
		</table>		
		<input type="hidden" name="event" value="addParking">
		</form>
		</fieldset>	
	</td>
	<td valign="top" width="15%" class="indiaLivesFonts">
		<fieldset style="height: 98%;" >
	    	<legend>Adv Board</legend>			
		</fieldset>
	</td>

	</tr>
	
</table>
<%@include file="footer.jsp" %>

</body>
</html>