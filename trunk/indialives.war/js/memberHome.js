function  submitCommunity(){
	var gatedCommunityId=document.getElementById("gatedCommunityId").checked;
	var radioChecked=false;
	for(var i=0;i<document.memberHome.gatedCommunityId.length;i++){		
		if(document.memberHome.gatedCommunityId[i].checked==true){
			radioChecked=true;			
		}		
	}	
	
	if(!radioChecked){
		alert("Please check any one of the radio button");	
	}else{
		document.memberHome.submit();		
	}	
}
