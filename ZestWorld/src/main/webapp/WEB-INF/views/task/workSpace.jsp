<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<h3>워크스페이스 </h3>

<br>

<div class="btn-group">
                      <button type="button" class="btn btn-default" onclick="location.href='taskList.htm'">업무리스트</button>
                      <button type="button" class="btn btn-default" onclick="ajaxView('analysis.ajax')">분석</button> 
                      <button type="button" class="btn btn-default" onclick="ajaxView('file.ajax')">파일</button>
</div>




 