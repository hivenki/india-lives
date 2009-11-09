var checkBoxSelectedCount=0;

function  createNotice(){
	document.noticeListFrm.event.value="showNotice";
	document.noticeListFrm.submit();
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


function editNotice(size){
	
	var count=0;
	var editId="";
	for(var i=0;i<size;i++){
		if(document.getElementById("select["+i+"]").checked){
			count=count+1;	
			if(count>1){
				break;
			}	
			editId=editId+document.getElementById("select["+i+"]").value;
		}
	}	
	
	if(count==1){
		document.getElementById("editNoticeId").value=editId;
		document.noticeListFrm.event.value="showEditNotice";
		document.noticeListFrm.submit();		
	}
	else if(count>1){
		alert("chose only one checkbox");
	}
	else{
		alert("chose the checkbox");
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
function deleteNotice(size){
	
		if(isEligibleForDelete(size)){
			var message=confirm("Are you sure you want to delete? ");
			if (message==true)
			  {
				
				var noticeIds="";
				for(var i=0;i<size;i++){
					if(document.getElementById("select["+i+"]").checked){
						noticeIds=noticeIds+document.getElementById("select["+i+"]").value+",";
					}
				}
				if(noticeIds.length>0){
					noticeIds=noticeIds.substring(0,noticeIds.length-1);
				}
				document.getElementById("deleteNoticeIds").value=noticeIds;
				document.noticeListFrm.event.value="deleteNotice";
				document.noticeListFrm.submit();
			  }
		}
}

function submitEditRow(id){
	document.getElementById("editNoticeId").value=id;
	document.noticeListFrm.event.value="showEditNotice";
	document.noticeListFrm.submit();
	
}


function submitEditRowForUser(id){
	document.getElementById("editNoticeId").value=id;
	document.noticeListFrm.event.value="showEditForUser";
	document.noticeListFrm.submit();
}