var checkBoxSelectedCount=0;

function addFlat(){
	document.communityAdmin.event.value="showFlat";
	document.communityAdmin.submit();
	
}

function addVilla(){
	document.communityAdmin.event.value="showVilla";
	document.communityAdmin.submit();
	
}
function addBlock(){
	document.communityAdmin.event.value="showBlock";
	document.communityAdmin.submit();
	
}

function uploadCSV(){
		document.uploadFlatFrm.event.value="uploadFlat";
	    document.uploadFlatFrm.submit();
}

function addFlatType(){
	document.communityAdmin.event.value="showFlatType";
	document.communityAdmin.submit();
}

function addParking(){
	document.communityAdmin.event.value="showParking";
	document.communityAdmin.submit();
}

function addParkingSlot(){
	document.communityAdmin.event.value="showParkingSlot";
	document.communityAdmin.submit();
}


function  uploadParkingSlot(){
		document.uploadParkingSlotFrm.event.value="uploadParkingSlot";
		document.uploadParkingSlotFrm.submit();
}

function uploadVilla(){
		document.uploadVillaFrm.event.value="uploadVilla";
	    document.uploadVillaFrm.submit();
}


function isEligibleForDelete(size){
	for(var i=0;i<size;i++){
		if(document.getElementById("select["+i+"]").checked){
			return true;
		}
	}	
	return false;
}

function submitForm(eventValue){
	
	document.communityAdmin.event.value=eventValue;
	document.communityAdmin.submit();
}


function doSelectAll(size){
	var headCheckBoxSelected=false;
	headCheckBoxSelected=document.getElementById("selectall").checked;
	if(!headCheckBoxSelected){
		checkBoxSelectedCount=0;
	}else{
		checkBoxSelectedCount=size;
	}
	for(var i=0;i<size;i++){
		document.getElementById("select["+i+"]").checked=headCheckBoxSelected;		
	}
}

function deleteBlock(size){
	
		if(isEligibleForDelete(size)){
			
			var blockIds="";
			var message=confirm("Are you sure you want to delete? ");
			if (message==true)
			  {
				for(var i=0;i<size;i++){
					if(document.getElementById("select["+i+"]").checked){
						blockIds=blockIds+document.getElementById("select["+i+"]").value+",";
					}
				}
				if(blockIds.length>0){
					blockIds=blockIds.substring(0,blockIds.length-1);
				}
				document.getElementById("deleteBlockIds").value=blockIds;
				submitForm("deleteBlocks");
			  }
		}
	  
	
}



function monitor(object,size){
	
	if(object.checked){
		checkBoxSelectedCount=checkBoxSelectedCount+1;
	}else{
		checkBoxSelectedCount=checkBoxSelectedCount-1;
	}
	if(checkBoxSelectedCount==size){
		document.getElementById("selectall").checked=true;
	}else{
		document.getElementById("selectall").checked=false;
	}
}



function addUser(){

	document.communityAdmin.event.value="addUserForThisCommunity";
	document.communityAdmin.submit();
}

function showProperty(){
	var pTypeId=document.getElementById("propertyTypeId").value;
	document.communityAdmin.propertyTypeIds.value=pTypeId;
	document.communityAdmin.event.value="propertyOwners";
	document.communityAdmin.submit();
	
}

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
		document.communityAdmin.pTypeId.value=proTyId;
		var propId=document.getElementById("propertyId").value;
		document.communityAdmin.pId.value=propId;
		var ownId=document.getElementById("ownerId").value;
		document.communityAdmin.oId.value=ownId;
		document.communityAdmin.event.value="addPropertyOwner";
		document.communityAdmin.submit();
	}
}

function uploadPropertyOwner(){
		document.uploadPropertyOwnerFrm.event.value="uploadPropertyOwner";
	    document.uploadPropertyOwnerFrm.submit();
}