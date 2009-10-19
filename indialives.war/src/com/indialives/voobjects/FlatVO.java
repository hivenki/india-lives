package com.indialives.voobjects;

import com.indialives.dataobjects.FlatDO;

public class FlatVO extends FlatDO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String blockName;
	private String flatTypeName;

	public String getBlockName() {
		return blockName;
	}

	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}

	public String getFlatTypeName() {
		return flatTypeName;
	}

	public void setFlatTypeName(String flatTypeName) {
		this.flatTypeName = flatTypeName;
	}
}
