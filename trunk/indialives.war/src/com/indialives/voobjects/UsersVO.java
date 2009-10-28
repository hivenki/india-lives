package com.indialives.voobjects;

import com.indialives.dataobjects.UserDO;

public class UsersVO extends UserDO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer roleId;
	private Integer communityId;
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getCommunityId() {
		return communityId;
	}
	public void setCommunityId(Integer communityId) {
		this.communityId = communityId;
	}
}
