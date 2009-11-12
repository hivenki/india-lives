package com.indialives.dataobjects;
/**
 * This DO represents an Inbox.
 * @author Venkateswara Reddy K
 */


public class InboxDO  implements java.io.Serializable, com.easymvc.persistence.RowObject
{
	
	private static final long serialVersionUID = 1L;

    private Integer id;
    private Integer userid;
    private Integer community_id;
    
   public InboxDO() {
   }

   public InboxDO(Integer id, Integer userid, Integer communityid) {
      this.id = id;
      this.userid = userid;
      this.community_id = communityid;
   }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getCommunity_id() {
		return community_id;
	}

	public void setCommunity_id(Integer communityId) {
		community_id = communityId;
	}

	public String getTableName() {
		return null;
	}
}


