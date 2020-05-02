package org.RequestDesk.beans;

public class Group 
{
	private int id;
	private String name;
	private String createddate;
	
	public Group() { }
	
	public Integer GetId() {
		return id;
	}
	
	public String GetName() {
		return name;
	}
	
	public void SetName(String name) {
		this.name = name;
	}
	
	public String GetCreatedDate() {
		return createddate;
	}
	
	public void SetCreatedDate(String createddate) {
		this.createddate = createddate;
	}
}
