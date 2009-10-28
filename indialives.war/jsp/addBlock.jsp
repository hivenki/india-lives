<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<%@page import="com.indialives.dataobjects.FlatDO"%>
<%@page import="com.indialives.dataobjects.VillaDO"%>
<%@page import="com.indialives.voobjects.FlatVO"%>
<%@page import="com.indialives.dataobjects.ParkingSlotDO"%>
<%@page import="com.indialives.voobjects.ParkingSlotVO"%>
<%@page import="com.indialives.dataobjects.FlatTypeEnumDO"%>
<%@page import="com.indialives.dataobjects.BlockDO"%>
<%@page import="com.indialives.formbean.Flats"%>
<%@page import="com.indialives.formbean.Blocks"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<%@include file="addBlock.jspf"%>
</head>



<body>
<%
 List blockList=(List)request.getAttribute(SetAttributeConstants.BLOCK_LIST);
%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 98%;width: 100%">
	   <legend style="font-size:16px;">Create Block</legend>
	   	  <fieldset style="margin-top: 100px;">	
	   	  <form name="addBlockFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;">
					
		<tr>
			<td>Block Name</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>Description </td>
			<td><input type="text" name="description"></td>
		</tr>		
		<tr>
			<td>No of Floors </td>
			<td><input type="text" name="noOfFloors" ></td>
		</tr>
		<tr>
		<td colspan="2" align="right">
			<input type="button" name="add" value="Add" onclick="addBlock()">
		</td>		
		</tr>
		</table>
		<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=Blocks.class.getName()%>">
		<input type="hidden" name="event" value="addBlock">
		</form>
		</fieldset>
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