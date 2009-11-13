function addPropertyOwner(){
	var propertyId=document.getElementById("propertyId").selectedIndex;
	var ownerId=document.getElementById("ownerId").selectedIndex;
	var msg="";
	
	if(propertyId!=null && propertyId=="0"){
		msg=msg+"Property  \n";
	}
	if(ownerId!=null && ownerId=="0"){
		msg=msg+"Owner \n";
	}
	if(msg!=null && msg!=""){
		alert(msg.substring(0,msg.length-1)+"\nThese fields are empty");
	}else{	
		var proTyId=document.getElementById("propertyTypeId").value;
		document.addPropertyOwnerFrm.pTypeId.value=proTyId;
		var propId=document.getElementById("propertyId").value;
		document.addPropertyOwnerFrm.pId.value=propId;
		var ownId=document.getElementById("ownerId").value;
		document.addPropertyOwnerFrm.oId.value=ownId;
		document.addPropertyOwnerFrm.event.value="addPropertyOwner";
		document.addPropertyOwnerFrm.submit();
	}
}


function showProperty(){
	var pTypeId=document.getElementById("propertyTypeId").value;
	document.addPropertyOwnerFrm.propertyTypeIds.value=pTypeId;
	document.addPropertyOwnerFrm.event.value="showPropertyOwner";
	document.addPropertyOwnerFrm.submit();	
}
