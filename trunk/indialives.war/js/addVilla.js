function addVilla(){
	var plotNo=document.getElementById("plotNo").value;
	var noOfFloors=document.getElementById("noOfFloors").value;
	var name=document.getElementById("name").value;	
	var noOfBedRooms=document.getElementById("noOfBedRooms").value;
	var noOfParkings=document.getElementById("noOfParkings").value;
	var msg="";
	if(plotNo!=null && plotNo==""){
		msg=msg+"plot No \n";
	}
	if(noOfFloors!=null && noOfFloors==""){
		msg=msg+"No of Floors \n";
	}
	if(name!=null && name==""){
		msg=msg+"Villa Name \n";
	}
	
	if(noOfBedRooms!=null && noOfBedRooms==""){
		msg=msg+"No of BedRooms \n";
	}
	if(noOfParkings!=null && noOfParkings==""){
		msg=msg+"No of Parkings \n";
	}
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{
		document.addVillaFrm.submit();
	}	
}

