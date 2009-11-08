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
<%@page import="com.indialives.voobjects.PropertiesVO"%>
<%@page import="com.indialives.dataobjects.FlatDO"%>
<%@page import="com.indialives.dataobjects.VillaDO"%>
<%@page import="com.indialives.voobjects.FlatVO"%>
<%@page import="com.indialives.dataobjects.ParkingSlotDO"%>
<%@page import="com.indialives.voobjects.ParkingSlotVO"%>
<%@page import="com.indialives.dataobjects.FlatTypeEnumDO"%>
<%@page import="com.indialives.dataobjects.BlockDO"%>
<%@page import="com.indialives.formbean.Flats"%>
<%@page import="com.indialives.formbean.Blocks"%>
<%@page import="com.indialives.dataobjects.NoticeBoardEnumDO"%>
<%@page import="com.indialives.voobjects.UsersVO"%>
<%@page import="com.indialives.formbean.Notice"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<%@include file="addBlock.jspf"%>
</head>

<script type="text/javascript" src="/indialives/js/showNotice.js"></script>

<body>
<%
 List noticeTypeList=(List)request.getAttribute(SetAttributeConstants.NOTICE__TYPE_LIST);
List postedByList=(List)request.getAttribute(SetAttributeConstants.GET_USER_LIST);
%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;width: 100%">
	   <legend style="font-size:16px;">Create Notice</legend>
	   	  
	   	  <form name="addNoticeFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="50%" align="center" style="margin-left: 50px;margin-top: 120px">
					
		<tr>
			<td>Notice Type</td>
			<td>
			<select name="noticeTypeId" style="width: 235px" >
			<option>--Select--</option>
			<%if(noticeTypeList!=null){
			for(int i=0;i<noticeTypeList.size();i++){
				NoticeBoardEnumDO noticeBoardEnumDO=(NoticeBoardEnumDO)noticeTypeList.get(i);
			%>	
			<option value="<%=noticeBoardEnumDO.getId()%>"><%=noticeBoardEnumDO.getName()%></option>
			<%}}%>
		 </select>		 
		</td>
		</tr>
		<tr>
			<td>Posted Date</td>
			<td><input type="text" size="21" name="postedDate">(DD-MM-YYYY)</td>
		</tr>
		<tr>
			<td>Subject </td>
			<td><input type="text" name="subject" size="35"></td>
		</tr>
		<tr>
			<td>Description </td>
			<td><input type="text" name="description" size="35"></td>
		</tr>		
		<tr>
			<td>Posted By</td>
			<td>
			<select name="postedById" style="width: 235px" >
			<option>--Select--</option>
			<%if(postedByList!=null){
			for(int i=0;i<postedByList.size();i++){
				UsersVO usersVO=(UsersVO)postedByList.get(i);
			%>	
			<option value="<%=usersVO.getId()%>"><%=usersVO.getFirstName()%></option>
			<%}}%>
		 </select>		 
		</td>
		</tr>
		<tr>
		<td colspan="2"  align="right" >
			<input type="button" name="add" value="Add" onclick="addNotice()">
		</td>		
		</tr>
		</table>
		<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="<%=Notice.class.getName()%>">
		<input type="hidden" name="event" value="addNotice">
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