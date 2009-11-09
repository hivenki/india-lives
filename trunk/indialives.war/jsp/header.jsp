<%@page import="com.easymvc.session.SessionFactory"%>
<table border="0" width="100%">
	<tr>
		<td width="15%"style="font-size: large;text-indent: 25px">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	    <div class="contentb">
		IndiaLives
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</td>
		<td>
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
	    <div class="contentb">
		<table width="90%">
			 <tr style="font-family: calibri;font-size:16px;">
				<td><a href="eventhandler?event=memberHome"  style="text-decoration: none ">Home</a></td>
				<td><a href="eventhandler?event=userProfile"  style="text-decoration: none ">Profile</a></td>
				
				<td align="right"><%=SessionFactory.getSession(request).getUser().getFirstName()+" "+ SessionFactory.getSession(request).getUser().getLastName()%></td>				
				<td align="right"><a id="signOutLink" href="#" style="text-decoration: none " onclick="submitSignOut()">Sign Out</a></td>
			</tr>
			</table>
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		</td>
	</tr>
</table>
<input type="hidden" name="event">
