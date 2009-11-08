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
	List userList=(List)request.getAttribute(SetAttributeConstants.GET_USER_LIST);
	List propertTypeList=(List)request.getAttribute(SetAttributeConstants.PROPERTY_ENUM_LIST);
	List propertyList=(List)session.getAttribute(SetAttributeConstants.PROPERTY_LIST_BASED_ON_TYPE);
	List userForPropertyList=(List)session.getAttribute(SetAttributeConstants.USER_LIST_FOR_PROPERTY);
	
	String uploadParkingSlotErrorMessage=(String)session.getAttribute(SetAttributeConstants.PARKING_ERROR_LIST);
	session.setAttribute(SetAttributeConstants.PARKING_ERROR_LIST,null);
	
	String delteBlockErrormessage=(String)session.getAttribute(SetAttributeConstants.DELETE_BLOCKS_ERROR_MSG);
	session.setAttribute(SetAttributeConstants.DELETE_BLOCKS_ERROR_MSG,null);
	
	String propertyTypeId=(String)session.getAttribute(SetAttributeConstants.PROPERTY_TYPE_ID);
	
	int propertyType=1;
	if(propertyTypeId==null){
		propertyType=1;
	}
	else{
		propertyType=Integer.parseInt(propertyTypeId);
	}
	
	String uploadPropertOwnerErrorMessage=(String)session.getAttribute(SetAttributeConstants.PROPERTY_OWNER_ERROR_LIST);
	session.setAttribute(SetAttributeConstants.PROPERTY_OWNER_ERROR_LIST,null);
	
//  String propertyOwnerErrMsg=(String)session.getAttribute(SetAttributeConstants.PROPERTY_OWNER_ERROR_LIST);
%>



<%@page import="com.indialives.dataobjects.UserDO"%>
<%@page import="com.indialives.voobjects.UsersVO"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<%@page import="com.indialives.formbean.PropertyOwner"%>
<%@page import="com.easymvc.Constants"%><html>			
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

<script type="text/javascript"><!--
	var uploadParkingSlotErrorMessage='<%=uploadParkingSlotErrorMessage%>';
	if(uploadParkingSlotErrorMessage!='null' && uploadParkingSlotErrorMessage.length > 0 ){
		alert("The following parking names are not available \n"+uploadParkingSlotErrorMessage);
		
	}
	var delteBlockErrormessage='<%=delteBlockErrormessage%>';
	if(delteBlockErrormessage!='null' && delteBlockErrormessage.length >0){
		alert("The following block names are in use \n"+delteBlockErrormessage);
	}
	var uploadPropertOwnerErrorMessage='<%=uploadPropertOwnerErrorMessage%>';
	if(uploadPropertOwnerErrorMessage!='null' && uploadPropertOwnerErrorMessage.length > 0 ){
		alert("The following are not available \n"+uploadPropertOwnerErrorMessage);
		
	}
//	var propertyOwnerErrMsg='';
//	if(propertyOwnerErrMsg!='null' && propertyOwnerErrMsg.length > 0 ){
//		alert("All the fields are not availble");		
	//}
	
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
	
			<div class="tabbertab" title="User List" style="height: 428px">
		    <fieldset  class="indiaLivesFonts" style="height: 100%" >
		    <legend>User List</legend>
		    <table border="0" width="100%">
		    	<tr>
				<td align="right" width="100%"><input type="button"  value="Add" onclick="addUser()"></td>
			</tr>
		    </table>
		   <table class="tableBgColor" width="100%"  cellpadding="1" cellspacing="1" >
		   
			 <tr class="trColor">
			 	<th  nowrap="nowrap">S.No</th>
				<th  nowrap="nowrap">First Name</th>
				<th  nowrap="nowrap">Last Name</th>
				<th  nowrap="nowrap">Email</th>
				<th  nowrap="nowrap">Mobile No</th>
				<th  nowrap="nowrap">Role</th>
			</tr>
			<%
				int userRowSize=userList.size();
		    	if(userRowSize<12){
		    		userRowSize=12;
		    	} 
				
			for(int j=0;j<userRowSize;j++){
					 if(j%2==0){%>
						<tr class="evenTr" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="oddTr" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}	
				if(j<userList.size()){	    
		    	 UsersVO usersVO=(UsersVO)userList.get(j); %>		    	
				<td><%=j+1%></td>
				<td><%=usersVO.getFirstName()%></td>
				<td><%=usersVO.getLastName() %></td>
				<td><%=usersVO.getEmailId()%></td>
				<td><%=usersVO.getMobileNo()%></td>
				<td><%=usersVO.getRoleName()%></td>
		   	  <%}else{%>		    
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>	
				<td>&nbsp;</td>	
				<td>&nbsp;</td>				
				<%}}%>				
		    </table>
		    
		     </fieldset>
		         
		    
		  </div>
	
	
			<div class="tabbertab" title="Blocks" style="height: 428px">
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
			
			<div class="tabbertab" id="flat"  title="Flat Type" style="height: 428px">
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
				
		  <div class="tabbertab" title="Flats" id="flatTab" style="height: 428px">
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
		
		  <div class="tabbertab" title="Villas" id="villaTab" style="height: 428px" >
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
		  
		   <div class="tabbertab" title="Parking" id="villaTab" style="height: 428px" >
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
		  
		  
		   <div class="tabbertab" title="Parking Slot" id="villaTab" style="height: 428px" >
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
		  
		  <div class="tabbertab" title="Property Owners" id="villaTab" style="height: 428px" >
		    <fieldset style="height: 100%" class="indiaLivesFonts" >
		    <legend>Property Owners</legend>
		   
		   <table border="0" width="54%" align="center" style="margin-left: 50px;margin-top: 120px">
		    <tr>
				
				<td>Property Type</td> 			
				<td><select onchange="showProperty()" name="propertyTypeId" style="width: 250px">
					<%if(propertTypeList!=null){
							for(int i=0;i<propertTypeList.size();i++){
								PropertyTypeEnumDO propertyTypeEnumDO=(PropertyTypeEnumDO)propertTypeList.get(i);
								%>
						
							<%if(propertyType==propertyTypeEnumDO.getId().intValue()){ %>
						<option value="<%=propertyTypeEnumDO.getId()%>" selected="selected"><%=propertyTypeEnumDO.getName()%></option>
						<%}else{%>
						<option value="<%=propertyTypeEnumDO.getId()%>" ><%=propertyTypeEnumDO.getName()%></option>
						<%}%>
						<%}}%>	
				</select>	
				</td>	
			</tr>
				<tr>
				<td>Property </td>			
				<td><select name="propertyId" style="width: 250px">
				<option>--Select--</option>
					<%if(propertyList!=null){
							for(int i=0;i<propertyList.size();i++){
								PropertiesVO propertiesVO=(PropertiesVO)propertyList.get(i);
								%>
						
						<option value="<%=propertiesVO.getPropertyId()%>"><%=propertiesVO.getPropertyName()%></option>
															
						<%}}%>	
				</select>	
				</td>	
			</tr>
			
			<tr>
				<td>Owner</td> 			
				<td><select name="ownerId" style="width: 250px" >
				<option>--Select--</option>
					<%if(userForPropertyList!=null){
							for(int i=0;i<userForPropertyList.size();i++){
								UsersVO usersVO=(UsersVO)userForPropertyList.get(i);
								%>
						
						<option value="<%=usersVO.getId()%>"><%=usersVO.getFirstName()%></option>
															
						<%}}%>	
				</select>	
				</td>	
			</tr>
			 <tr>
				<td colspan="2" align="right"><input type="button"  value="Add" onclick="addPropertyOwner()"></td>
			</tr>
					   
			 </table>
			     <form name="uploadPropertyOwnerFrm"  enctype="multipart/form-data" action="/indialives/eventhandler" method="post"  >
		    <table border="0" width="95%">
			    <tr>
			    	<td  align="right" width="30%" >Upload CSV file</td>
			    	<td  align="right"  width="20%" ><input type="file" style="width: 260px" name="<%=ApplicationConstants.FILE_TYPE_NAME%>" size="50" > </td>
			    	<td  align="right"  width="10%" ><input type="button"  value="Upload" onclick="uploadPropertyOwner()" ></td>
			    </tr>		    
		    </table>
		    <input type="hidden" name="event"/>
		    	
		    </form>	
			     
		    </fieldset>
		    
		  </div>
		  
		  
		
	</div>
	
	<form name="communityAdmin" action="/indialives/eventhandler" method="get">
	  <input type="hidden" name="event">
	  <input type="hidden" name="deleteBlockIds">	
	  <input type="hidden" name="propertyTypeIds">	
	   <input type="hidden" name="pTypeId">
	   <input type="hidden" name="pId">
	        <input type="hidden" name="oId">
	</form>		 
	</td>
	<td valign="top" width="15%">
		<%@include file="advBoard.jsp" %>
	</td>	
	</tr>
	
</table>


<%@include file="footer.jsp" %>


</body>



</html>

