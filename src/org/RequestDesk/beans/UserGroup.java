package org.RequestDesk.beans;

/** Represents User
@author Akshin A. Mustafayev
@version 1.0
*/
public class UserGroup 
{
	private Integer id;
	private Integer userid;
	private Integer groupid;
	private String groupname;
	
	public UserGroup() { }
	
	public Integer GetId() {
		return id;
	}
	
	public void SetId(Integer id) {
		this.id = id;
	}
	
	public Integer GetUserId() {
		return userid;
	}
	
	public void SetUserId(Integer userid) {
		this.userid = userid;
	}
	
	public Integer GetGroupId() {
		return groupid;
	}
	
	public void SetGroupId(Integer groupid) {
		this.groupid = groupid;
	}
	
	public String GetGroupName() {
		return groupname;
	}
	
	public void SetGroupName(String groupname) {
		this.groupname = groupname;
	}
}