<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.voobjects.ComplaintsVO"%>
<%@page import="com.indialives.util.DateUtil"%>
<%@page import="com.indialives.dataobjects.ComplaintStatusEnumDO"%>
<%@page import="com.indialives.formbean.Complaint"%>
<%@page import="com.easymvc.Constants"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@include file="indialives_css.jspf"%>
<%@ include file="header.jspf" %>
<script type="text/javascript" language="javascript" src="/indialives/js/complaintDetails.js"></script>
</head>

<body>
<%
	ComplaintsVO complaintsVO=(ComplaintsVO)request.getAttribute(SetAttributeConstants.COMPLAINT_DETAILS);
	List complaintStatusList=(List)request.getAttribute(SetAttributeConstants.COMPLAINT_STATUS_LIST);
%>
<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%"  style="margin-top: 5px">
	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp"%>
	</td>	
	<td  valign="top"  height="100%">		
	 <fieldset style="height: 99%;" >
	  <legend class="indiaLivesFonts" style="font-size:16px ">Complaint Details</legend>
	  <form name="showComplaintFrm" action="/indialives/eventhandler" method="post">
		<table class="indiaLivesFonts" border="0" width="55%" align="center" style="margin-left: 50px;margin-top: 100px;font-size: 16px">
			<tr>
				<td>Property Type</td>			
				<td><%=complaintsVO.getPropertyTypeName()%></td>		
			</tr>
			<tr>
				<td>Property</td>			
				<td><%=complaintsVO.getPropertyName()%></td>		
			</tr>
				
			<tr>
			<td>Complaint Type</td>
			<td><%=complaintsVO.getComplaintTypeName()%></td>		
			</tr>
			<tr>
			<td>Severity</td>
			<td><%=complaintsVO.getSeverityName()%></td>		
			</tr>
			<tr>
			<td>Available Start Time</td>
			<td><%=DateUtil.getStringFromDate(complaintsVO.getAvailableStartTime())%></td>		
			</tr>
			<tr>
			<td>Available End Time</td>
			<td><%=DateUtil.getStringFromDate(complaintsVO.getAvailableEndTime())%></td>		
			</tr>
			<tr>
			<td>Status</td>
			<td>
			<select name="statusId" style="width: 100px">
					<%
						if(complaintStatusList!=null){
										for(int i=0;i<complaintStatusList.size();i++){
											ComplaintStatusEnumDO complaintStatusEnumDO=(ComplaintStatusEnumDO)complaintStatusList.get(i);
					%>
								<option value="<%=complaintStatusEnumDO.getId()%>" 
									<%if(complaintsVO.getStatusId().equals(complaintStatusEnumDO.getId())){%>
										selected="selected"
									<%}%>
								>
								<%=complaintStatusEnumDO.getName()%>
								</option>
					<%
						}
									}
					%>
				</select>
			</td>	
			</tr>
			<tr>
				<td colspan="2" ><input  style="margin-left: 205px" type="button" value="Change" onclick="changeStatus()"></td>
			</tr>
		
		
	</table>
	<input type="hidden" name="event" value="changeComplaintStatus">
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