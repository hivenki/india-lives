<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.indialives.voobjects.NoticeVO"%>
<%@page import="com.indialives.util.DateUtil"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
</head>


<script type="text/javascript" src="/indialives/js/noticeList.js"></script>

<body>
<%
List noticeList=(List)request.getAttribute(SetAttributeConstants.NOTICE_LIST);
%>
<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>
	<td width="15%" valign="top" height="100%" >
		<%@include file="contentPage.jsp"%>
	</td>	
	 <td  valign="top"  height="100%">
	  <fieldset style="height: 98%;"  >
		  <legend class="indiaLivesFonts" style="font-size:16px ">Notice List</legend>
				
		  	<table border="0" width="100%">
				<tr>
					<td colspan="8" align="right" ><input  type="button" name="create" value="Create"  onclick="createNotice()"></td>
				</tr>
			</table>	
		 	<table class="tableBgColor"  width="100%" cellpadding="1" cellspacing="1"   height="10%" id="complaintsTable">
			<thead class="indiaLivesFonts" style="font-size: 14px"> 
				<tr id="complaintListOdd" class="trColor">
					<th>S.No</th>
					<th>Notice Type</th>			
					<th>Posted Date</th>
					<th>Subject</th>
					<th>Posted By</th>					
					</tr>
			</thead>
				<tbody class="indiaLivesFonts" style="font-size: 14px">
				<%				
					   int rowSize=noticeList.size();
				    	if(rowSize<15){
				    		rowSize=15;
				    	} 
						
					for(int i=0;i<rowSize;i++){
						 if(i%2==0){%>
							<tr class="evenTr" style="cursor: hand;height:  20px;color: black;" style="text-indent: 4px">
							<%}else{%>
							<tr class="oddTr" style="cursor: hand;height:  20px;color: black;" style="text-indent: 4px">
					<%}	
					if(i<noticeList.size()){
						NoticeVO noticeVO=(NoticeVO)noticeList.get(i);
						
						 %>
					<td><%=i+1%></td>
					<td><%=noticeVO.getNoticeTypeName()%></td>
					<td><%=DateUtil.getStringFromDate(noticeVO.getPostedDate())%></td>
					<td><%=noticeVO.getSubject()%></td>
					<td><%=noticeVO.getPostedByName()%></td>				
					
						<%}else{ %>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<%}} %>
			</tbody>
			</table>
			</fieldset>
	</td>
	
	<td valign="top" width="15%" class="indiaLivesFonts">
		 <fieldset style="height: 98%;" >
	    	<legend>Adv Board</legend>			
		</fieldset>
	</td>
	</tr>
	
</table>
<form method="post" name="noticeListFrm" action="/indialives/eventhandler" >
	<input type="hidden" name="event">
</form>
<%@include file="footer.jsp" %>
</body>
</html>