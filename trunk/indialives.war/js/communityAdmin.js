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