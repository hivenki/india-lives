function  submitLogin(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	
	if(username!="null"  && password!="null" ){
		if(document.getElementById("remember").checked==true){			
			setCookie();
		}		
		document.loginFrm.event.value="login";
		document.loginFrm.submit();
		
	}else{	
		alert("Invalid Email/Mobile No Or PassWord");
			
	}
}
function errorMsg(msg){	
	if(msg!="null"){
		alert(msg);
	}	
}



function set_cookie ( uname, uvalue,exp_y, exp_m, exp_d, path, domain, secure )
{
	
	var cookie_string = uname + "=" + escape ( uvalue );
	
  if ( exp_y )
  {
	
    var expires = new Date ( exp_y, exp_m, exp_d );
   
    cookie_string += "; expires=" + expires.toGMTString();   
  }

  if ( path )
        cookie_string += "; path=" + escape ( path );

  if ( domain )
        cookie_string += "; domain=" + escape ( domain );
  	
  
  if ( secure )
        cookie_string += "; secure";
  
  document.cookie = cookie_string;
}

function setCookie(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	var exprDateString=new Date();
	var exprYear=exprDateString.getYear();
	var exprMonth=exprDateString.getMonth();
	var exprDate=exprDateString.getDate()+7;	
	set_cookie("username",username,exprYear,exprMonth,exprDate);
	set_cookie("password",password,exprYear,exprMonth,exprDate);
}

function get_cookie ( cookie_name )
{
  var results = document.cookie.match ( '(^|;) ?' + cookie_name + '=([^;]*)(;|$)' );

  if ( results )
    return ( unescape ( results[2] ) );
  else
    return null;
}

function fillLastLogin(){
	var username=get_cookie("username");
	var password=get_cookie("password");
	if(username!=null){
		document.getElementById("username").value=username;
		document.getElementById("password").value=password;
	}
}

function createUser(){
	document.loginFrm.event.value="createUser";
	document.loginFrm.submit();
}

function submitForgot(){
	document.loginFrm.event.value="forgotPassword";
	document.loginFrm.submit();
}



