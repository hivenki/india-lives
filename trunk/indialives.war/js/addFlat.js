function addFlat(){
	var blockId=document.getElementById("blockId").value;
	var floor=document.getElementById("floor").value;
	var flatNo=document.getElementById("flatNo").value;
	var flatTypeId=document.getElementById("flatTypeId").value;
	var noOfBedRooms=document.getElementById("noOfBedRooms").value;
	var msg="";
	if(blockId!=null && blockId==""){
		msg=msg+"BlockName \n";
	}
	if(floor!=null && floor==""){
		msg=msg+"Floor \n";
	}
	if(flatNo!=null && flatNo==""){
		msg=msg+"FlatNo \n";
	}
	if(flatTypeId!=null && flatTypeId==""){
		msg=msg+"Flat Type \n";
	}
	if(noOfBedRooms!=null && noOfBedRooms==""){
		msg=msg+"No of BedRooms \n";
	}
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.addFlatFrm.submit();
	}	
	
		
}

