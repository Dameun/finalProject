package com.zestworld.util;

import com.zestworld.Table_DTO.EssenceDefine_DTO;
/*
* @FileName : EssenceInfo.java
* @Project : ZestWorld
* @Date : 2017. 6. 23
* @Author : 장윤희
* @Desc : 에센스 프로젝트 생성시 사용하는 essence info class
*/
public class EssenceInfo {

	private String select_id= "";
	private EssenceDefine_DTO define = new EssenceDefine_DTO();
	
	public String getSelect_id() {
		return select_id;
	}
	public void setSelect_id(String select_id) {
		this.select_id = select_id;
	}
	public EssenceDefine_DTO getDefine() {
		return define;
	}
	public void setDefine(EssenceDefine_DTO define) {
		this.define = define;
	}
	
}
