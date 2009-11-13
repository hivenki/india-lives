<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.indialives.voobjects.NoticeVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" src="/indialives/js/showEditNotice.js"></script>
</head>
<%
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
	   <legend style="font-size:16px;">Notice Detail</legend>
	   	  	<table border="0" width="100%" >
	    	<tr>
	    	<td colspan="2">&nbsp;</td>
	    	</tr>
			<tr>
				<td style="text-indent: 25px" colspan="2">
					To
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-indent: 75px"><%=noticeVO.getPostedByName()%>,</td>
			</tr>
			<tr>
				<td colspan="2" style="text-indent: 75px"><%=noticeVO.getCommunityName()%>,</td>
			</tr>
			<tr>
				<td colspan="2" style="text-indent: 75px"><%=noticeVO.getCommunityAddress()%>,</td>
			</tr>
			<tr>
				<td colspan="2" style="text-indent: 75px"><%=noticeVO.getCityName()%>-<%=noticeVO.getPincodeNo()%>.</td>
			</tr>
			
			<tr>
	    	<td colspan="2">&nbsp;</td>
	    	</tr>
			<tr>
				<td style="text-indent: 25px" width="10%">Subject : </td>
				<td><%=noticeVO.getSubject()%></td>
			</tr>
			<tr>
	    	<td colspan="2">&nbsp;</td>
	    	</tr>
			<tr>
				<td colspan="2" style="text-indent: 75px"><%=noticeVO.getDescription()%></td>
			</tr>
			<tr>
	    	<td colspan="2">&nbsp;</td>
	    	</tr>
	    	<tr>
	    	<td colspan="2">&nbsp;</td>
	    	</tr>
			<tr>
				<td colspan="2" style="text-indent: 25px">Yours Truly,</td>
			</tr>
			<tr>
				<td colspan="2" style="text-indent: 25px">Community Admin.</td>
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