package com.zestworld.Table_DTO;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Template_DTO {
	private int template_id;
	private String title;
	private String filesrc;
	private String filesrc2;
	
	private String user_id;
	private List<CommonsMultipartFile> files;
	
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(int template_id) {
		this.template_id = template_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFilesrc() {
		return filesrc;
	}
	public void setFilesrc(String filesrc) {
		this.filesrc = filesrc;
	}
	public String getFilesrc2() {
		return filesrc2;
	}
	public void setFilesrc2(String filesrc2) {
		this.filesrc2 = filesrc2;
	}
	
	
}
