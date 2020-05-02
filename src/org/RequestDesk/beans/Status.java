package org.RequestDesk.beans;

public class Status 
{
	private int id;
	private String name;
	private String createddate;
	private Integer color;
	
	public Status() { }
	
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
	
	public Integer GetColor() {
		return color;
	}
	
	public void SetColor(Integer color) {
		this.color = color;
	}
}
