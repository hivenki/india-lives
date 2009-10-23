
function  createComplaint(){
	document.complaintListFrm.submit();
}

function  submitSignOut(){	
	var message=confirm("Are you sure you want to signout? ");
	if (message==true)
	  {
		document.headerFrm.event.value="signOut";
		document.getElementById("headerFrm").submit();
	  }		
}

function submitHome(){
	document.headerFrm.event.value="memberHome";
	document.getElementById("headerFrm").submit();
	
}


