package com.zestworld.Table_DTO;

public class Project_DTO {
	private int project_id;
	private int workspace_id;
	private String p_title;
	private String explain;
	private String p_state;
	private String start_date;
	private String end_date;
	private String p_admin;
	private int open_f;
	private int mark_f;
	private int essence_f;
	private String AUTHORITY;
	
	public String getAUTHORITY() {
		return AUTHORITY;
	}
	public void setAUTHORITY(String aUTHORITY) {
		AUTHORITY = aUTHORITY;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getP_state() {
		return p_state;
	}
	public void setP_state(String p_state) {
		this.p_state = p_state;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getP_admin() {
		return p_admin;
	}
	public void setP_admin(String p_admin) {
		this.p_admin = p_admin;
	}

	public int getOpen_f() {
		return open_f;
	}
	public void setOpen_f(int open_f) {
		this.open_f = open_f;
	}
	public int getMark_f() {
		return mark_f;
	}
	public void setMark_f(int mark_f) {
		this.mark_f = mark_f;
	}
	public int getEssence_f() {
		return essence_f;
	}
	public void setEssence_f(int essence_f) {
		this.essence_f = essence_f;
	}


}
