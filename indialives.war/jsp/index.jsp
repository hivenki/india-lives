
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.indialives.SetAttributeConstants"%>
<%@page import="com.easymvc.Constants"%>
<%@page import="com.indialives.formbean.LoginUser"%>
<html>
<head>  
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>IndiaLives</title>
<meta name="keywords" content="" />
<meta name="description" content="" /> 
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<%@include file="indialives_css.jspf"%>
<%@ include file="header.jspf" %>
<script type="text/javascript" src="/indialives/js/index.js"></script>
</head>
<body>
<div id="header">
	<div id="logo">
		<h1><img src="images/logo_IL.jpg"></h1>
		
	</div>
</div>
<!-- start page -->
<div id="page">
	<!-- start sidebar1 -->
	<div id="sidebar1" class="sidebar">
	<ul>

          <li>Pay community bills</li>
          <li>Raise complaints</li>
          <li>Book Amenities</li>
	  <li>Manage the community</li>
	  <li>Manage the visitors</li>
	  <li>Complete online solutions</li>
        
	<div>
	</div>
				
			
	</div>
	<!-- end sidebar1 -->
	<!-- start content -->
	<div id="content">
		<div class="post">
			<h1 >Welcome to IndiaLives</h1>
			<div class="entry">
			<img src="images/maingraphics.jpg">
			
			</div>
			
			
		</div>
	</div>
	<!-- end content -->
	<!-- start sidebar2 -->

	<div id="sidebar2" class="sidebar">
       <div id="pinkblock"><div><ul><li id="search">
				
<form name="loginFrm" action="/indialives/eventhandler" method="post">
<table>
  <tr>
    <td class="formPrompt">Email: </td>
<td><input type="text" name="username" size="20" /></td>  </tr>
  <tr>
   <td class="formPrompt">Password: </td>
    <td><input type="password" name="password" size="20" /></td>
  </tr>
  
    <td height="26">&nbsp;</td>
    <td><input name="submit" type="submit" value="Sign In" id="submit" onclick="submitLogin()" /></td>
  </tr>  <tr>
      <td height="21"><div align="right">
        
      </td>
      <td><input type="checkbox" name="checkbox" value="checkbox">
      Remember Me </td>
    </tr>
</table><div id="signinproblem"><a href="#">Sign In Problem?</a></div>

<div id="ILaccount">Don't have a IndiaLives Account?
	<INPUT TYPE="image" SRC="images/create_button.jpg"  onclick="createUser()">
 </div>
	</div>
	
	</div>
	<img src="images/SignIn_Box.jpg">

	</div>
	</div>
	<!-- end sidebar2 -->
	
<!-- end page -->


<div id="footer">
<div id="aboutus"><table width="100%" border="0">
  <tr>
    <td colspan="3"><div align="center">
      <table width="800" border="0">
        <tr>
          <td colspan="3"><div id="aboutustext"><a href="#">AboutIL</a> | <a href="#">Terms</a> | <a href="#">Press</a> | <a href="#">Partners</a> | <a href="#">Careers</a> | <a href="#">Customers</a></div>
   <div id="copyrite">&copy; Copyright 2009 IndiaLives all rights reserved</td>
        </tr>
      </table>
    </div></td>
  </tr>
</table></div>
<input type="hidden" name="event"> 
	<input type="hidden" name="<%=Constants.FORM_BEAN_CLASS_NAME%>" value="<%=LoginUser.class.getName()%>">
	<input type="hidden" name="username" >
	
</form>
</body>
</html>
