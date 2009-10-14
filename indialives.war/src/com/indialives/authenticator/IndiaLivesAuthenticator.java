package com.indialives.authenticator;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import com.easymvc.Constants;
import com.easymvc.authentication.Authenticator;
import com.easymvc.exception.AuthenticationException;
import com.easymvc.session.User;
import com.easymvc.session.UserImpl;
import com.indialives.IndiaLiveMessageConstants;
import com.indialives.dataobjects.UserDO;
import com.indialives.dofactory.UserDOFactory;
import com.indialives.formbean.LoginUser;

public class IndiaLivesAuthenticator implements Authenticator,Constants,IndiaLiveMessageConstants{

	public User authenticate(HttpServletRequest request)
			throws AuthenticationException {
		
		LoginUser loginUser=(LoginUser) request.getAttribute(FORM_BEAN);
		UserDO userDO=UserDOFactory.findValidUser(loginUser);

		if(userDO==null){
			throw new AuthenticationException(INVALID_USER);
		}
		UserImpl userImpl=getUserImpl(userDO);
		return userImpl;
	}

	private UserImpl getUserImpl(UserDO userDO) {
		UserImpl userImpl=new  UserImpl();
		userImpl.setId(userDO.getId());
		userImpl.setFirstName(userDO.getFirstName());
		userImpl.setLastName(userDO.getLastName());
		userImpl.setLoginName(userDO.getEmailId());
		Timestamp now=new Timestamp(System.currentTimeMillis());
		userImpl.setTimestampOfLogin(now);		
		return userImpl;
	}
	
}
