<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%><html>
<head>
<title>Welcome to IndiaLives</title>
</head>
<%@include file="memberHome.jspf"%>
<%@include file="indialives_css.jspf"%>
<body>
<%
	List communityList=(List)request.getAttribute(SetAttributeConstants.COMMUNITY_LIST);




%>
<%@include file="header.jsp" %>
<form name="memberHome" action="/indialives/eventhandler" method="post">
<table border="0" width="100%" height="76%">
	<tr>
	 <td colspan="2" valign="top">	
		<table border="0" width="50%" style="margin-left: 240px" >
		<tr class="indiaLivesFonts" style="font-size:18px;">
			<td>
				You are part of the following gated communities,				
			</td>
		</tr>
		
				<%
				if(communityList!=null){
					for(int i=0;i<communityList.size();i++){
				%>
				<tr class="indiaLivesFonts" style="font-size:16px;">
				<%		
					CommunityDO communityDO=(CommunityDO)communityList.get(i);
				%>
				<td><input type="radio" name="gatedCommunityId" value="<%=communityDO.getId()%>"><%=communityDO.getName()%></td>
				</tr>
				<% }}%>	
			
		
		<tr class="indiaLivesFonts" style="font-size:16px;">
			<td>
				<input type="button" name="getIn" value="Get In" onclick="submitCommunity()">
			</td>
		</tr>
	</table>
	</td>	
	</tr>
	
</table>

<%@include file="footer.jsp" %>
<input type="hidden" name="event" value="communityHome">
</form>
</body>
</html>