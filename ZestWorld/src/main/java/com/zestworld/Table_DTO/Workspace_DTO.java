package com.zestworld.Table_DTO;

public class Workspace_DTO {

	private int workspace_id;
	private String workspace_name= "";
	private String visit_id= "";
	private String description= "";
	private String user_id= "";
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(String visit_id) {
		this.visit_id = visit_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

}
