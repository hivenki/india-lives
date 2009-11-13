<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.voobjects.FlatVO"%>
<%@page import="com.indialives.dataobjects.VillaDO"%>
<%@page import="com.indialives.voobjects.ParkingSlotVO"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/propertyProfile.js"></script>
</head>
<body>
<%
	Object object=request.getAttribute(SetAttributeConstants.PROPERTY_OBJ);
	List parkingSlotlist=(List)request.getAttribute(SetAttributeConstants.PARKING_SLOT_LIST);
	
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
	   	  	
	   	  <form name="propertyProfileFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;margin-top: 30px">
			
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
		<tr>
		<td colspan="2">
			&nbsp;
		</td>
		</tr>
		</table>
		<div style="height: 200px" class="scroll">
		 <fieldset style="height: 95%;">
	   		<legend style="font-size:16px;">Parking Slot</legend>
		    <table class="tableBgColor" width="50%" border="0" align="center" style="margin-left: 50px;margin-top: 30px"      cellpadding="1" cellspacing="1" >
		    <tr class="trColor"  >
				<td width="8%">S.No</td>
				<td>Parking Name</td>
				<td>Location</td>				
			</tr>	
		    <%	
				int parkingSlotrowSize=parkingSlotlist.size();
		    	if(parkingSlotrowSize<5){
		    		parkingSlotrowSize=5;
		    	}
		    	for(int i=0;i<parkingSlotrowSize;i++){
		    		if(i%2==0){%>
						<tr class="evenTr" style="height:  20px;text-indent: 4px;" >
						<%}else{%>
						<tr class="oddTr"  style="height:  20px;" style="text-indent: 4px">
					<%}
						
					if(i<parkingSlotlist.size()){
						ParkingSlotVO parkingSlotVO=(ParkingSlotVO)parkingSlotlist.get(i);									%>
					<td><%=i+1%></td>
					<td><%=parkingSlotVO.getParkingName()%></td>
					<td><%=parkingSlotVO.getLocation()%></td>
					<%}else{%>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>		
					<%}}%>					 
			    </table>
			      </fieldset>
		 		 </div>
		<input type="hidden" name="event" value="addParkingSlotForProperty"/>
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