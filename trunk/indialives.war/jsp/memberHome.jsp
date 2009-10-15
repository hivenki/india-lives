<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
</head>
<%@include file="index.jspf"%>
<body>
<%
	List communityList=(List)request.getAttribute(SetAttributeConstants.COMMUNITY_LIST);




%>
<form name="memberHome" action="/indialives/eventhandler" method="post">
<table border="0" width="100%">
	<tr>
		<td width="25%" style="font-family: calibri;font-size: x-large;">IndiaLives</td>
		<td>
		<div style="border-style: ridge;border-width:2px">
			<table width="90%">
			 <tr style="font-family: calibri;font-size:16px;">
				<td><a href="home" style="text-decoration: none ">Home</a></td>
				<td><a href="profile" style="text-decoration: none ">Profile</a></td>
				
				<td align="right"><%=SessionFactory.getSession(request).getUser().getFirstName()+" "+ SessionFactory.getSession(request).getUser().getLastName()%></td>				
				<td align="right"><a href="signOut" style="text-decoration: none ">Sign Out</a></td>
			</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td colspan="2"></br></td>
	</tr>
	<tr>
	 <td colspan="2">	
		<table border="0" width="50%" style="margin-left: 240px">
		<tr style="font-family: calibri;font-size:18px;">
			<td>
				You are part of the following gated communities,				
			</td>
		</tr>
		
				<%
				if(communityList!=null){
					for(int i=0;i<communityList.size();i++){
				%>
				<tr style="font-family: calibri;font-size:16px;">
				<%		
					CommunityDO communityDO=(CommunityDO)communityList.get(i);
				%>
				<td><input type="radio" name="gatedCommunityId" value="<%=communityDO.getId()%>"><%=communityDO.getName()%></td>
				</tr>
				<% }}%>	
			
		
		<tr style="font-family: calibri;font-size:16px;">
			<td>
				<input type="button" name="getIn" value="Get In" onclick="submitCommunity()">
			</td>
		</tr>
	</table>
	</td>	
	</tr>
	
</table>



<table border="0" width="100%" align="right" style="margin-top: 350px">
	<tr align="right"  style="font-family: calibri;font-size:14px;">
		<td width="70%">
			AboutIL |	
		</td>
		<td>
			Terms |
		</td>
		<td>
			Press |	
		</td>
		<td>
			Partners |
		</td>
		<td>
			Careers |
		</td>
		<td>
			Customers
		</td>
	
	</tr>
	<tr  style="font-family: calibri;font-size:14px;">
		<td align="right" colspan="6">
			copyright 2009 IndiaLives all rights reserved.
		</td>
	</tr>

</table>
	<input type="hidden" name="event" value="communityHome">
</form>
</body>
</html>