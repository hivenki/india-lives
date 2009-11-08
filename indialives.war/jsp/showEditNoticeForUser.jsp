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
<%@page import="com.indialives.formbean.Notice"%>
<%@page import="com.indialives.voobjects.NoticeVO"%>
<%@page import="com.indialives.util.DateUtil"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
</head>

<script type="text/javascript" src="/indialives/js/showEditNotice.js"></script>
<%
 List noticeTypeList=(List)request.getAttribute(SetAttributeConstants.NOTICE__TYPE_LIST);
List postedByList=(List)request.getAttribute(SetAttributeConstants.GET_USER_LIST);

NoticeVO noticeVO=(NoticeVO)request.getAttribute(SetAttributeConstants.NOTICE__OBJ);
String postDateString="";
SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
postDateString = dateFormat.format(noticeVO.getPostedDate());



%>
<body>

<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;width: 100%">
	   <legend style="font-size:16px;">Create Notice</legend>
	   	  
	   	  <form name="updateNoticeFrmForUser" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="65%" align="center" style="margin-left: 50px;margin-top: 120px">
					
		<tr>
			<td>Notice Type</td>
			<td>&nbsp;</td>
			<td><%=noticeVO.getNoticeTypeName()%></td>
	
		</tr>
		<tr>
			<td>Posted Date</td>
			<td>&nbsp;</td>
			<td><%=postDateString%></td>
		</tr>
		<tr>
			<td>Subject </td>
			<td>&nbsp;</td>
			<td><%=noticeVO.getSubject()%></td>
		</tr>
		<tr>
			<td>Description </td>
			<td>&nbsp;</td>
			<td><%=noticeVO.getDescription()%></td>
		</tr>		
		<tr>
			<td>Posted By</td>
			<td>&nbsp;</td>
			<td><%=noticeVO.getPostedByName()%></td>
		</tr>
		</table>
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