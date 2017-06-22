<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<% 
	request.setCharacterEncoding("UTF-8");
%>
<c:forEach items="${list}" var="n" varStatus="status">
	
	
<section class="task-section" style="margin-left: 45px;float:left;width:330px;display:inline">
<div class="tasklist">
	<div class="membername" id="membername_${n.category_id}" style="padding-top: 15px;padding-left:10px;color: #fff;">${n.title}</div>
	<div class="task_add" style="padding-top: 15px; padding-left: 20px">
		<span class="glyphicon glyphicon-plus" style="color: #fff;"></span>
	</div>
     
  
	<div class="task_menu" id="task_menu" data-toggle="dropdown" style="padding-top: 15px;" align="center">

		<!-- <span class="glyphicon glyphicon-option-vertical" style="color: #fff;"></span> -->
		<span class="glyphicon glyphicon-trash" style="color: #fff;"></span>
		
	</div>
	
	<div > <!-- id="add_taskContent" name="add_taskContent" method="post"> -->
		<div id="panel">
		<textarea class="form-control" id="task-content_${n.category_id}" placeholder="새 업무 만들기" style="margin: 10px -4px 0px -3px; height: 60px; width: 331px; border:0; resize: vertical"></textarea>
	    <div class="form-btn" style="background-color:#fff;width:331px;height: 40px;margin-left:-3px;">
			    <span class="glyphicon glyphicon-user" style="font-size:20px;margin-top:15px;margin-left:15px"></span>
	    		<span class="glyphicon glyphicon-calendar" id="calendar" style="font-size:20px;margin-left:10px"></span>
				<!-- <input type="text" id="calendar" name="calendar" style="font-size:20px;margin-left:10px"> -->
		</div> 
	
		<div class="form-submit" align="right" style="background-color:#fff;width:331px;height: 50px;margin-left: -3px;">
		
		<button class="btn btn-success width-100 mb-xs" role="button" id="cancleBtn" style="margin-right:5px">취소</button>
		<button class="btn btn-success width-100 mb-xs" role="button" onclick="createBtn(${n.category_id})" style="margin-right:5px">만들기</button>
		
		</div>
	</div>
</div>
<c:forEach items="${list2}" var="j" varStatus="status">	
	<c:if test="${n.category_id eq j.category_id && j.success_f == 0 }">
	<div class="task-content" id="taskTitle" style="cursor:pointer" 
		data-toggle="modal" data-target="#detailModal" onclick="detailModalView(${j.task_id})">
		<div class="task-content-check">
			<input type="checkbox" class="chkSuccess" value="${j.task_id}">
		</div>
 	${j.title}    
	</div>
	</c:if>
</c:forEach>	
</div>
</section>
</c:forEach>