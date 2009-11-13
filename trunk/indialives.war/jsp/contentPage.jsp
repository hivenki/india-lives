<%@page import="com.indialives.voobjects.RolePrivilegesVO"%>
<%@page import="java.util.List"%>
<%@page import="com.easymvc.session.Session"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<html>
<head>
<title>Welcome to IndiaLives</title>
</head>
<%
Session easyMVCSession=SessionFactory.getSession(request);
List rolePrivilegesList=(List) easyMVCSession.get(SetAttributeConstants.ROLE_PRIVILEGES_LIST);
String contentLink=(String)session.getAttribute(SetAttributeConstants.CURRENT_CONTENT_LINK);
%>
<form name="contentFrm" action="/indialives/eventhandler" method="post">
<table border="0" width="100%" height="100%">
	<tr class="indiaLivesFonts">
	<td width="25%">
		<fieldset style="height: 100%;">
		<legend>Contents</legend>
		<table border="0" width="100%" height="90%">
			
			<%if(rolePrivilegesList!=null){				
				for(int i=0;i<rolePrivilegesList.size();i++){
				 RolePrivilegesVO privilegesVO=(RolePrivilegesVO)rolePrivilegesList.get(i);
			%>
				<tr class="indiaLivesFonts">			
				<td><a class="ContenthLink" name="<%=privilegesVO.getPrivilegeName()%>" href="<%=privilegesVO.getUrl()%>" ><%=privilegesVO.getPrivilegeName()%></a></td>
				</tr>					
		<%}}%>		
		</table>
		
		</fieldset>		
	</td>
	</tr>

</table>	
</form>
<script type="text/javascript">
	document.getElementById('<%=contentLink%>').style.fontWeight="bold";
</script>
</html>