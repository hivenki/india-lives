function  submitLogin(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	
	if(username!="null"  && password!="null" ){
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