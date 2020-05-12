package org.RequestDesk.beans;

/** Represents Request
	@author Akshin A. Mustafayev
	@version 1.0
*/
public class Request 
{
	private int id;
	private String topic;
	private String description;
	private String createddate;
	private String solution;
	private int author;
	private int status;
	private int priority;
	private int usergroup;
	private int requesttype;
	private int assigned;
	
	private String authorname;
	private String assignedname;
	
	public Request() { }
	
	public Integer GetId() {
		return id;
	}
	
	public void SetId(Integer id) {
		this.id = id;
	}
	
	public String GetTopic() {
		return topic;
	}
	
	public void SetTopic(String topic) {
		this.topic = topic;
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

	public String GetSolution() {
		return solution;
	}
	
	public void SetSolution(String solution) {
		this.solution = solution;
	}

	public Integer GetAuthor() {
		return author;
	}
	
	public void SetAuthor(Integer author) {
		this.author = author;
	}

	public Integer GetStatus() {
		return status;
	}
	
	public void SetStatus(Integer status) {
		this.status = status;
	}

	public Integer GetPriority() {
		return priority;
	}
	
	public void SetPriority(Integer priority) {
		this.priority = priority;
	}

	public Integer GetUserGroup() {
		return usergroup;
	}
	
	public void SetUserGroup(Integer usergroup) {
		this.usergroup = usergroup;
	}

	public Integer GetRequestType() {
		return requesttype;
	}
	
	public void SetRequestType(Integer requesttype) {
		this.requesttype = requesttype;
	}

	public Integer GetAssigned() {
		return assigned;
	}
	
	public void SetAssigned(Integer assigned) {
		this.assigned = assigned;
	}
	

	public String GetAuthorName() {
		return authorname;
	}
	
	public void SetAuthorName(String authorname) {
		this.authorname = authorname;
	}
	
	public String GetAssignedName() {
		return assignedname;
	}
	
	public void SetAssignedName(String assignedname) {
		this.assignedname = assignedname;
	}
}
