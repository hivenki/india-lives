<html>
<head>
<title>Welcome to IndiaLives</title>

<%@include file="indialives_css.jspf"%>

</head>
<script type="text/javascript">
function submitLogin(){
	document.errorFrm.submit();
}
</script>

<%
	String errormessage=request.getParameter("error");
%>

<body>

 <form action="/indialives/eventhandler"  name="errorFrm" method="post">
 	<table align="center" border="0" >
 		<tr>
 			<td class="Error">The server encountered an internal error<br><br>Error: <%=errormessage%> <br><br>Please try logging-in again</td>
 		</tr>
 		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
 		<tr align="center">
 			<td><b><a href="/indialives" class="indiaLivesFonts" style="font-size: 14px; font-weight: bold;"> Login  </a></b></td>
 		</tr> 
 	</table>
 
 
 <input type="hidden" name="event" value="index">
 </form>


</body>
</html>