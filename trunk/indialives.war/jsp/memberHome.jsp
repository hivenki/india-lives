<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.voobjects.CommunityVO"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="memberHome.jspf"%>
<%@include file="indialives_css.jspf"%>
</head>
<body>
<%
	List communityList=(List)request.getAttribute(SetAttributeConstants.COMMUNITY_LIST);
%>
<%@include file="header.jsp" %>

<table border="0" width="100%" height="84%" style="margin-top: 5px" >
	<tr>
	 <td colspan="2" >	
	 
	 <fieldset style="height:50 %" >
	  <legend class="indiaLivesFonts" >Communities</legend>
	  	<form name="memberHome" action="/indialives/eventhandler" method="post">
		<table border="0" width="65%" style="margin-left: 170px;margin-top: 80px" >
		<tr class="indiaLivesFonts" style="font-size:16px;">
					
		
				<%
				if(communityList!=null && communityList.size()>0){ %>
				<td>
						You are part of the following gated communities,				
					</td>
				</tr>
				
				<%	for(int i=0;i<communityList.size();i++){
				%>
				
				<tr class="indiaLivesFonts">
				<%		
					CommunityVO communityVO=(CommunityVO)communityList.get(i);
				%>
				<td class="indiaLivesFonts" ><input type="radio"  name="gatedCommunityId" value="<%=communityVO.getId()%>" ><%=communityVO.getName()%></td>
				</tr>
					<% }%>
			
		
					<tr class="indiaLivesFonts">
						<td> 
							<input style="margin-left: 310px;font-size:14px" type="button" name="getIn" value="Get In" onclick="submitCommunity()">
						</td>
					</tr>
			<%}else {%>
				<tr class="indiaLivesFonts" style="font-size: 16px">
					<td>You don't have communities.</td>
				</tr>
			
			<%}%>	
	</table>
	<input type="hidden" name="event" value="communityHome">
	</form>
	</fieldset>
	<fieldset style="height: 49%;margin-top: 3px"  >	   		
			<table align="center" class="indiaLivesFonts" border="0" width="60%" style="margin-left: 20px;margin-top: 80px;"  >
				<tr>
					<td align="center">Search for a Gated Community </td>
					<td width="20%"><input type="text" name="searchCommnity" > </td>
					<td width="20%" style="font-size:14px"><input type="button" name="search" value="Go"></td>
				</tr>
			</table>	
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