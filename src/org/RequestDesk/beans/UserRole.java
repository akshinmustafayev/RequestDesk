package org.RequestDesk.beans;

/** Represents User
@author Akshin A. Mustafayev
@version 1.0
*/
public class UserRole
{
	private Integer id;
	private Integer userid;
	private Integer userrole;
	
	public UserRole() { }
	
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
	
	public Integer GetUserRole() {
		return userrole;
	}
	
	public void SetUserRole(Integer userrole) {
		this.userrole = userrole;
	}
	
	public String GetUserRoleName(Integer role) {
		if(role == null) return "None";
		else if(role == 1) return "User";
		else if(role == 2) return "Report user";
		else if(role == 3) return "Technician";
		else if(role == 4) return "Admin";
		else return "None";
	}
}
