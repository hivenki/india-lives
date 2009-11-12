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
	var fileString=document.uploadFlatFrm.Filedata.value;
	if(fileString!='null' && fileString.length>0 ){
		fileString=fileString.substring(fileString.lastIndexOf(".")+1,fileString.length);
		if(fileString!="" && fileString!="csv" && fileString!="CSV"){
			alert("You have selected a ."+fileString+" file.Please select a .csv file instead!");
			return false;	
		}
		document.uploadFlatFrm.event.value="uploadFlat";
		document.uploadFlatFrm.submit();
	}
	else{
		alert("Filename is empty");
	}

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
	var fileString=document.uploadParkingSlotFrm.Filedata.value;
	if(fileString!='null' && fileString.length>0 ){
		fileString=fileString.substring(fileString.lastIndexOf(".")+1,fileString.length);
		if(fileString!="" && fileString!="csv" && fileString!="CSV"){
			alert("You have selected a ."+fileString+" file.Please select a .csv file instead!");
			return false;	
		}
		document.uploadParkingSlotFrm.event.value="uploadParkingSlot";
		document.uploadParkingSlotFrm.submit();
	}
	else{
		alert("Filename is empty");
	}
}

function uploadVilla(){
	var fileString=document.uploadVillaFrm.Filedata.value;
	if(fileString!='null' && fileString.length>0 ){
		fileString=fileString.substring(fileString.lastIndexOf(".")+1,fileString.length);
		if(fileString!="" && fileString!="csv" && fileString!="CSV"){
			alert("You have selected a ."+fileString+" file.Please select a .csv file instead!");
			return false;	
		}
		document.uploadVillaFrm.event.value="uploadVilla";
	    document.uploadVillaFrm.submit();
	}
	else{
		alert("Filename is empty");
	}
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
	var fileString=document.uploadPropertyOwnerFrm.Filedata.value;
	if(fileString!='null' && fileString.length>0 ){
		fileString=fileString.substring(fileString.lastIndexOf(".")+1,fileString.length);
		if(fileString!="" && fileString!="csv" && fileString!="CSV"){
			alert("You have selected a ."+fileString+" file.Please select a .csv file instead!");
			return false;	
		}
		document.uploadPropertyOwnerFrm.event.value="uploadPropertyOwner";
	    document.uploadPropertyOwnerFrm.submit();
	}
	else{
		alert("Filename is empty");
	}	    
}