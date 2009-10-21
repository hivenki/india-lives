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
</head>
<%@include file="complaintsList.jspf"%>
<%@include file="indialives_css.jspf"%>
<body>
<%

List complaintsList=(List)request.getAttribute(SetAttributeConstants.GET_COMPLAINTS_LIST);


//String  gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);

%>

<table border="0" width="100%">
	<tr>
		<td width="13%" style="font-size: large;text-indent: 10px">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	    <div class="contentb">
		IndiaLives
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		
		</td>
		<td>
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	    <div class="contentb">
		<table width="90%">
			 <tr style="font-family: calibri;font-size:16px;">
				<td><a href="eventhandler?event=memberHome" style="text-decoration: none ">Home</a></td>
				<td><a href="#" style="text-decoration: none ">Profile</a></td>
				
				<td align="right"><%=SessionFactory.getSession(request).getUser().getFirstName()+" "+ SessionFactory.getSession(request).getUser().getLastName()%></td>				
				<td align="right"><a href="#" style="text-decoration: none " onclick="submitSignOut()">Sign Out</a></td>
			</tr>
			</table>
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</td>
	</tr>
	<tr>
		<td colspan="2"></br></td>
	</tr>
</table>

<table border="0" width="100%" height="76%">

	<tr>
	<td width="13%">
		<%@include file="contentPage.jsp"%>
	</td>	
	
	 <td  valign="top"  width="65%" height="100%">
	  <fieldset style="height: 98%" >
	  <legend class="indiaLivesFonts" style="font-size:16px ">Complaints List</legend>
		<form name="complaintListFrm" action="/indialives/eventhandler" method="post">	
	  
	 	<table border="1" width="100%" style="margin-top: 15px" height="10%">
		<thead class="indiaLivesFonts" style="font-size: 14px"> 
			<tr>
				<th  align="left">Pro Type</th>			
				<th>Raised By</th>
				<th>Raised Time</th>
				<th>Comp Type</th>
				<th>Description</th>
				<th>Severity</th>
				<th>Ava Start Time</th>
				<th>Ava End Time</th>		
			</tr>
		</thead>
			<tbody class="indiaLivesFonts" style="font-size: 14px">
			
			<%
				if(complaintsList!=null){
					for(int i=0;i<complaintsList.size();i++){
						ComplaintsVO complaintsVO=(ComplaintsVO)complaintsList.get(i);
						
						Date date=complaintsVO.getRaisedTime();	
						Date availStart=complaintsVO.getAvailableStartTime();
						Date availEnd=complaintsVO.getAvailableEndTime();
						SimpleDateFormat dateFormat=new SimpleDateFormat("dd/MM/yy hh:mm:ss");
						String raisedTime=dateFormat.format(date);
						String availStartTime=dateFormat.format(availStart);
						String availEndTime=dateFormat.format(availEnd);
						
			%>	
			<tr>
				<td><%=complaintsVO.getPropertyName()%></td>
				<td><%=complaintsVO.getRaisedByName()%></td>
				<td nowrap="nowrap"><%=raisedTime%></td>
				<td><%=complaintsVO.getComplaintTypeName()%></td>					
				<td><%=complaintsVO.getDescription()%></td>
				<td><%=complaintsVO.getSeverityName() %></td>
				<td nowrap="nowrap"><%=availStartTime%></td>
				<td nowrap="nowrap"><%=availEndTime%></td>
			</tr>
			<%}}%>
			
			
		
		</tbody>
			<tr>
			 	<td colspan="8" ><input  type="button" name="create" value="Create"  onclick="createComplaint()"></td>
			</tr>
		
		</table>
			<input type="hidden" name="event" value="showComplaints" >
		</form>
		
	</fieldset>
	
	</td>
	
	<td valign="top" width="15%" class="indiaLivesFonts">
		 <fieldset style="height: 98%" >
	    	<legend>Adv Board</legend>			
		</fieldset>
	</td>
	
	
	</tr>
	
</table>


<%@include file="footer.jsp" %>
</body>
</html>