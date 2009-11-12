package com.indialives.dataobjects;
/**
 * This DO represents a message that sits in user Inbox.
 * @author Venkateswara Reddy K
 */

import java.util.Date;

public class MessageDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
{
	
	private static final long serialVersionUID = 1L;

    private Integer id;
    private String sender;
    private String subject;
    private String status;
    private Date date;
    private String content;
	private Integer inboxid;


	public MessageDO() {
	}

	public MessageDO(Integer id, 
			         String sender, 
			         String subject,
			         String status,
			         Date date,
			         String content,
			         Integer inboxid) 
	{
	    this.id = id;
	    this.sender = sender;
	    this.subject = subject;
	    this.status = status;
	    this.date = date;
	    this.content = content;
	    this.inboxid = inboxid;
	   
	}
	
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getInboxid() {
		return inboxid;
	}

	public void setInboxid(Integer inboxid) {
		this.inboxid = inboxid;
	}

	public String getTableName() {
		return null;
	}
}


