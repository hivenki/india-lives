function addParkingSlot(){
	var parkingId=document.getElementById("parkingId").value;
	var location=document.getElementById("location").value;
	
	var msg="";
	if(parkingId!=null && parkingId=="0"){
		msg=msg+"Parking Name \n";
	}
	if(location!=null && location==""){
		msg=msg+"Location \n";
	}	
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.addParkingSlotFrm.submit();
	}	
}

