<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     <!--민성 추가부분  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="resource/dist/css/taskList.css" rel="stylesheet" type="text/css"/>
		<!--/민성추가부분  -->

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	 
	
	$(function(){

		
		
		//리스트 비동기로 뿌리는 ajax부분
		$.ajax({
			type:"get",
			url:"taskLists.htm",
			dataType:'html',
			success:function(data){
				console.log("리스트뿌리기 성공?");
			$("#View").append(data); 		
			},
			error:function(){
				alert('Error while request..');
			}
		});
		
		//category insert ajax부분
		
		$("#add_taskTitle").on("submit", function(e) {

			$.ajax({
				type : "post",
				url : "titleInsert.htm",
				cache : false,
				data : 'title=' + $("#title").val(),
				success : function(data) {
					console.log("insert 성공^^");	
					$("#add-modal").hide();
					$('.modal-backdrop').remove();
					$("#View").empty();
					$("#View").append(data); 
					
				},
				error : function() {
					alert('Error while request..');
				}
			});
			e.preventDefault();
		});
		
		$(".close").click(function() {
			$('.modal-backdrop').hide();
		});


		//토글 보이게
		  	$(document).on("click",".task_add",function(){
			 	$(this).parent(".tasklist").find("#panel").toggle();
					
			});
		
		//취소 눌렀을 때 토글 닫히게	 
			$(document).on("click","#cancleBtn",function(){
				$(this).parent().parent("#panel").toggle();

			})
		  
	  //카테고리 삭제
		  $(document).on("click","#task_menu",function(){
			 
			  $.ajax({
					type:"get",
					url:"deleteTaskList.htm",
					data : "title=" + $(this).parent(".tasklist").find(".membername").text(),
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
	
	//업무 title 추가
	function createBtn(number)
	{
			
		var title = $("#task-content_"+number).val();
		var cateTitle = $("#membername_"+number).text();
		$.ajax({
			type : "post",
			url : "tasktitleInsert.htm",
			cache : false,
			data : 'title='+title+'&cateTitle='+cateTitle,
			
			success : function(data) {
				console.log("taskinsert 성공^^");				
				$("#View").empty();
				$("#View").append(data); 	
			},
			error : function() {
				alert('실패');
			}
		});

	}

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
							<button type="submit" class="btn btn-info btn-circle btn-lg"
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
