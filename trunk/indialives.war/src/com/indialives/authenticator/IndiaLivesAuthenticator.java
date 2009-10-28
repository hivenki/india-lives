package com.indialives.authenticator;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import com.easymvc.Constants;
import com.easymvc.authentication.Authenticator;
import com.easymvc.exception.AuthenticationException;
import com.easymvc.session.User;
import com.easymvc.session.UserImpl;
import com.indialives.IndiaLiveMessageConstants;
import com.indialives.dofactory.UserDOFactory;
import com.indialives.formbean.LoginUser;
import com.indialives.voobjects.UsersVO;

public class IndiaLivesAuthenticator implements Authenticator,Constants,IndiaLiveMessageConstants{

	public User authenticate(HttpServletRequest request)
			throws AuthenticationException {
		
		LoginUser loginUser=(LoginUser) request.getAttribute(FORM_BEAN);
		UsersVO usersVO=UserDOFactory.findValidUser(loginUser);

		if(usersVO==null){
			throw new AuthenticationException(INVALID_USER);
		}
		UserImpl userImpl=getUserImpl(usersVO);
		return userImpl;
	}

	private UserImpl getUserImpl(UsersVO usersVO) {
		UserImpl userImpl=new  UserImpl();
		userImpl.setId(usersVO.getId());
		userImpl.setFirstName(usersVO.getFirstName());
		userImpl.setLastName(usersVO.getLastName());
		userImpl.setLoginName(usersVO.getEmailId());
		userImpl.setRoleId(usersVO.getRoleId());		
		Timestamp now=new Timestamp(System.currentTimeMillis());
		userImpl.setTimestampOfLogin(now);		
		return userImpl;
	}
	
}
