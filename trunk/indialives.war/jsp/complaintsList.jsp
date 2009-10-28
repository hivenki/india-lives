<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.formbean.Compliants"%>
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
</head>


<script type="text/javascript" src="/indialives/js/jquery-latest.js"></script>
<script type="text/javascript" src="/indialives/js/jquery.tablesorter.js"></script>
<script type="text/javascript">
//$(document).ready(function() 
	 //   { 
	//  $('table.complaint tbody  tr:odd').css("background-color", "#BCCDE9");
	//    $('table.complaint  tbody  tr:even').css("background-color", "#E8EEFA");
	//       $("#complaintsTable").tablesorter( {sortList: [[0,0], [1,0]]} );
	      //  $('table.complaint thead tr:odd').addClass('odd');
	      //  $('table.complaint tbody tr:even').addClass('even') ;

	      
//	    }
//	); 

</script> 
<body>
<%

List complaintsList=(List)request.getAttribute(SetAttributeConstants.GET_COMPLAINTS_LIST);

String noRecords=(String)session.getAttribute(SetAttributeConstants.NO_RECORDS);

int rowSize=Integer.parseInt(noRecords);
//String  gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);

%>

<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%" valign="top" height="100%" >
		<%@include file="contentPage.jsp"%>
	</td>	
	
	 <td  valign="top"  height="100%">
	  <fieldset style="height: 98%;"  >
	  <legend class="indiaLivesFonts" style="font-size:16px ">Complaints List</legend>
			
	  	<table border="0" width="100%">
			<tr>
				<td colspan="8" align="right" ><input  type="button" name="create" value="Create"  onclick="createComplaint()"></td>
			</tr>
		</table>	
	 	<table class="complaint" border="1" width="100%" cellpadding="0" cellspacing="0"   height="10%" id="complaintsTable">
		<thead class="indiaLivesFonts" style="font-size: 14px"> 
			<tr id="complaintListOdd">
				<th>S.No</th>
				<th>Pro Type</th>			
				<th>Raised By</th>
				<th>Raised Time</th>
				<th>Comp Type</th>				
				<th>Severity</th>
				</tr>
		</thead>
			<tbody class="indiaLivesFonts" style="font-size: 14px">
			
		 	
			
			<%if(complaintsList!=null){				
				int size=0;
				   if(complaintsList.size()< rowSize){
					   size=rowSize;
				   }
				   else{
						size=complaintsList.size();   
				   }
				
				for(int i=0;i<size;i++){
					 if(i%2==0){%>
						<tr class="T1" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="T2" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}%>	
				<%if(i<complaintsList.size()){
					ComplaintsVO complaintsVO=(ComplaintsVO)complaintsList.get(i);
					
					Date date=complaintsVO.getRaisedTime();	
					Date availStart=complaintsVO.getAvailableStartTime();
					Date availEnd=complaintsVO.getAvailableEndTime();
					SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
					String raisedTime=dateFormat.format(date);
					String availStartTime=dateFormat.format(availStart);
					String availEndTime=dateFormat.format(availEnd); %>
				<td><%=i+1%></td>
				<td><%=complaintsVO.getPropertyName()%></td>
				<td><%=complaintsVO.getRaisedByName()%></td>
				<td nowrap="nowrap"><%=raisedTime%></td>
				<td><%=complaintsVO.getComplaintTypeName()%></td>				
				<td><%=complaintsVO.getSeverityName() %></td>
					<%}else{ %>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<%} %>
				</tr>
				<%}} %>
			
			
							
						
		
		</tbody>
		
		
		
		</table>
		<form name="complaintListFrm" action="/indialives/eventhandler" method="post">
			<input type="hidden" name="event" value="showComplaints" >
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