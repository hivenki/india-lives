<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.indialives.voobjects.NoticeVO"%>
<%@page import="com.indialives.util.DateUtil"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" src="/indialives/js/noticeList.js"></script>
</head>
<%
List noticeList=(List)request.getAttribute(SetAttributeConstants.NOTICE_LIST);
Integer roleId=(Integer)request.getAttribute(SetAttributeConstants.ROLE_ID);
Integer privilegeId=(Integer)session.getAttribute("PrivilegeId");
%>
<body>
<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>
	<td width="15%" valign="top" >
		<%@include file="contentPage.jsp"%>
	</td>	
	 <td  valign="top"  height="100%">
	  <fieldset style="height: 99%;"  >
		  <legend class="indiaLivesFonts" style="font-size:16px ">Notice List</legend>
			<%if(roleId.intValue()==1){%>
			
		  	<table border="0" width="100%" >
				<tr>
					<td  align="right" ><input  type="button" name="create" value="Create"  onclick="createNotice()"></td>
					<td align="right" width="5%"><input type="button" name="editButton" value="Edit" onclick="editNotice('<%=noticeList.size()%>')"></td>
					<td align="right" width="10%"><input type="button" name="deleteButton" value="Delete" onclick="deleteNotice('<%=noticeList.size()%>')"></td>
				</tr>
			</table>	
			
			<table class="tableBgColor"  width="100%" cellpadding="1" cellspacing="1"   height="10%" id="complaintsTable">
			<thead class="indiaLivesFonts" style="font-size: 14px"> 
				<tr id="complaintListOdd" class="trColor">
				   	<th nowrap="nowrap"  width="5%"><input type="checkbox" name="selectall" onclick="doSelectAll('<%=noticeList.size()%>')" ></th>
					<th nowrap="nowrap" width="5%">S.No</th>
					<th width="23%" nowrap="nowrap">Notice Type</th>			
					<th width="20%" nowrap="nowrap">Posted Date</th>
					<th nowrap="nowrap">Subject</th>
					<th width="18%" nowrap="nowrap">Posted By</th>					
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
					<td><input type="checkbox"  name="select[<%=i%>]" value="<%=noticeVO.getId()%>" onclick="monitor(this,'<%=noticeList.size()%>')"></td>	 
					<td onclick="submitEditRow('<%=noticeVO.getId()%>')"><%=i+1%></td>
					<td onclick="submitEditRow('<%=noticeVO.getId()%>')"><%=noticeVO.getNoticeTypeName()%></td>
					<td onclick="submitEditRow('<%=noticeVO.getId()%>')"><%=DateUtil.getStringFromDate(noticeVO.getPostedDate())%></td>
					<td onclick="submitEditRow('<%=noticeVO.getId()%>')"><%=noticeVO.getSubject()%></td>
					<td onclick="submitEditRow('<%=noticeVO.getId()%>')"><%=noticeVO.getPostedByName()%></td>				
					
						<%}else{ %>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>						
						<%}}%>
			</tbody>
			</table>
			</fieldset>
	</td>
			<%}else{%>
				<table border="0" width="100%" >
				<tr>
					<td  align="right" >&nbsp;</td>
					<td align="right" width="5%">&nbsp;</td>
					<td align="right" width="10%">&nbsp;</td>
				</tr>
			</table>
			
			<table class="tableBgColor"  width="100%" cellpadding="1" cellspacing="1"   height="10%" id="complaintsTable">
			<thead class="indiaLivesFonts" style="font-size: 14px"> 
				<tr id="complaintListOdd" class="trColor">
				   	<th width="5%">S.No</th>
					<th width="23%" nowrap="nowrap">Notice Type</th>			
					<th width="20%" nowrap="nowrap">Posted Date</th>
					<th nowrap="nowrap">Subject</th>
					<th width="18%" nowrap="nowrap">Posted By</th>				
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
					<td onclick="submitEditRowForUser('<%=noticeVO.getId()%>')" ><%=i+1%></td>
					<td onclick="submitEditRowForUser('<%=noticeVO.getId()%>')"><%=noticeVO.getNoticeTypeName()%></td>
					<td onclick="submitEditRowForUser('<%=noticeVO.getId()%>')"><%=DateUtil.getStringFromDate(noticeVO.getPostedDate())%></td>
					<td onclick="submitEditRowForUser('<%=noticeVO.getId()%>')"><%=noticeVO.getSubject()%></td>
					<td onclick="submitEditRowForUser('<%=noticeVO.getId()%>')"><%=noticeVO.getPostedByName()%></td>				
					
						<%}else{ %>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>						
						<%}}%>
			</tbody>
			</table>
			</fieldset>
	</td>	
			<%}%>
		 	
	
	<td valign="top" width="15%">
		<%@include file="advBoard.jsp" %>
	</td>	
	</tr>
	
</table>
<%@include file="footer.jsp" %>
<form method="post" name="noticeListFrm" action="/indialives/eventhandler" >
	<input type="hidden" name="event">
	<input type="hidden" name="editNoticeId">
	<input type="hidden" name="deleteNoticeIds">
</form>

</body>
</html>