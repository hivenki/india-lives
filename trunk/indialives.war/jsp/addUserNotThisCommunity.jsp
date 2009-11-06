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
<%@page import="com.indialives.voobjects.UsersVO"%>
<%@page import="com.indialives.dataobjects.RoleDO"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/addUserNotThisCommunity.js"></script>
</head>



<body>
<%
 List userListNotThisCommunity=(List)request.getAttribute(SetAttributeConstants.GET_USER_LIST_NOT_THIS_COMMUNITY);
List roleList=(List)request.getAttribute(SetAttributeConstants.GET_ROLE_LIST);
%>
<%@include file="header.jsp" %>


<table border="0" width="100%" height="84%" style="margin-top: 5px">

	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 98%;width: 100%">
	   <legend style="font-size:16px;">Create User</legend>
	   	  
	   	  <form name="addUserNotThisCommunityFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="100%">
		    	<tr>
				<td align="right" width="100%"><input type="button"  value="Save" onclick="saveUser('<%=userListNotThisCommunity.size()%>')"></td>
			</tr>
		    </table>
		   <table class="tableBgColor" width="100%"  cellpadding="1" cellspacing="1" >
		   
			 <tr class="trColor">
			 	<th  nowrap="nowrap"  width="5%"><input type="checkbox" name="selectall" onclick="doSelectAll('<%=userListNotThisCommunity.size()%>')" ></th>
			 	<th  nowrap="nowrap">S.No</th>
				<th  nowrap="nowrap">First Name</th>
				<th  nowrap="nowrap">Last Name</th>
				<th  nowrap="nowrap">Email</th>
				<th  nowrap="nowrap">Mobile No</th>
				<th  nowrap="nowrap">Role</th>
			</tr>
			<%
				int userRowSize=userListNotThisCommunity.size();
		    	if(userRowSize<12){
		    		userRowSize=12;
		    	} 
				
			for(int j=0;j<userRowSize;j++){
					 if(j%2==0){%>
						<tr class="evenTr" style="height:  20px;color: black;" style="text-indent: 4px">
						<%}else{%>
						<tr class="oddTr" style="height:  20px;color: black;" style="text-indent: 4px">
				<%}	
				if(j<userListNotThisCommunity.size()){	    
		    	 UsersVO usersVO=(UsersVO)userListNotThisCommunity.get(j); %>
		    	 <td><input type="checkbox"  name="select[<%=j%>]" value="<%=usersVO.getId()%>" ></td>		    	
				<td><%=j+1%></td>
				<td><%=usersVO.getFirstName()%></td>
				<td><%=usersVO.getLastName() %></td>
				<td><%=usersVO.getEmailId()%></td>
				<td><%=usersVO.getMobileNo()%></td>
				
				<td>
				<select name="statusName[<%=j%>]" style="width: 150px">
					<%
						if(roleList!=null){
							for(int i=0;i<roleList.size();i++){
								RoleDO roleDO=(RoleDO)roleList.get(i);
								%>
								<option value="<%=roleDO.getId()%>"><%=roleDO.getName()%>
								</option>
					<%
							}
						}
					%>
				</select>
				
				
				
				
				</td>
		   	  <%}else{%>	
		   	  	 <td>&nbsp;</td>   
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>	
				<td>&nbsp;</td>	
				<td>&nbsp;</td>				
				<%}}%>				
		</table>
		
		<input type="hidden" name="event" value="saveUserRoleContext"/>
		<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>"	value="com.indialives.formbean.jaxb.UserRoleContexts"/>
		
		</form>
		</fieldset>	
	</td>
	<td valign="top" width="15%" class="indiaLivesFonts">
		<fieldset style="height: 98%;" >
	    	<legend>Adv Board</legend>			
		</fieldset>
	</td>

	</tr>
	
</table>
<%@include file="footer.jsp" %>

</body>
</html>