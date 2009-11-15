function addParkingSlot(){
	var propertyId=document.getElementById("propertyId").selectedIndex;
	var parkingId=document.getElementById("parkingId").selectedIndex;
	var location=document.getElementById("location").value;
	
	var msg="";
	if(propertyId!=null && propertyId=="0"){
		msg=msg+"Property  \n";
	}
	if(parkingId!=null && parkingId=="0"){
		msg=msg+"Parking Name \n";
	}
	if(location!=null && location==""){
		msg=msg+"Location \n";
	}	
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		//var proTyId=document.getElementById("propertyTypeId").value;
		//document.addParkingSlotFrm.pTypeId.value=proTyId;
		//var propId=document.getElementById("propertyId").value;
		//document.addParkingSlotFrm.pId.value=propId;
		document.addParkingSlotFrm.event.value="addParkingSlot";
		document.addParkingSlotFrm.submit();
	}	
}

function showProperty(){
	
	document.addParkingSlotFrm.event.value="showParkingSlot";
	document.addParkingSlotFrm.submit();	
}

function showErrorMsg(msg){
	if(msg!='null'){
		alert(msg);
	}
}
