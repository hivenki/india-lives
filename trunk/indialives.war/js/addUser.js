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
		document.addUserFrm.event.value="addUser"
		document.addUserFrm.submit();
	}	
}

function submitBack(){
	document.addUserFrm.event.value="index";
	document.addUserFrm.submit();
}

function submitClear(){
	var firstName=document.getElementById("firstName").value;
	var lastName=document.getElementById("lastName").value;
	var emailId=document.getElementById("emailId").value;
	var mobileNo=document.getElementById("mobileNo").value;
	var password=document.getElementById("password").value;
	
	firstName="";
	lastName="";
	emailId="";
	mobileNo="";
	password="";
	
}
function isValidateMailId(elementObject) {
		var mailId = elementObject.value;
		if(mailId == EMPTY_STRING) {
		return FALSE_FLAG;
	}
	
	if(isNotMailChar(mailId)) {
		return FALSE_FLAG;
	}

	if(!isFirstCharValid(mailId)){
		return FALSE_FLAG;
	}
	
	if(!isDomainValid(mailId)){
		return FALSE_FLAG;
	}
	
	return TRUE_FLAG;
 	//return validateRegularExpression(elementObject,ISEMAILID_REG_EXPR);
}


/* 	function - to validate any special characters found in the e-mail id other than @, ., -, _
	input - gets an e-mail id string
	output - returns true or false
*/
	 function isNotMailChar(mailId) {
	if(mailId.match(ISMAILID_REG_EXPR)) {
		return FALSE_FLAG;
	}
	return TRUE_FLAG;
}


/* 	function - to validate the first character of the e-mail id
	input - gets an e-mail id string
	output - returns true or false
*/
	function isFirstCharValid(mailId) {
	var mailIdStartsWithAT = mailId.indexOf(CONSTANT_AT);
	if(mailIdStartsWithAT == 0) {
		return FALSE_FLAG;
	}
	return TRUE_FLAG;
}


/* 	function - to validate the domain of the e-mail id
	input - gets an e-mail id string
	output - returns true or false
*/
	function isDomainValid(mailId) {
	var mailIdATIndex = mailId.indexOf(CONSTANT_AT);
	if(mailIdATIndex == -1) {
		return FALSE_FLAG;
	}
	
	var mailIdAfterAT = mailId.substring(mailIdATIndex + 1);
	var mailIdAfterATIndex = mailIdAfterAT.indexOf(CONSTANT_AT);
	if(mailIdAfterATIndex != -1) {
		return FALSE_FLAG;
	}

	var mailIdStartsWithDot = mailIdAfterAT.indexOf(CONSTANT_DOT);
	var mailIdEndsWithDot = mailIdAfterAT.lastIndexOf(CONSTANT_DOT) - (mailIdAfterAT.length - 1);
	var mailIdWithDot = mailIdAfterAT.indexOf(CONSTANT_DOT);
	var mailIdWithDotDot = mailIdAfterAT.indexOf(CONSTANT_DOT+CONSTANT_DOT);

	if((mailIdStartsWithDot == 0) || (mailIdEndsWithDot == 0) || (mailIdWithDot == -1) || (mailIdWithDotDot != -1)) {
		return FALSE_FLAG;
	}
	
	return TRUE_FLAG;
}

