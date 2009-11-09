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
<%@page import="com.indialives.voobjects.RolePrivilegesVO"%>
<%@page import="com.indialives.dataobjects.ParkingDO"%>
<%@page import="com.indialives.dataobjects.ParkingSlotDO"%>
<%@page import="com.indialives.voobjects.ParkingSlotVO"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" src="/indialives/js/parkingList.js"></script>
</head>
<body>
<%
	HashMap parkingMap=(HashMap)request.getAttribute(SetAttributeConstants.PARKING_SLOT_LIST);
	List parkingList=(List) request.getAttribute(SetAttributeConstants.PARKING_LIST);
	


%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>	
	<td width="15%">
	<%@include file="contentPage.jsp" %>	
	</td>	
	 <td  valign="top"  height="100%">	
	   <fieldset style="height: 99%;" >
	  <legend class="indiaLivesFonts" >Parkings</legend>
	 	<form name="parkingListFrm" action="/indialives/eventhandler" method="post">
	 
	
		<table border="0" width="90%" height="80%" style="margin-left: 50px">
		<tr class="indiaLivesFonts" valign="top">
			<td>
				Parking List,				
			</td>
		</tr>
			<%		
				if(parkingList!=null){
				for(int i=0;i<parkingList.size();i++){				
				
					 ParkingDO parkingDO=(ParkingDO)parkingList.get(i);
					 
					List parkingSlotList=(List)parkingMap.get(parkingDO.getId());	
						
				%>
				<tr class="indiaLivesFonts">
				<td>
				<%
					if(parkingSlotList!=null){ %>
				
				<fieldset style="width: 95%;height: 100%;">
					<legend><%=parkingDO.getName()%></legend>
					 <div style="height: 107px" class="scroll">	
						<table  width="100%"  border="1" cellpadding="0" cellspacing="0">						
								<%							
									for(int j=0;j<parkingSlotList.size();j++){
										ParkingSlotVO parkingSlotVO=(ParkingSlotVO)parkingSlotList.get(j);
										String parkingSlotLocation=parkingSlotVO.getLocation();
								%>
								<% %>
								<tr>
								<td><%=j+1%>.</td>
						<!-- <td><a href="#" style="text-decoration: none" onclick="viewProfile('<%=parkingSlotVO.getId()%>','<%=parkingSlotVO.getParkingId()%>')" ><%=parkingSlotLocation%></a></td> -->
								<td><%=parkingSlotLocation%></td>
								
								</tr>
							<%}%>
							</table>
							</div>
								
				</fieldset>
				
				<%}%>
				</td>
				</tr>				
		<%}}%>
		
		</table>
	
	<input type="hidden" name="event" value="parkingProfile">
	<input type="hidden" name="parkingSlotId">
	<input type="hidden" name="parkingId" >
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