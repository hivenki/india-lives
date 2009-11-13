function updateNotice(){
	var noticeType=document.getElementById("noticeTypeId").selectedIndex;	
	var postedDate=document.getElementById("postedDate").value;
	var subject=document.getElementById("subject").value;	
	var description=document.getElementById("description").value;	
	var msg="";
	
	if(noticeType!=null && noticeType=="0"){
		msg=msg+"Notice Type \n";
	}
	if(postedDate!=null && postedDate==""){
		msg=msg+"Posted Date \n";
	}
	if(subject!=null && subject==""){
		msg=msg+"Subject \n";
	}
	if(description!=null && description==""){
		msg=msg+"Description \n";
	}
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.updateNoticeFrm.event.value="updateNotice"
		document.updateNoticeFrm.submit();
	}
	
}


