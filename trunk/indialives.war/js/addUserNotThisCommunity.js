

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


function saveUser(size){
	
	var formObj=document.getElementById("addUserNotThisCommunityFrm");
	var count=0;
	for(var i=0;i<size;i++){
		if(document.getElementById("select["+i+"]").checked){
			var userIdObj=getElement("userId["+count+"]",document.getElementById("select["+i+"]").value);
			formObj.appendChild(userIdObj);
			var roleIdObj=getElement("roleId["+count+"]",document.getElementById("statusName["+i+"]").value);
			formObj.appendChild(roleIdObj);	
			count=count+1;
		}
	}
	formObj.submit();
		
}

function getElement(elementName,elementValue) {
 	var elementObject = document.createElement("input");
 	elementObject.setAttribute("name",elementName);
 	elementObject.setAttribute("type","hidden");
 	elementObject.setAttribute("value",elementValue); 	
	return elementObject;
}
