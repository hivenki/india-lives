<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.indialives.voobjects.PropertiesVO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
</head>
<%@include file="propertyHome.jspf"%>
<%@include file="indialives_css.jspf"%>

<body>
<%
	HashMap propertyMap=(HashMap)request.getAttribute(SetAttributeConstants.PROPERTY_LIST);
	List propertyEnumList=(List) request.getAttribute(SetAttributeConstants.PROPERTY_ENUM_LIST);

//	String  gatedCommunityId=(String)session.getAttribute(SetAttributeConstants.COMMUNITY_ID);


%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="76%">

	<tr>	
	<td width="20%">
		<%@include file="contentPage.jsp"%>
	</td>	
	 <td  valign="top"  width="65%" height="100%">	
	   <fieldset style="height: 98%" >
	  <legend class="indiaLivesFonts" style="font-size:16px ">Properties</legend>
	 	<form name="propertyHome" action="/indialives/eventhandler" method="post">
	 
	
		<table border="0" width="90%" height="80%" style="margin-left: 50px">
		<tr class="indiaLivesFonts" style="font-size:18px;">
			<td>
				Properties List,				
			</td>
		</tr>
			<%				
				for(int i=0;i<propertyEnumList.size();i++){				
				
					 PropertyTypeEnumDO propertyTypeEnumDO=(PropertyTypeEnumDO)propertyEnumList.get(i);
					 
					List propertyList=(List)propertyMap.get(propertyTypeEnumDO.getId());;	
						
				%>
				<tr class="indiaLivesFonts">
				<td>
				<fieldset style="width: 95%;height: 20%">
					<legend><%=propertyTypeEnumDO.getName()%></legend>
						<table>						
								<%
								if(propertyList!=null){
									for(int j=0;j<propertyList.size();j++){
										PropertiesVO propertiesVO=(PropertiesVO)propertyList.get(j);
										String propertyName=propertiesVO.getPropertyName();
								%>
								<% %>
								<tr>
								<td><%=j+1%>.</td>
								<td><a href="#" class="propertyLink" onclick="viewProfile('<%=propertiesVO.getPropertyId()%>','<%=propertiesVO.getPropertyTypeId()%>')"><%=propertyName%></a></td>
								
								</tr>
							<%}}else{ %>
								<tr>
								 <td>
									There is no property.
								</td>
								</tr>
							<%}%>
							</table>	
				</fieldset>
				</td>
				</tr>				
		<%}%>
		</table>
	
	<input type="hidden" name="event" value="propertyProfile">
	<input type="hidden" name="propertyId">
	<input type="hidden" name="propertyTypeId" >
	</form>
	</fieldset>
	</td>
	<td valign="top" width="20%" class="indiaLivesFonts">
		 <fieldset style="height: 98%" >
	    	<legend>Adv Board</legend>			
		</fieldset>
	</td>
	</tr>
</table>
<%@include file="footer.jsp" %>

</body>
</html>