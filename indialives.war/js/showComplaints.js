function  createComplaint(){
	document.showComplaintFrm.event.value="showComplaints";
	document.showComplaintFrm.submit();
}

function addComplaint(){
	
	document.showComplaintFrm.event.value="addComplaint";	
	var propertyName=document.getElementById("propertyId").selectedIndex;	
	var typeId=document.getElementById("typeId").selectedIndex;
	var description=document.getElementById("description").value;	
	var severityId=document.getElementById("severityId").selectedIndex;	
	var availableStartTime=document.getElementById("availableStartTime").value;
	var availableEndTime=document.getElementById("availableEndTime").value;
	var msg="";
	
	if(propertyName!=null && propertyName=="0"){
		msg=msg+"Property Name \n";
	}
	if(typeId!=null && typeId=="0"){
		msg=msg+"Complinat Type \n";
	}
	if(description!=null && description==""){
		msg=msg+"Description \n";
	}
	if(severityId!=null && severityId=="0"){
		msg=msg+"Severity \n";
	}
	if(availableStartTime!=null && availableStartTime==""){
		msg=msg+"Available Start Time \n";
	}
	if(availableEndTime!=null && availableEndTime==""){
		msg=msg+"Available End Time \n";
	}
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.showComplaintFrm.submit();
	}
}
