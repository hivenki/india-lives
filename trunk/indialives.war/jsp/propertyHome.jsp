<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.CommunityDO"%>
<%@page import="com.easymvc.session.SessionFactory"%>
<%@page import="com.indialives.dataobjects.PropertyTypeEnumDO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
</head>

<body>
<%
	List propertyList=(List)request.getAttribute(SetAttributeConstants.PROPERTY_LIST);




%>
<form name="propertyHome" action="/indialives/eventhandler" method="post">
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
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
<table border="0" width="100%" height="80%">

	<tr>
	
	<td valign="top" width="20%">
		<div style="border-style: ridge;border-width: 2px;height: 100%;font-family: calibri;font-size: 16px">
		<table border="0" width="100%" height="50%">
		
			<tr>
				<td><a href="Properties" style="text-decoration: none;">Properties</a></td>
			</tr>
			<tr>
				<td><a href="Compliants" style="text-decoration: none;">Complaints</a></td>
			</tr>
			<tr>
				<td><a href="Notice" style="text-decoration: none;">Notice Board</a></td>
			</tr>
			<tr>
				<td><a href="Parking" style="text-decoration: none;">Parking</a></td>
			</tr>			
		</table>
		</div>
	</td>	
	 <td valign="top" width="65%">	
	  <div style="border-style: ridge;border-width: 2px;font-family: calibri;font-size: 16px;width=84%;height: 100%" >
		<table border="0" width="100%" style="margin-left: 100px">
		<tr style="font-family: calibri;font-size:18px;">
			<td>
				You are having the following properties,				
			</td>
		</tr>
		
				<%
				if(propertyList!=null){
					for(int i=0;i<propertyList.size();i++){
				%>
				<tr style="font-family: calibri;font-size:16px;">
				<%		
					PropertyTypeEnumDO propeTypeEnumDO=(PropertyTypeEnumDO)propertyList.get(i);
				%>
				<td><%=i+1%>.<%=propeTypeEnumDO.getName()%></td>
				</tr>
				<% }}%>		
		</table>
	</div>
	</td>
	<td valign="top" width="20%">
		<div style="border-style: ridge;border-width: 2px;height: 100%;width: 100%">
			<table border="0">
				<tr>
					<td>Adv Borad</td>
				</tr>
			</table>
		
		</div>
	
	</td>
	</tr>
</table>
	




<table border="0" width="100%" align="right">
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
</form>
</body>
</html>