package com.zestworld.util;

import com.zestworld.Table_DTO.EssenceDefine_DTO;

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
