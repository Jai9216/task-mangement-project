package com.db;

public class Task {
	private int id;
	private String taskname,status,simlink,startdate,enddate,reasonforparking,deletemessage;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTaskname() {
		return taskname;
	}
	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSimlink() {
		return simlink;
	}
	public void setSimlink(String simlink) {
		this.simlink = simlink;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getReasonforparking() {
		return reasonforparking;
	}
	public void setReasonforparking(String reasonforparking) {
		this.reasonforparking = reasonforparking;
	}
	public String getDeletemessage() {
		return deletemessage;
	}
	public void setDeletemessage(String deletemessage) {
		this.deletemessage = deletemessage;
	}
	
	
}
