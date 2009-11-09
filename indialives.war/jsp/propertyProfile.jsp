<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.voobjects.FlatVO"%>
<%@page import="com.indialives.dataobjects.VillaDO"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
</head>
<body>
<%
	Object object=request.getAttribute(SetAttributeConstants.PROPERTY_OBJ);
%>
<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;">
	   <legend style="font-size:16px;">Property  Profile</legend>
	   	  	
	   	  <form name="propertyHome" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="40%" align="center" style="margin-left: 50px;margin-top: 100px">
			
			<%if(object instanceof FlatVO){
				
				FlatVO flatVO=(FlatVO)object;
				
				
		%>
		<tr>
			<td>Block Name </td>
			<td><%=flatVO.getBlockName()%></td>
		</tr>
		<tr>
			<td>Floor</td>
			<td><%=flatVO.getFloor()%></td>
		</tr>
		<tr>
			<td>Flat No</td>
			<td><%=flatVO.getFlatNo()%></td>
		</tr>
		<tr>
			<td>Flat Type Name</td>
			<td><%=flatVO.getFlatTypeName()%></td>
		</tr>
		<tr>
			<td>No of Bedroom</td>
			<td><%=flatVO.getNoOfBedRooms()%></td>
		</tr>
		
		<%	}else if(object instanceof VillaDO){
				VillaDO villaDO=(VillaDO) object;				
	%>			
			<tr>
			<td>Plot No </td>
			<td><%=villaDO.getPlotNo()%></td>
		</tr>
		<tr>
			<td>No of Floor</td>
			<td><%=villaDO.getNoOfFloors()%></td>
		</tr>
		<tr>
			<td>Villa Name</td>
			<td><%=villaDO.getName()%></td>
		</tr>
		<tr>
			<td>No of Bedroom</td>
			<td><%=villaDO.getNoOfBedRooms()%></td>
		</tr>
		<tr>
			<td>No of parkings</td>
			<td><%=villaDO.getNoOfParkings()%></td>
		</tr>
	
	<%}%>
	
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