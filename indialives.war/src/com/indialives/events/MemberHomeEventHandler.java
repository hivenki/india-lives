package com.indialives.events;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easymvc.eventhandler.EventHandler;
import com.easymvc.persistence.RowObject;
import com.easymvc.session.Session;
import com.easymvc.session.SessionFactory;
import com.indialives.PageNameConstants;
import com.indialives.SetAttributeConstants;
import com.indialives.dofactory.CommunityDOFactory;
import com.indialives.dofactory.RolePrivilegesVOFactory;
import com.indialives.voobjects.CommunityVO;
import com.indialives.voobjects.RolePrivilegesVO;


public class MemberHomeEventHandler implements EventHandler,PageNameConstants,SetAttributeConstants{
	
	private List<RowObject> gatedCommunityList=null;
	private List<RowObject> rolePrivilegesList=null;
	
	public void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(MEMBER_HOME);
		dispatcher.forward(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Session session=SessionFactory.getSession(request);
		int userId=session.getUser().getId();
		
		rolePrivilegesList=RolePrivilegesVOFactory.getRolePrivilegesList();
		
		
		HashMap<Integer, List<RolePrivilegesVO>> rolePrivilegesMap=new HashMap<Integer, List<RolePrivilegesVO>>();
		
		for(RowObject rowObject : rolePrivilegesList){
			RolePrivilegesVO privilegesVO=(RolePrivilegesVO)rowObject;
			List<RolePrivilegesVO> list=rolePrivilegesMap.get(privilegesVO.getRoleId());
			if(list==null){
				list=new ArrayList<RolePrivilegesVO>();
			}
			list.add(privilegesVO);
			rolePrivilegesMap.put(privilegesVO.getRoleId(),list);
		}
		
		session.put(ROLE_PRIVILEGE_MAP, rolePrivilegesMap);
		
		gatedCommunityList=CommunityDOFactory.getCommunitiesBasedOnId(userId);
		for(int i=0;i<gatedCommunityList.size();i++){
			CommunityVO communityVO=(CommunityVO)gatedCommunityList.get(i);
			session.put(communityVO.getId(), communityVO.getRoleId());
		}
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute(COMMUNITY_ID,null);
		request.setAttribute(COMMUNITY_LIST,gatedCommunityList);
		
	}

}
