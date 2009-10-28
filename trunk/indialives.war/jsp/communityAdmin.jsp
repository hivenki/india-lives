<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.voobjects.FlatVO"%>
<%@page import="com.indialives.dataobjects.VillaDO"%>
<%@page import="com.indialives.dataobjects.BlockDO"%>	

<%@page import="com.indialives.dataobjects.FlatTypeEnumDO"%>
<%@page import="com.indialives.dataobjects.ParkingDO"%>
<%@page import="com.indialives.voobjects.ParkingSlotVO"%><html>			
<head>
<title>Welcome to IndiaLives</title>
<%@include file="complaintsList.jspf"%>
<%@include file="indialives_css.jspf"%>
<%@include file="indialives_tab.jspf"%>
<%@include file="tabber.jspf"%>
<%@include file="tabber-minimized.jspf"%>
<%@include file="communityAdmin.jspf"%>
<%@ include file="header.jspf" %>
</head>

<body>
<%
	List flatsList=(List)request.getAttribute(SetAttributeConstants.FLATS_LIST);
	List villasList=(List)request.getAttribute(SetAttributeConstants.VILLA_LIST);
	List blockList=(List)request.getAttribute(SetAttributeConstants.BLOCK_LIST);

	List flatTypeList=(List)request.getAttribute(SetAttributeConstants.FLAT_TYPE_LIST);
	List parkingList=(List)request.getAttribute(SetAttributeConstants.PARKING_LIST);
	List parkingSlotList=(List)request.getAttribute(SetAttributeConstants.PARKING_SLOT_LIST);

%>
<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>	
	<td width="15%" >
	<%@include file="contentPage.jsp" %>	
	</td>	
	<td valign="top" height="100%" >
	
	
	
	<div class="tabber" id="divHome" style="margin-top: 12px" >
			<div class="tabbertab" title="Blocks" style="height: 418px">
		    <fieldset  class="indiaLivesFonts" style="height: 100%" >
		    <legend>Blocks</legend>
		    <table border="0" width="100%">
		    	<tr>
				<td align="right"><input type="button" name="block" value="Add" onclick="addBlock()"></td>
			</tr>
		    </table>
		   <table width="100%" border="1" cellpadding="0" cellspacing="0" >
		   
			 <tr class="indiaLivesFonts">
				<th>S.No</th>
				<th>Block Name</th>
				<th>Block Description</th>
				<th>No of Floors</th>
			</tr>
			<%
			if(blockList!=null){
				
				int size=0;
				int rowSize=12;
				   if(blockList.size()< rowSize){
					   size=rowSize;
				   }
				   else{
						size=blockList.size();   
				   }
				
			for(int j=0;j<size;j++){
					 if(j%2==0){%>
						<tr class="T1" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="T2" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}%>	
		    <%if(j<blockList.size()){
		    //	 for(int i=0;i<blockList.size();i++){
		    	 BlockDO blockDO=(BlockDO)blockList.get(j); %>
		    
				<td><%=j+1%></td>
				<td><%=blockDO.getName()%></td>
				<td><%=blockDO.getDescription() %></td>
				<td><%=blockDO.getNoOfFloors()%></td>	
				    			
		    <%}else{%>		    
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>				
				<%} %>
				</tr>
				<%}} %>
		    </table>
		    
		     </fieldset>
		         
		    
		  </div>
			
			<div class="tabbertab" title="Flat Type" style="height: 418px">
		    <fieldset  class="indiaLivesFonts" style="height: 100%" >
		    <legend>Flat Type</legend>
		    <table border="0" width="100%">
		    	<tr>
				<td align="right"><input type="button" name="block" value="Add" onclick="addFlatType()"></td>
			</tr>
		    </table>
		   <table width="100%" border="1" cellpadding="0" cellspacing="0" >
		   
			 <tr class="indiaLivesFonts">
				<th>S.No</th>
				<th>Flat Type Name</th>
				<th>Description</th>				
			</tr>
			<%
			if(flatTypeList!=null){
				
				int size=0;
				int rowSize=12;
				   if(flatTypeList.size()< rowSize){
					   size=rowSize;
				   }
				   else{
						size=flatTypeList.size();   
				   }
				
			for(int j=0;j<size;j++){
					 if(j%2==0){%>
						<tr class="T1" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="T2" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}%>	
		    <%if(j<flatTypeList.size()){
		    //	 for(int i=0;i<blockList.size();i++){
		    	 FlatTypeEnumDO flatTypeEnumDO=(FlatTypeEnumDO)flatTypeList.get(j); %>
		    
				<td><%=j+1%></td>
				<td><%=flatTypeEnumDO.getName()%></td>
				<td><%=flatTypeEnumDO.getDescription() %></td>				
				    			
		    <%}else{%>		    
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>					
				<%} %>
				</tr>
				<%}} %>
		    </table>
		    
		     </fieldset>
		         
		    
		  </div>
				
		  <div class="tabbertab" title="Flats" id="flatTab" style="height: 418px">
		    <fieldset style="height: 100%" class="indiaLivesFonts" >
		    <legend>Flats</legend>
		    <table border="0" width="100%">
		    <tr>
				<td align="right"><input type="button" name="flat" value="Add" onclick="addFlat()"></td>
			</tr>
		    </table>
		   <table width="100%" border="1" cellpadding="0" cellspacing="0" >
		     <tr class="indiaLivesFonts">
				<th>S.No</th>
				<th>Block Name</th>
				<th>Floor</th>
				<th>Flat No</th>
				<th>Flat Type</th>
				<th>No of Bedrooms</th>
			</tr>
		    <%
				if(flatsList!=null){
				
				int size=0;
				int rowSize=12;
				   if(flatsList.size()< rowSize){
					   size=rowSize;
				   }
				   else{
						size=flatsList.size();   
				   }
				
		    	
		    		for(int i=0;i<size;i++){
		    			 if(i%2==0){%>
							<tr class="T1" style="height:  20px;color: black;" style="text-indent: 4px">
							<%}else{%>
							<tr class="T2" style="height:  20px;color: black;" style="text-indent: 4px">
					<%}%>	
		    <%if(i<flatsList.size()){		
		    			FlatVO flatVO=(FlatVO)flatsList.get(i); %>
		   
				<td><%=i+1%></td>
				<td><%=flatVO.getBlockName()%></td>
				<td><%=flatVO.getFloor()%></td>
				<td><%=flatVO.getFlatNo()%></td>	
				<td><%=flatVO.getFlatTypeName()%></td>
				<td><%=flatVO.getNoOfBedRooms()%></td>
				<%}else{%>		    
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>	
				<td>&nbsp;</td>
				<td>&nbsp;</td>				
				<%} %>
				</tr>
				<%}} %>
		    </table>
		   
		    </fieldset>
		         
		    
		  </div>
		
		  <div class="tabbertab" title="Villas" id="villaTab" style="height: 418px" >
		    <fieldset style="height: 100%" class="indiaLivesFonts" >
		    <legend>Villas</legend>
		   <table border="0" width="100%"> 
		    <tr>
				<td colspan="6" align="right"><input type="button" name="villa" value="Add" onclick="addVilla()"></td>
			</tr>
			</table>
		    <table width="100%" border="1" cellpadding="0" cellspacing="0" >
		    <tr class="indiaLivesFonts">
				<th>S.No</th>
				<th>Plot No</th>
				<th>No of Floors</th>
				<th>Villa Name</th>				
				<th>No of Bedrooms</th>
				<th>No of Parkings</th>
			</tr>	
		    <%	if(villasList!=null){
		    	int size=0;
				int rowSize=12;
				   if(villasList.size()< rowSize){
					   size=rowSize;
				   }
				   else{
						size=villasList.size();   
				   }
				
		    	
		    		for(int i=0;i<size;i++){	    			
		    			if(i%2==0){%>
						<tr class="T1" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="T2" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}%>	
		    	 <%if(i<villasList.size()){		
		    			VillaDO villaDO=(VillaDO)villasList.get(i); %>
		    <tr style="text-indent: 4px">
				<td><%=i+1%></td>
				<td><%=villaDO.getPlotNo()%></td>
				<td><%=villaDO.getNoOfFloors()%></td>
				<td><%=villaDO.getName()%></td>
				<td><%=villaDO.getNoOfBedRooms()%></td>
				<td><%=villaDO.getNoOfParkings()%></td>	
				<%}else{%>		    
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>					
					<%}%>
					</tr>
					<%}} %>   
			    </table>
			    
		    </fieldset>
		    
		  </div>
		  
		   <div class="tabbertab" title="Parking" id="villaTab" style="height: 418px" >
		    <fieldset style="height: 100%" class="indiaLivesFonts" >
		    <legend>Parking</legend>
		   <table border="0" width="100%"> 
		    <tr>
				<td colspan="6" align="right"><input type="button" name="parking" value="Add" onclick="addParking()"></td>
			</tr>
			</table>
		    <table width="100%" border="1" cellpadding="0" cellspacing="0" >
		    <tr class="indiaLivesFonts">
				<th>S.No</th>
				<th>Name</th>
				<th>Description</th>				
			</tr>	
		    <%	if(parkingList!=null){
		    	int size=0;
				int rowSize=12;
				   if(parkingList.size()< rowSize){
					   size=rowSize;
				   }
				   else{
						size=parkingList.size();   
				   }
				
		    	
		    		for(int i=0;i<size;i++){	    			
		    			if(i%2==0){%>
						<tr class="T1" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="T2" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}%>	
		    	 <%if(i<parkingList.size()){		
		    			ParkingDO parkingDO=(ParkingDO)parkingList.get(i); %>
		    <tr style="text-indent: 4px">
				<td><%=i+1%></td>
				<td><%=parkingDO.getName()%></td>
				<td><%=parkingDO.getDescription()%></td>
				<%}else{%>		    
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>								
					<%}%>
					</tr>
					<%}} %>   
			    </table>
			    
		    </fieldset>
		    
		  </div>
		  
		  
		   <div class="tabbertab" title="Parking Slot" id="villaTab" style="height: 418px" >
		    <fieldset style="height: 100%" class="indiaLivesFonts" >
		    <legend>Parking Slot</legend>
		   <table border="0" width="100%"> 
		    <tr>
				<td colspan="6" align="right"><input type="button" name="parkingSlot" value="Add" onclick="addParkingSlot()"></td>
			</tr>
			</table>
		    <table width="100%" border="1" cellpadding="0" cellspacing="0" >
		    <tr class="indiaLivesFonts">
				<th>S.No</th>
				<th>Name</th>
				<th>Description</th>				
			</tr>	
		    <%	if(parkingSlotList!=null){
		    	int size=0;
				int rowSize=12;
				   if(parkingSlotList.size()< rowSize){
					   size=rowSize;
				   }
				   else{
						size=parkingSlotList.size();   
				   }
				
		    	
		    		for(int i=0;i<size;i++){	    			
		    			if(i%2==0){%>
						<tr class="T1" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="T2" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}%>	
		    	 <%if(i<parkingSlotList.size()){		
		    			ParkingSlotVO parkingSlotVO=(ParkingSlotVO)parkingSlotList.get(i); %>
		    <tr style="text-indent: 4px">
				<td><%=i+1%></td>
				<td><%=parkingSlotVO.getParkingSlotName()%></td>
				<td><%=parkingSlotVO.getLocation()%></td>
				<%}else{%>		    
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>								
					<%}%>
					</tr>
					<%}} %>   
			    </table>
			    
		    </fieldset>
		    
		  </div>
		  
		  
		
	</div>
	<form name="communityAdmin" action="/indialives/eventhandler" method="post">
	<input type="hidden" name="event">
	</form>	
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