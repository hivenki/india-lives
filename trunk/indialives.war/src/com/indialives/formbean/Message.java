package com.indialives.formbean;

import com.indialives.dataobjects.MessageDO;

/*
 * @author Venkateswara Reddy K.
 * 
 * Extending MessageDO in value objects in a bad design, as it means database layer objects are tied with UI level objects.
 * Still keeping it in the prototype for quick completion.
 * Finally it has to be done away with.
 */
public class Message extends MessageDO {
	
	private static final long serialVersionUID = 1L;
	
}
