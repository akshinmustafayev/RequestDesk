package org.RequestDesk.beans;
import org.RequestDesk.misc.HashUtil;

/** Represents User
@author Akshin A. Mustafayev
@version 1.0
*/
public class User 
{
	private int id;
	private String login;
	private String password;
	private String email;
	private String fullname;
	private String lastlogindate;
	private String passwordsalt;
	private int userrole;
	private String session;
	private String language;
	
	public User() { }
	
	public Integer GetId() {
		return id;
	}
	
	public String GetLogin() {
		return login;
	}
	
	public void SetLogin(String login) {
		this.login = login;
	}

	public String GetPassword() {
		return password;
	}
	
	public void SetPassword(String password) {
		this.password = HashUtil.GetSHA256String(password);
	}

	public String GetEmail() {
		return email;
	}
	
	public void SetEmail(String email) {
		this.email = email;
	}

	public String GetFullName() {
		return fullname;
	}
	
	public void SetFullName(String fullname) {
		this.fullname = fullname;
	}

	public String GetLastLoginDate() {
		return lastlogindate;
	}
	
	public void SetLastLoginDate(String lastlogindate) {
		this.lastlogindate = lastlogindate;
	}

	public String GetPasswordSalt() {
		return passwordsalt;
	}
	
	public void SetPasswordSalt(String passwordsalt) {
		this.passwordsalt = passwordsalt;
	}

	public Integer GetUserRole() {
		return userrole;
	}
	
	public void SetUserRole(Integer userrole) {
		this.userrole = userrole;
	}

	public String GetSession() {
		return session;
	}
	
	public void SetSession(String session) {
		this.session = session;
	}

	public String GetLanguage() {
		return language;
	}
	
	public void SetLanguage(String language) {
		this.language = language;
	}
}
