function submitForgot(){
	var username=document.getElementById("username").value;
	var resetPasword=document.getElementById("resetPasword").value;
	var msg="";
	if(username!=null && username==""){
		msg=msg+"Email/Mobile No \n";
	}
	if(resetPasword!=null && resetPasword==""){
		msg=msg+"ResetPasword \n";
	}
	if(msg!=null && msg!=""){
	
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.forgotPasswordFrm.event.value="resetPassword";
		document.forgotPasswordFrm.submit();
	}
	
}

function showMsg(msg){
	if(msg!='null'){
		alert(msg);
	}
}

function submitBack(){
	document.forgotPasswordFrm.event.value="index";
	document.forgotPasswordFrm.submit();
	
}