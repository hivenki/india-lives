function addFlatType(){
	var name=document.getElementById("name").value;
	var description=document.getElementById("description").value;
	
	var msg="";
	if(name!=null && name==""){
		msg=msg+"Name \n";
	}
	if(description!=null && description==""){
		msg=msg+"Description \n";
	}	
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.addFlatTypeFrm.submit();
	}	
}

