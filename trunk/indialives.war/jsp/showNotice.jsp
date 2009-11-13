<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.dataobjects.NoticeBoardEnumDO"%>
<%@page import="com.indialives.voobjects.UsersVO"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.Notice"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" src="/indialives/js/showNotice.js"></script>
</head>
<body>
<%
	List noticeTypeList=(List)request.getAttribute(SetAttributeConstants.NOTICE__TYPE_LIST);
	
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
	    	<table border="0" width="65%" align="center" style="margin-left: 50px;margin-top: 120px">
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
				<td><input type="text" size="35" name="postedDate">(DD-MM-YYYY)</td>
			</tr>
			<tr>
				<td>Subject </td>
				<td><input type="text" name="subject" size="35"></td>
			</tr>
			<tr>
				<td valign="top">Description </td>
				<td>
				<textarea class="indiaLivesFonts"  rows="8" cols="27" name="description"></textarea>
				</td>
			</tr>		
			<tr>
			<td colspan="2" >
				<input style="margin-left: 285px" type="button" name="add" value="Add" onclick="addNotice()">
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