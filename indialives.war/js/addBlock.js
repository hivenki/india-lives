function addBlock(){
	var blockName=document.getElementById("name").value;
	var description=document.getElementById("description").value;
	var noOfFloors=document.getElementById("noOfFloors").value;
	var msg="";
	if(blockName!=null && blockName==""){
		msg=msg+"BlockName \n";
	}
	if(description!=null && description==""){
		msg=msg+"Description \n";
	}
	if(noOfFloors!=null && noOfFloors==""){
		msg=msg+"No of Floors \n";
	}
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.addBlockFrm.submit();
	}	
}

