<%@page import="com.indialives.voobjects.FlatVO"%>
<%@page import="com.indialives.dataobjects.VillaDO"%>
<%@page import="com.indialives.dataobjects.BlockDO"%>	

<%@page import="com.indialives.dataobjects.FlatTypeEnumDO"%>
<%@page import="com.indialives.dataobjects.ParkingDO"%>
<%@page import="com.indialives.voobjects.ParkingSlotVO"%>
<%@page import="com.indialives.ApplicationConstants"%>

<%
	List flatsList=(List)request.getAttribute(SetAttributeConstants.FLATS_LIST);
	List villasList=(List)request.getAttribute(SetAttributeConstants.VILLA_LIST);
	List blockList=(List)request.getAttribute(SetAttributeConstants.BLOCK_LIST);

	List flatTypeList=(List)request.getAttribute(SetAttributeConstants.FLAT_TYPE_LIST);
	List parkingList=(List)request.getAttribute(SetAttributeConstants.PARKING_LIST);
	List parkingSlotList=(List)request.getAttribute(SetAttributeConstants.PARKING_SLOT_LIST);
	
	String uploadParkingSlotErrorMessage=(String)session.getAttribute(SetAttributeConstants.PARKING_ERROR_LIST);
	session.setAttribute(SetAttributeConstants.PARKING_ERROR_LIST,null);
	
	String delteBlockErrormessage=(String)session.getAttribute(SetAttributeConstants.DELETE_BLOCKS_ERROR_MSG);
	session.setAttribute(SetAttributeConstants.DELETE_BLOCKS_ERROR_MSG,null);

%>


<html>			
<head>
<title>Welcome to IndiaLives</title>
<%@include file="complaintsList.jspf"%>
<%@include file="indialives_css.jspf"%>
<%@include file="indialives_tab.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/tabPersistent.js">


</script>







<%@include file="tabber.jspf"%>
<%@include file="communityAdmin.jspf"%>
<%@ include file="header.jspf" %>
</head>

<script type="text/javascript">
	var uploadParkingSlotErrorMessage='<%=uploadParkingSlotErrorMessage%>';
	if(uploadParkingSlotErrorMessage!='null' && uploadParkingSlotErrorMessage.length > 0 ){
		alert("The following parking names are not available \n"+uploadParkingSlotErrorMessage);
		
	}
	var delteBlockErrormessage='<%=delteBlockErrormessage%>';
	if(delteBlockErrormessage!='null' && delteBlockErrormessage.length >0){
		alert("The following block names are in use \n"+delteBlockErrormessage);
	}
	
</script>

<body>

<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>	
	<td width="15%" >
	<%@include file="contentPage.jsp" %>	
	</td>	
	<td valign="top" height="100%" >
	<div class="tabber"  id="divHome" style="margin-top: 12px" >
			<div class="tabbertab" title="Blocks" style="height: 418px">
		    <fieldset  class="indiaLivesFonts" style="height: 100%" >
		    <legend>Blocks</legend>
		    <table border="0" width="100%">
		    	<tr>
				<td align="right" width="100%"><input type="button" name="block" value="Add" onclick="addBlock()"></td>
				<td><input type="button" name="deleteButton" value="Delete" onclick="deleteBlock('<%=blockList.size()%>')"></td>
			</tr>
		    </table>
		   <table class="tableBgColor" width="100%"  cellpadding="1" cellspacing="1" >
		   
			 <tr class="trColor">
			 	<th  nowrap="nowrap"  width="5%"><input type="checkbox" name="selectall" onclick="doSelectAll('<%=blockList.size()%>')" ></th>
				<th  nowrap="nowrap">S.No</th>
				<th  nowrap="nowrap">Block Name</th>
				<th  nowrap="nowrap">Block Description</th>
				<th  nowrap="nowrap">No of Floors</th>
			</tr>
			<%
				int blockRowSize=blockList.size();
		    	if(blockRowSize<12){
		    		blockRowSize=12;
		    	} 
				
			for(int j=0;j<blockRowSize;j++){
					 if(j%2==0){%>
						<tr class="evenTr" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="oddTr" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}	
				if(j<blockList.size()){	    
		    	 BlockDO blockDO=(BlockDO)blockList.get(j); %>
		    	<td><input type="checkbox"  name="select[<%=j%>]" value="<%=blockDO.getId()%>" onclick="monitor(this,'<%=blockList.size()%>')"></td>
				<td><%=j+1%></td>
				<td><%=blockDO.getName()%></td>
				<td><%=blockDO.getDescription() %></td>
				<td><%=blockDO.getNoOfFloors()%></td>	
		   	  <%}else{%>		    
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>	
				<td>&nbsp;</td>			
				<%}}%>				
		    </table>
		    
		     </fieldset>
		         
		    
		  </div>
			
			<div class="tabbertab" id="flat"  title="Flat Type" style="height: 418px">
		    <fieldset  class="indiaLivesFonts" style="height: 100%" >
		    <legend>Flat Type</legend>
		    <table border="0" width="100%">
		    	<tr>
				<td align="right"><input type="button" name="block" value="Add" onclick="addFlatType()"></td>
			</tr>
		    </table>
		   <table class="tableBgColor" width="100%"  cellpadding="1" cellspacing="1" >
		   
			 <tr class="trColor">
				<th width="8%">S.No</th>
				<th>Flat Type Name</th>
				<th>Description</th>				
			</tr>
			<%
				int flatTypeRowSize=flatTypeList.size();
		    	if(flatTypeRowSize<12){
		    		flatTypeRowSize=12;
		    	} 
					
			for(int j=0;j<flatTypeRowSize;j++){
					 if(j%2==0){%>
						<tr class="evenTr" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="oddTr" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}	
		    if(j<flatTypeList.size()){
		      	 FlatTypeEnumDO flatTypeEnumDO=(FlatTypeEnumDO)flatTypeList.get(j); %>
		   		<td><%=j+1%></td>
				<td><%=flatTypeEnumDO.getName()%></td>
				<td><%=flatTypeEnumDO.getDescription() %></td>				
			 <%}else{%>		    
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>					
				<%}}%>				
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
		    <div style="height: 289px" class="scroll">
		   <table class="tableBgColor" width="100%"  cellpadding="1" cellspacing="1" >
		     <tr class="trColor">
				<th>S.No</th>
				<th>Block Name</th>
				<th>Floor</th>
				<th>Flat No</th>
				<th>Flat Type</th>
				<th>No of Bedrooms</th>
			</tr>
		    <%
			    int flatRowSize=flatsList.size();
		    	if(flatRowSize<12){
		    		flatRowSize=12;
		    	} 
		    	
		    		for(int i=0;i<flatRowSize;i++){
		    			 if(i%2==0){%>
							<tr class="evenTr" style="height:  20px;color: black;" style="text-indent: 4px">
							<%}else{%>
							<tr class="oddTr" style="height:  20px;color: black;" style="text-indent: 4px">
					<%}	
		    if(i<flatsList.size()){		
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
				<%}} %>
				
		    </table>
		    </div>
		      <form  action="/indialives/eventhandler" method="post" enctype="multipart/form-data" name="uploadFlatFrm">
		    <table border="0" width="100%">
		    <tr>
		    	<td width="25%">Upload CSV file</td>
		    	<td width="50%" ><input type="file" name="<%=ApplicationConstants.FILE_TYPE_NAME%>" size="50" > </td>
		    	<td><input type="button" name="upload" value="Upload" onclick="uploadCSV()" ></td>
		    </tr>		    
		    </table>
		    
		    <input type="hidden" name="event">
		    </form>
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
			<div style="height: 289px" class="scroll">
		    <table class="tableBgColor"  width="100%"  cellpadding="1" cellspacing="1" >
		    <tr class="trColor">
				<th>S.No</th>
				<th>Plot No</th>
				<th>No of Floors</th>
				<th>Villa Name</th>				
				<th>No of Bedrooms</th>
				<th>No of Parkings</th>
			</tr>	
		    <%	
			    int villarowSize=villasList.size();
		    	if(villarowSize<12){
		    		villarowSize=12;
		    	} 
		    	
		    		for(int i=0;i<villarowSize;i++){	    			
		    			if(i%2==0){%>
						<tr class="evenTr" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="oddTr" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}	
		    	 if(i<villasList.size()){		
		    			VillaDO villaDO=(VillaDO)villasList.get(i); %>
		    
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
					<%}}%>   
			    </table>
			    </div>
			      <form name="uploadVillaFrm"  action="/indialives/eventhandler" method="post" enctype="multipart/form-data" >
				    <table border="0" width="100%">
				    <tr>
				    	<td width="25%" >Upload CSV file</td>
				    	<td width="50%"><input type="file" name="<%=ApplicationConstants.FILE_TYPE_NAME %>" size="50" > </td>
				    	<td><input type="button" name="upload" value="Upload" onclick="uploadVilla()" ></td>
				    </tr>		    
				    </table>
		    
		    		<input type="hidden" name="event">
		   		 </form>
			    
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
		    <table class="tableBgColor" width="100%" cellpadding="1" cellspacing="1" >
		    <tr class="trColor">
				<th width="8%">S.No</th>
				<th>Name</th>
				<th>Description</th>				
			</tr>	
		    <%	
			    int parkingrowSize=parkingList.size();
		    	if(parkingrowSize<12){
		    		parkingrowSize=12;
		    	}    	
		    		for(int i=0;i<parkingrowSize;i++){	    			
		    			if(i%2==0){%>
						<tr class="evenTr" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="oddTr" style="height:  20px;color: black;" style="text-indent: 4px">
					<%}	
		    	 if(i<parkingList.size()){		
		    			ParkingDO parkingDO=(ParkingDO)parkingList.get(i); %>
		   		<td><%=i+1%></td>
				<td><%=parkingDO.getName()%></td>
				<td><%=parkingDO.getDescription()%></td>
				<%}else{%>		    
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>								
					<%}}%>				   
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
			<div style="height: 288px" class="scroll">
		    <table class="tableBgColor"   width="100%"   cellpadding="1" cellspacing="1" >
		    <tr class="trColor"  >
				<th width="8%">S.No</th>
				<th>Name</th>
				<th>Description</th>				
			</tr>	
		    <%	
				int parkingSlotrowSize=parkingSlotList.size();
		    	if(parkingSlotrowSize<12){
		    		parkingSlotrowSize=12;
		    	}
		    	for(int i=0;i<parkingSlotrowSize;i++){
		    		if(i%2==0){%>
						<tr class="evenTr" style="height:  20px;text-indent: 4px;" >
						<%}else{%>
						<tr class="oddTr"  style="height:  20px;" style="text-indent: 4px">
					<%}
						
					if(i<parkingSlotList.size()){
						ParkingSlotVO parkingSlotVO=(ParkingSlotVO)parkingSlotList.get(i);									%>
					<td><%=i+1%></td>
					<td><%=parkingSlotVO.getParkingSlotName()%></td>
					<td><%=parkingSlotVO.getLocation()%></td>
					<%}else{%>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>		
					<%}}%>					 
			    </table>
			    </div>
			      <form name="uploadParkingSlotFrm"  action="/indialives/eventhandler" method="post" enctype="multipart/form-data" >
				    <table border="0" width="100%">
				    <tr>
				    	<td width="25%">Upload CSV file</td>
				    	<td width="50%"><input type="file" name="<%=ApplicationConstants.FILE_TYPE_NAME %>" size="50" > </td>
				    	<td><input type="button" name="upload" value="Upload" onclick="uploadParkingSlot()" ></td>
				    </tr>		    
				    </table>
		    
		    		<input type="hidden" name="event">
		   		 </form>
			    
		    </fieldset>
		    
		  </div>
		  
		  
		
	</div>
	<form name="communityAdmin" action="/indialives/eventhandler" method="post">
	<input type="hidden" name="event">
	<input type="hidden" name="deleteBlockIds">	
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

