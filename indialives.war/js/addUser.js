function addUser(){
	var firstName=document.getElementById("firstName").value;
	var lastName=document.getElementById("lastName").value;
	var emailId=document.getElementById("emailId").value;
	var mobileNo=document.getElementById("mobileNo").value;
	var password=document.getElementById("password").value;
	
	var msg="";
	if(firstName!=null && firstName==""){
		msg=msg+"FirstName \n";
	}
	if(lastName!=null && lastName==""){
		msg=msg+"LastName \n";
	}
	if(emailId!=null && emailId==""){
		msg=msg+"EmailId \n";
	}
	if(mobileNo!=null && mobileNo==""){
		msg=msg+"MobileNo \n";
	}
	if(password!=null && password==""){
		msg=msg+"Password \n";
	}
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.addUserFrm.submit();
	}	
}

