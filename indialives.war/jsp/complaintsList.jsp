<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.formbean.Complaint"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<%@page import="com.indialives.dataobjects.ComplaintTypeEnumDO"%>
<%@page import="com.indialives.dataobjects.SeverityEnumDO"%>
<%@page import="com.indialives.dataobjects.ComplaintDO"%>
<%@page import="com.indialives.voobjects.ComplaintsVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="complaintsList.jspf"%>
<%@include file="indialives_css.jspf"%>
<%@include file="indialives_tab.jspf"%>
<%@include file="tabber.jspf"%>
</head>


<script type="text/javascript" src="/indialives/js/jquery-latest.js"></script>
<script type="text/javascript" src="/indialives/js/jquery.tablesorter.js"></script>

<body>
<%

List complaintsListForOpen=(List)request.getAttribute(SetAttributeConstants.GET_COMPLIANTS_LIST_FOR_OPEN);

List complaintsListForInProgress=(List)request.getAttribute(SetAttributeConstants.GET_COMPLIANTS_LIST_FOR_IN_PROGRESS);

List complaintsListForClosed=(List)request.getAttribute(SetAttributeConstants.GET_COMPLIANTS_LIST_FOR_CLOSED);

String noRecords=(String)session.getAttribute(SetAttributeConstants.NO_RECORDS);

//int rowSize=Integer.parseInt(noRecords);
//String  gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);

%>

<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%" valign="top">
		<%@include file="contentPage.jsp"%>
	</td>	
	
	 <td  valign="top"  height="100%">
	 <div class="tabber"  id="divHome" style="margin-top: 12px" >
			<div class="tabbertab" title="Open" style="height: 428px">
		  <fieldset style="height: 99%;"  >
		  <legend class="indiaLivesFonts" style="font-size:16px ">Complaints List</legend>
				
		  	<table border="0" width="100%">
				<tr>
					<td colspan="8" align="right" ><input  type="button" name="create" value="Create"  onclick="createComplaint()"></td>
				</tr>
			</table>	
		 	<table class="tableBgColor"  width="100%" cellpadding="1" cellspacing="1"   height="10%" id="complaintsTable">
			<thead class="indiaLivesFonts" style="font-size: 14px"> 
				<tr id="complaintListOdd" class="trColor">
					<th>S.No</th>
					<th>Pro Type</th>			
					<th>Raised By</th>
					<th>Raised Time</th>
					<th>Comp Type</th>				
					<th>Severity</th>
					</tr>
			</thead>
				<tbody class="indiaLivesFonts" style="font-size: 14px">
				
			 	
				
				<%				
					
					
					   int complaintsListForOpenRowSize=complaintsListForOpen.size();
				    	if(complaintsListForOpenRowSize<15){
				    		complaintsListForOpenRowSize=15;
				    	} 
						
					for(int i=0;i<complaintsListForOpenRowSize;i++){
						 if(i%2==0){%>
							<tr class="evenTr" style="cursor: hand;height:  20px;color: black;" style="text-indent: 4px">
							<%}else{%>
							<tr class="oddTr" style="cursor: hand;height:  20px;color: black;" style="text-indent: 4px">
					<%}	
					if(i<complaintsListForOpen.size()){
						ComplaintsVO complaintsVO=(ComplaintsVO)complaintsListForOpen.get(i);
						
						Date date=complaintsVO.getRaisedTime();	
						Date availStart=complaintsVO.getAvailableStartTime();
						Date availEnd=complaintsVO.getAvailableEndTime();
						SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
						String raisedTime=dateFormat.format(date);
						String availStartTime=dateFormat.format(availStart);
						String availEndTime=dateFormat.format(availEnd); %>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=i+1%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>');"><%=complaintsVO.getPropertyName()%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getRaisedByName()%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=raisedTime%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getComplaintTypeName()%></td>				
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getSeverityName() %></td>
						<%}else{ %>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<%}} %>
					
				
				
								
							
			
			</tbody>
			
			
			
			</table>
			</fieldset>
		</div>
	
		<div class="tabbertab" title="In Progress" style="height: 428px">
		  <fieldset style="height: 99%;"  >
		  <legend class="indiaLivesFonts" style="font-size:16px ">Complaints List</legend>
				
		  	<table border="0" width="100%">
				<tr>
					<td colspan="8" align="right" ><input  type="button" name="create" value="Create"  onclick="createComplaint()"></td>
				</tr>
			</table>	
		 	<table class="tableBgColor"  width="100%" cellpadding="1" cellspacing="1"   height="10%" id="complaintsTable">
			<thead class="indiaLivesFonts" style="font-size: 14px"> 
				<tr id="complaintListOdd" class="trColor">
					<th>S.No</th>
					<th>Pro Type</th>			
					<th>Raised By</th>
					<th>Raised Time</th>
					<th>Comp Type</th>				
					<th>Severity</th>
					</tr>
			</thead>
				<tbody class="indiaLivesFonts" style="font-size: 14px">
				
			 	
				
				<%				
					
					
					   int complaintsListForInProgressRowSize=complaintsListForOpen.size();
				    	if(complaintsListForInProgressRowSize<15){
				    		complaintsListForInProgressRowSize=15;
				    	} 
						
					for(int i=0;i<complaintsListForInProgressRowSize;i++){
						 if(i%2==0){%>
							<tr class="evenTr" style="cursor: hand;height:  20px;color: black;" style="text-indent: 4px">
							<%}else{%>
							<tr class="oddTr" style="cursor: hand;height:  20px;color: black;" style="text-indent: 4px">
					<%}	
					if(i<complaintsListForInProgress.size()){
						ComplaintsVO complaintsVO=(ComplaintsVO)complaintsListForInProgress.get(i);
						
						Date date=complaintsVO.getRaisedTime();	
						Date availStart=complaintsVO.getAvailableStartTime();
						Date availEnd=complaintsVO.getAvailableEndTime();
						SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
						String raisedTime=dateFormat.format(date);
						String availStartTime=dateFormat.format(availStart);
						String availEndTime=dateFormat.format(availEnd); %>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=i+1%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>');"><%=complaintsVO.getPropertyName()%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getRaisedByName()%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=raisedTime%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getComplaintTypeName()%></td>				
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getSeverityName() %></td>
						<%}else{ %>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<%}} %>
					
				
				
								
							
			
			</tbody>
			
			
			
			</table>
			</fieldset>
		</div>
	
		<div class="tabbertab" title="Closed" style="height: 428px">
		  <fieldset style="height: 99%;"  >
		  <legend class="indiaLivesFonts" style="font-size:16px ">Complaints List</legend>
				
		  	<table border="0" width="100%">
				<tr>
					<td colspan="8" align="right" ><input  type="button" name="create" value="Create"  onclick="createComplaint()"></td>
				</tr>
			</table>	
		 	<table class="tableBgColor"  width="100%" cellpadding="1" cellspacing="1"   height="10%" id="complaintsTable">
			<thead class="indiaLivesFonts" style="font-size: 14px"> 
				<tr id="complaintListOdd" class="trColor">
					<th>S.No</th>
					<th>Pro Type</th>			
					<th>Raised By</th>
					<th>Raised Time</th>
					<th>Comp Type</th>				
					<th>Severity</th>
					</tr>
			</thead>
				<tbody class="indiaLivesFonts" style="font-size: 14px">
				
			 	
				
				<%				
					
					
					   int complaintsListForClosedRowSize=complaintsListForOpen.size();
				    	if(complaintsListForClosedRowSize<15){
				    		complaintsListForClosedRowSize=15;
				    	} 
						
					for(int i=0;i<complaintsListForClosedRowSize;i++){
						 if(i%2==0){%>
							<tr class="evenTr" style="cursor: hand;height:  20px;color: black;" style="text-indent: 4px">
							<%}else{%>
							<tr class="oddTr" style="cursor: hand;height:  20px;color: black;" style="text-indent: 4px">
					<%}	
					if(i<complaintsListForClosed.size()){
						ComplaintsVO complaintsVO=(ComplaintsVO)complaintsListForClosed.get(i);
						
						Date date=complaintsVO.getRaisedTime();	
						Date availStart=complaintsVO.getAvailableStartTime();
						Date availEnd=complaintsVO.getAvailableEndTime();
						SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
						String raisedTime=dateFormat.format(date);
						String availStartTime=dateFormat.format(availStart);
						String availEndTime=dateFormat.format(availEnd); %>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=i+1%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>');"><%=complaintsVO.getPropertyName()%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getRaisedByName()%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=raisedTime%></td>
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getComplaintTypeName()%></td>				
					<td  onclick="submitComplaintOpenRow('<%=complaintsVO.getId()%>'); "><%=complaintsVO.getSeverityName() %></td>
						<%}else{ %>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<%}} %>
					
				
				
								
							
			
			</tbody>
			
			
			
			</table>
			<form name="complaintListFrm" action="/indialives/eventhandler" method="get">
				<input type="hidden" name="event" >
				<input type="hidden" name="complaintId"/>
			</form>		
		</fieldset>
		</div>
	</div>
		
	
	</td>
	
	<td valign="top" width="15%">
		<%@include file="advBoard.jsp" %>
	</td>	
	
	
	</tr>
	
</table>


<%@include file="footer.jsp" %>
</body>
</html>