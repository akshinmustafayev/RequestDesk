package org.RequestDesk.beans;

/** Represents Request type
	@author Akshin A. Mustafayev
	@version 1.0
*/
public class RequestType 
{
	private int id;
	private String name;
	private String description;
	private String createddate;
	private Boolean needapproval;
	
	public RequestType() { }
	
	public Integer GetId() {
		return id;
	}
	
	public void SetId(Integer id) {
		this.id = id;
	}
	
	public String GetName() {
		return name;
	}
	
	public void SetName(String name) {
		this.name = name;
	}
	
	public String GetDescription() {
		return description;
	}
	
	public void SetDescription(String description) {
		this.description = description;
	}
	
	public String GetCreatedDate() {
		return createddate;
	}
	
	public void SetCreatedDate(String createddate) {
		this.createddate = createddate;
	}
	
	public Boolean GetNeedApproval() {
		return needapproval;
	}
	
	public void SetNeedApproval(Boolean needapproval) {
		this.needapproval = needapproval;
	}
}
