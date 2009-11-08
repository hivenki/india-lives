 
<%@page import="com.indialives.voobjects.RolePrivilegesVO"%>
<%@page import="java.util.List"%>
<%@page import="com.easymvc.session.Session"%>
<%@page import="com.easymvc.session.SessionFactory"%><html>
<head>
<title>Welcome to IndiaLives</title>
</head>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@ include file="contentPage.jspf" %>
<body>
<%
Session easyMVCSession=SessionFactory.getSession(request);
List rolePrivilegesList=(List) easyMVCSession.get(SetAttributeConstants.ROLE_PRIVILEGES_LIST);

%>
<form name="contentFrm" action="/indialives/eventhandler" method="post">
<table border="0" width="100%" height="100%">
	<tr class="indiaLivesFonts">
	<td width="25%">
		<fieldset style="height: 100%;">
		<legend>Contents</legend>
		<table border="0" width="100%" height="50%">
			
			<%if(rolePrivilegesList!=null){				
				for(int i=0;i<rolePrivilegesList.size();i++){
				 RolePrivilegesVO privilegesVO=(RolePrivilegesVO)rolePrivilegesList.get(i);
			%>
				<tr class="indiaLivesFonts">			
				<td><a class="ContenthLink" href="<%=privilegesVO.getUrl()%>" ><%=privilegesVO.getPrivilegeName()%></a></td>
				<input type="hidden" name="privilegeId" value="<%=privilegesVO.getId()%>" />
				</tr>					
			
		<%}}%>		
		</table>
		
		</fieldset>		
	</td>
	</tr>

</table>
	<input type="hidden" name="event">
	
</form>
</body>

</html>