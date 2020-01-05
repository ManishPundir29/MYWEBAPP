package com.mywebapp.model;

public class StatusList {

	
	String statusId;
	String statusDesc;
	
	
	public StatusList(){
		
	}
	
	public StatusList(String statusId, String statusDesc){
		this.statusId=statusId;
		this.statusDesc = statusDesc;	
	}
	
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	
	
	
	



}
