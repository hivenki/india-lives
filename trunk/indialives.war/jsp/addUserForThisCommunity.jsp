<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="java.util.List"%>
<%@page import="com.indialives.voobjects.UsersVO"%>
<%@page import="com.indialives.dataobjects.RoleDO"%><html>
<head>
<title>Welcome to IndiaLives</title>
<%@ include file="header.jspf" %>
<%@include file="indialives_css.jspf"%>
<script type="text/javascript" language="javascript" src="/indialives/js/addUserForThisCommunity.js"></script>
</head>
<body>
<%
 List userListNotThisCommunity=(List)request.getAttribute(SetAttributeConstants.GET_USER_LIST_FOR_THIS_COMMUNITY);
List roleList=(List)request.getAttribute(SetAttributeConstants.GET_ROLE_LIST);
%>
<%@include file="header.jsp" %>
<table border="0" width="100%" height="84%" style="margin-top: 5px">
	<tr>
	<td width="15%">
		<%@include file="contentPage.jsp" %>
	</td>
	 <td valign="top"  class="indiaLivesFonts" style="font-size:14px;">	
	  <fieldset style="height: 99%;width: 100%">
	   <legend style="font-size:16px;">Assign User</legend>
	   	  <form name="addUserForThisCommunityFrm" action="/indialives/eventhandler" method="post">
	    	<table border="0" width="100%">
		    	<tr>
				<td align="right" width="100%"><input type="button"  value="Save" onclick="saveUser('<%=userListNotThisCommunity.size()%>')"></td>
			</tr>
		    </table>
		   <table class="tableBgColor" width="100%"  cellpadding="1" cellspacing="1" >
			 <tr class="trColor">
			 	<th width="3%"><input type="checkbox" name="selectall" onclick="doSelectAll('<%=userListNotThisCommunity.size()%>')" ></th>
			 	<th  nowrap="nowrap">S.No</th>
				<th  nowrap="nowrap" width="18%">First Name</th>
				<th  nowrap="nowrap" width="18%">Last Name</th>
				<th  nowrap="nowrap" width="25%">Email</th>
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
				<td nowrap="nowrap" width="18%"><%=usersVO.getFirstName()%></td>
				<td nowrap="nowrap" width="18%"><%=usersVO.getLastName() %></td>
				<td nowrap="nowrap" width="25%"><%=usersVO.getEmailId()%></td>
				<td><%=usersVO.getMobileNo()%></td>
				<td>
				<select name="statusName[<%=j%>]" style="width: 132px">
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
	<td valign="top" width="15%">
		<%@include file="advBoard.jsp" %>
	</td>	
	</tr>
</table>
<%@include file="footer.jsp" %>
</body>
</html>