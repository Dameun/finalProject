<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String title= request.getParameter("title");

System.out.println(title);
%>

<section class="task-section" style="margin-left: 45px">
<div class="tasklist">
	<div class="membername" style="padding-top: 15px;padding-left:10px;color: #fff;">${title}</div>
	<div class="task_add" id="task_add"
		style="padding-top: 15px; padding-left: 20px">
		<span class="glyphicon glyphicon-plus" style="color: #fff;"></span>
	</div>
     
	<div class="task_menu" style="padding-top: 15px;" align="center">
		<span class="glyphicon glyphicon-option-vertical" style="color: #fff;"></span>
	</div>

	<div id="panel">
	
	
		<textarea class="form-control" id="task-content" placeholder="새 업무 만들기" style="margin: 10px -4px 0px -3px; height: 60px; width: 331px; border:0; resize: vertical"></textarea>
		
	    <div class="form-btn" style="background-color:#fff;width:331px;height: 40px;margin-left:-3px;">
				<span><i class="fa fa-fw fa-user-plus" style="font-size:20px;margin-top:15px;margin-left:5px"></i></span>
				<span><i class="fa fa-fw fa-calendar" style="font-size:20px"></i></span>
		</div>
		<div class="form-submit" align="right" style="background-color:#fff;width:331px;height: 50px;margin-left: -3px;">
		<button type="button" class="btn bg-olive margin" style="margin-right:-5px">취소</button>
		<button type="button" class="btn bg-olive margin" id="create_taskcontent">만들기</button>
		</div>
	</div>
	
</div>
</section>
