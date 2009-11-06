
function  createComplaint(){
	document.complaintListFrm.event.value="showComplaints";
	document.complaintListFrm.submit();
}

function submitComplaintOpenRow(id){
	document.getElementById("complaintId").value=id;
	document.complaintListFrm.event.value="complaintDetails";
	document.complaintListFrm.submit();
	
}
