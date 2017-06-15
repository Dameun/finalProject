<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     <!--민성 추가부분  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	
    <link href="dist/css/taskList.css" rel="stylesheet" type="text/css"/>
	<!--/민성추가부분  -->
    

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">
	 
	
	$(function(){

	

		
		$.ajax({
			type:"get",
			url:"taskLists.htm",
			dataType:'html',
			success:function(data){
			$("#View").append(data); 		
			},
			error:function(){
				alert('Error while request..');
			}
		});
		
		
		
		$("#add_taskTitle").on("submit", function(e) {

			$.ajax({
				type : "post",
				url : "membername.htm",
				cache : false,
				data : 'title=' + $("#title").val(),
				success : function(data) {
					console.log(data);					
				},
				error : function() {
					alert('Error while request..');
				}
			});
			e.preventDefault();
		});

		$("#addbtn").on("click", function() {

			$("#add_taskTitle").submit();
			
			$("#add-modal").hide();
			$('.modal-backdrop').hide();

		});
		$(".close").click(function() {
			$('.modal-backdrop').hide();
		});


		//토글 보이게
		  	$(document).on("click",".task_add",function(){
			 	$(this).parent(".tasklist").find("#panel").toggle();
					
			});
			 
		
		
	//혹시 모르는 백업용 주석코드(나중에 정리꼭하겠습니다..)	
		
	/* 
		$(document).on("click","#task_add1",function(){
			$(".task-section1").find("#panel").toggle();
		});
	
		$(document).on("click","#task_add2",function(){
			$(".task-section2").find("#panel").toggle();
	});
						
	*/	
	
	
	/*  $("#task_add").click(function() {
			$("#panel").toggle();
		}); 
	*/
		
		 
		//만들기
		$(document).on("click","#create_taskcontent",function(){
			
			$('.tasklist').append("<div class='task-content'>"
									+"<div class='task-content-check'>"
									+"<input type='checkbox'></div>"
									+$('#task-content').val()+"</div>");			  
		}); 
		  
		  
	  //삭제
		  $(document).on("click","#task_menu",function(){
			 
			  $.ajax({
					type:"get",
					url:"deleteTaskList.htm",
					data : "title=" + $(this).parent(".tasklist").find("#membername").text(),
					success:function(data){
						$("#View").empty();
						$("#View").append(data); 		
						},
					error:function(){
						alert('Error while request..');
					}
				});
				
		  }); 
		  
	});

</script>

<br>
<br>
<div class="row">
	<div class="col-md-5"></div>
	<div class="col-md-2">
		<ul class="nav nav-tabs">
			<li><a href="#">업무</a></li>
			<li><a href="#">분석</a></li>
			<li><a href="#">파일</a></li>
		</ul>
	</div>
	<div class="col-md-5"></div>
</div>

<div class="row ">
	<div class="col-md-1" align="right">
		<button class="btn btn-default dropdown-toggle" type="button"
			id="menu1" data-toggle="dropdown">
			전체 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">전체</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">나에게 배정된 업무</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">내가 작성한 업무</a></li>
			<li role="presentation" class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">팔로우 중</a></li>
		</ul>

	</div>
	<div class="col-md-2">

		<div class="input-group">
		
		<span class="input-group-addon">
		<span class="glyphicon glyphicon-search"></span>
		</span>
			<input type="text" class="form-control" placeholder="업무 검색하기">
		</div>

		<!-- modal -->
		<form id="add_taskTitle" name="add_taskTitle" method="post">
			<div class="modal fade" id="add-modal" style="display: none;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" style="align: center">업무리스트 추가</h4>
						</div>
						<div class="modal-body">
							<input class="form-control" type="text" id="title" name="title"
								placeholder="업무리스트 이름">

						</div>
						<div class="modal-footer">

							<!--   <button type="button" class="btn btn-primary">Save changes</button> -->
							<button type="button" class="btn btn-info btn-circle btn-lg"
								id="addbtn">
								<i class="fa fa-check"></i>
							</button>
							<button type="button" class="btn btn-warning btn-circle btn-lg"
								data-dismiss="modal" id="ucancle">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>

				</div>

			</div>
			<!-- /modal  -->
		</form>

	</div>

	<div class="col-md-7"></div>

	<div class="col-md-2" align="right">
		<button type="button" class="btn btn-default" data-toggle="modal"
			data-target="#add-modal">업무리스트 추가</button>

	</div>

</div>

<br>
<br>


<div id="View">

</div>

<!-- 

<section class="task-section" style="margin-left: 45px">
	<div class="tasklist">
		<div class="membername" style="padding-top: 15px;padding-left:10px;color: #fff;">김민성</div>
			<div class="task_add" id="task_add"
				style="padding-top: 15px; padding-left: 20px">
		<span class="glyphicon glyphicon-plus" style="color: #fff;"></span>
	</div>
     
	<div class="task_menu" style="padding-top: 15px;" align="center">
		<span class="glyphicon glyphicon-option-vertical" style="color: #fff;"></span>
	</div>

	<div id="panel">
	
	
		<textarea class="form-control" placeholder="새 업무 만들기" style="margin: 10px -4px 0px -3px; height: 60px; width: 331px; border:0; resize: vertical"></textarea>
		
	    <div class="form-btn" style="background-color:#fff;width:331px;height: 40px;margin-left:-3px;">
				<span><i class="fa fa-fw fa-user-plus" style="font-size:20px;margin-top:15px;margin-left:5px"></i></span>
				<span><i class="fa fa-fw fa-calendar" style="font-size:20px"></i></span>
		</div>
		<div class="form-submit" align="right" style="background-color:#fff;width:331px;height: 50px;margin-left: -3px;">
		<button type="button" class="btn bg-olive margin" style="margin-right:-5px">취소</button>
		<button type="button" class="btn bg-olive margin">만들기</button>
		</div>
	</div>
	
</div>
</section>
 -->
<!-- <section class="task-section" style="margin-left: 45px">
	<div class="tasklist">
	<div class="membername" style="padding-top: 15px;padding-left:10px;color: #fff;">김민성</div>
	<div class="task_add" id="task_add"
		style="padding-top: 15px; padding-left: 20px">
		<span class="glyphicon glyphicon-plus" style="color: #fff;"></span>
	</div>
     
	<div class="task_menu" style="padding-top: 15px;" align="center">
		<span class="glyphicon glyphicon-option-vertical" style="color: #fff;"></span>
	</div>

	<div id="panel">
	
	
		<textarea class="form-control" placeholder="새 업무 만들기" style="margin: 10px -4px 0px -3px; height: 60px; width: 331px; border:0; resize: vertical"></textarea>
		
	    <div class="form-btn" style="background-color:#fff;width:331px;height: 40px;margin-left:-3px;">
				<span><i class="fa fa-fw fa-user-plus" style="font-size:20px;margin-top:15px;margin-left:5px"></i></span>
				<span><i class="fa fa-fw fa-calendar" style="font-size:20px"></i></span>
		</div>
		
		<div class="form-submit" align="right" style="background-color:#fff;width:331px;height: 50px;margin-left: -3px;">
		<button type="button" class="btn bg-olive margin" style="margin-right:-5px">취소</button>
		<button type="button" class="btn bg-olive margin">만들기</button>
		</div>
	</div>
	<div class="task-content">
		<div class="task-content-check">
			<input type="checkbox">
		</div>
 	일라일라일라
	</div>
		<div class="task-content">
		<div class="task-content-check">
			<input type="checkbox">
		</div>
 	일라일라일라
	</div>
	
</div>
</section>
 -->