package com.zestworld.Table_DTO;

import java.util.Date;

public class Task_DTO 
{
	private int task_id;
	private int category_id;
	private int workspace_id;
	private int project_id;

	private String user_id;
	private String title;
	private String explain;
	private String start_date;
	private String end_date;
	private String member;
	private String follower;
	private int point;
	private String success_f;
	private String projectname;
	
	//************************�닔�젙
	private String filterDay;
	private String order;
	private String endrolldate;
	
	private String p_title;
	
	private int paging;
	
	
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
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
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getSuccess_f() {
		return success_f;
	}
	public void setSuccess_f(String success_f) {
		this.success_f = success_f;
	}
	public String getFilterDay() {
		return filterDay;
	}
	public void setFilterDay(String filterDay) {
		this.filterDay = filterDay;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getEndrolldate() {
		return endrolldate;
	}
	public void setEndrolldate(String endrolldate) {
		this.endrolldate = endrolldate;
	}
	
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getPaging() {
		return paging;
	}
	public void setPaging(int paging) {
		this.paging = paging;
	}
	
}
