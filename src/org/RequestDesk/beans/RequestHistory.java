package org.RequestDesk.beans;

/** Represents Request
@author Akshin A. Mustafayev
@version 1.0
*/
public class RequestHistory 
{
	private int id;
	private int requestid;
	private String action;
	
	public RequestHistory() { }
	
	public Integer GetId() {
		return id;
	}
	
	public void SetId(Integer id) {
		this.id = id;
	}
	
	public Integer GetRequestId() {
		return requestid;
	}
	
	public void SetRequestId(Integer requestid) {
		this.requestid = requestid;
	}
	
	public String GetAction() {
		return action;
	}
	
	public void SetAction(String action) {
		this.action = action;
	}
}
