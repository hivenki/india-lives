function  submitSignOut(){	
	var message=confirm("Are you sure you want to signout? ");
	if (message==true)
	  {
		document.getElementById("signOutLink").href="eventhandler?event=signOut";
	  }	
}

function submitHome(){
	document.headerFrm.event.value="memberHome";
	document.getElementById("headerFrm").submit();
	
}