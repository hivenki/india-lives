package com.indialives.events;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.BlockDOFactory;
import com.indialives.dofactory.FlatDOFactory;
import com.indialives.voobjects.FlatVO;

public class DeleteBlocksEventHandler implements EventHandler,SetAttributeConstants {

	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("eventhandler?event=communityAdmin");
		
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String deleteBlockIds=request.getParameter("deleteBlockIds");
		List<String> requestedList=getRequestedList(deleteBlockIds);
		List<RowObject> responseFlatVOs=FlatDOFactory.getAvailbleBlocks(deleteBlockIds);
		List<String> responseList=getResponseList(responseFlatVOs);
		requestedList.removeAll(responseList);
		deletedBlocks(requestedList);
		String delteBlockErrormessage=getErrorMessage(responseFlatVOs);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute(DELETE_BLOCKS_ERROR_MSG,delteBlockErrormessage);
 		
	}

	private String getErrorMessage(List<RowObject> responseFlatVOs) {
		String message="";
		for(int i=0;i<responseFlatVOs.size();i++){
			FlatVO flatVO=(FlatVO) responseFlatVOs.get(i); 
			message=message+flatVO.getBlockName()+",";
		}
		if(message.length()>0){
			message=message.substring(0,message.length()-1);
		}
		return message;
	}

	private void deletedBlocks(List<String> requestedList) {
		String deleteBlockIds="";
		for(int i=0;i<requestedList.size();i++){
			deleteBlockIds=deleteBlockIds+requestedList.get(i)+",";	
		}
		if(deleteBlockIds.length()>0){
			deleteBlockIds=deleteBlockIds.substring(0,deleteBlockIds.length()-1);
			String query="DELETE FROM BLOCKS WHERE ID IN("+deleteBlockIds+")";
			BlockDOFactory.deleteBlocks(query);
		}	
	}

	private List<String> getResponseList(List<RowObject> availbleBlocks) {
		List<String> list=new ArrayList<String>();
		for(int i=0;i<availbleBlocks.size();i++){
			FlatVO flatVO=(FlatVO) availbleBlocks.get(i);
			list.add(flatVO.getBlockId().toString());
		}
		return list;
	}

	private List<String> getRequestedList(String deleteBlockId) {
		String[] deleteBlockIds=deleteBlockId.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<deleteBlockIds.length;i++){
			list.add(deleteBlockIds[i]);
		}
		return list;
	}
		
	

}
