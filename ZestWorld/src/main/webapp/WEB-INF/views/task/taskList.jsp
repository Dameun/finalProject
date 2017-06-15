<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<h3>업무 리스트</h3>
<br>
<div class="btn-group">
                      <button type="button" class="btn btn-default" onclick="ajaxView('taskList.ajax')">업무리스트</button>
                      <button type="button" class="btn btn-default" onclick="ajaxView('analysis.ajax')">분석</button> 
                      <button type="button" class="btn btn-default" onclick="ajaxView('file.ajax')">파일</button>
                                        
</div>