function  submitLogin(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	
	if(username!="null"  && password!="null" ){
		if(document.getElementById("remember").checked==true){			
			setCookie('username',username,1,"localhost");
			setCookie('password',password,1,"localhost");
		}		
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


/*
function set_cookie ( uname, uvalue,pname,pvalue,exp_y, exp_m, exp_d, path, domain, secure )
{
	
	var cookie_string = uname + "=" + escape ( uvalue )+";"+ pname + "=" + escape ( pvalue );
	
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
	var exprMonth=exprDateString.getMonth()+1;
	var exprDate=exprDateString.getDate();	
	var domainName="http://localhost:8080/indialives";
	set_cookie("username",username);
	set_cookie("password",password);
	
	set_cookie ( "", "", 2009, 09, 30, "","localhost", "secure" );
}

function get_cookie ( cookie_name )
{
  var results = document.cookie.match ( '(^|;) ?' + cookie_name + '=([^;]*)(;|$)' );

  if ( results )
    return ( unescape ( results[2] ) );
  else
    return null;
}*/


function setCookie(c_name,value,expiredays,domain)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	document.cookie=c_name+ "=" +escape(value)+
	((expiredays==null) ? "" : ";expires="+exdate.toGMTString())+ "; domain=" + escape (domain);
	alert(document.cookie);
}



function getCookie(uName)
{
if (document.cookie.length>0)
  {
  c_start=document.cookie.indexOf(uName + "=");
  if (c_start!=-1)
    {
    c_start=c_start + uName.length+1;
    c_end=document.cookie.indexOf(";",c_start);
    if (c_end==-1) c_end=document.cookie.length;
    return unescape(document.cookie.substring(c_start,c_end));
    }
  }
return "";
}


function fillLastLogin(){
	var username=getCookie("username");
	var password=getCookie("password");
	if(username!=null){
		document.getElementById("username").value=username;
		document.getElementById("password").value=password;
	}
}






