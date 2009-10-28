package com.indialives.voobjects;

import com.indialives.dataobjects.CommunityDO;

public class CommunityVO  extends CommunityDO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer roleId;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}
