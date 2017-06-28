<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--민성 추가부분  -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="resources/dist/css/taskList.css">
<!--/민성추가부분  -->


<!--민성 dropdown 사용하기위해 필요한 부분 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--민성 dropdown 사용하기위해 필요한 부분 -->



<script type="text/javascript">
var categoryId='';
var categoryTitle='';
var detailUpdateID='';

var detailStart='';
var detailEnd='';
var member='';
var detailExplain='';
var clickTask='';

var detailpid='';
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
/* 		
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
			 */	
		//카테고리 title 수정
		$("#cateUpdate").on("submit", function(e) {
			
			$.ajax({
				type : "post",
				url : "cateUpdate.htm",
				cache : false,
				data : 'category_id='+$("#categoryTitle option:selected").val()+'&changeTitle='+$("#changeTitle").val(),
				success : function(data){	
					$("#cateTitle_Update").hide();
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
					data : "cateId=" + $(this).parent(".tasklist").find(".cateValue").val(),
					success:function(data){
						$("#View").empty();
						$("#View").append(data); 		
						},
					error:function(){
						alert('Error while request..');
					}
				});
				
		  }); 
	
		//task title 완료체크
		
		 $(document).on("click",".chkSuccess",function(){
			
			if($(this).is(":checked")){
			
				$.ajax({
					type:"get",
					url:"tasktitleCheck.htm",
					data: "task_id="+$(this).val(),
					success:function(data){
									
						$("#View").empty();
						$("#View").append(data); 
					},
						error:function(){
							alert('Error while request..');
						}
				});
			
			}
		}); 
		

		$(document).on("click","#calendar",function(){        
            
            $(this).parent(".form-btn").find(".datepicker").removeClass('hasDatepicker').datepicker({                        
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'                       
                }).datepicker("show");
        });

 		
 		
 		$("#detailStart").datepicker({
 				 dateFormat: 'yy-mm-dd'    
 			});
 	

 		
 			$("#detailEnd").datepicker({
 				 dateFormat: 'yy-mm-dd'    
 			}); 
 		
 		
	});
	
	
	//업무 title 추가
	function createBtn(number)
	{
			
		var title = $("#task-content_"+number).val();
		//var cateTitle = $("#membername_"+number).text();
		
		$.ajax({
			type : "post",
			url : "tasktitleInsert.htm",
			cache : false,
			data : 'title='+title+'&cateId='+number,
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

function detailModalView(view,project_id){
	 	var str='';
	 	detailpid=project_id;
	 
		clickTask= view;
		$.ajax({
		       type : "get",
		       url : "detailtaskModal.htm?task_id="+view+"&project_id="+project_id,
		       success : function(data) {
		    	  console.log("detailmodal success: "+data.detail.user_id);
		    	   var datailTitle=data.detail.title;
		    	   var datailEnrolldate=data.detail.endrolldate;
		    	   console.log(data.detail.endrolldate);
		    	   detailUpdateID=data.detail.task_id;
		    	   detailStart=data.detail.start_date;
		    	   detailEnd=data.detail.end_date;
		    	   member=data.detail.member;
		    	   detailExplain=data.detail.explain;
		    		   
		    	   document.getElementById('span1').innerHTML=datailTitle;
		     	   document.getElementById('Modalenrolldate').innerHTML=datailEnrolldate;
		    	    
		    	   
		    		$('#detailStart').val(data.detail.start_date);
		    		$('#detailEnd').val(data.detail.end_date);
		    		$('#member').val(data.detail.member);
		    		$('#follower22').val(data.detail.follower);
		    		$('#modalTask').val(data.detail.datailTitle);
		    		$('#modalDetailExplain').val(data.detail.explain);
		    		
		    		console.log("assignment: " + assignmember.user_id);
		    		
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		    });
	 	
		    
		    $.ajax({
			       type : "get",
			       url : "detailAssign.htm?task_id="+view+"&project_id="+project_id,
			       success : function(data2) {
			    		
			    		$("#assignMemberCheck").append($('#assignMemberCheck').html(data2));
			       },
			       error : function() {
			          alert('Error while request..');
			       }	
			    });
		
	 	$.ajax({
		       type : "get",
		       url : "detailtaskModalCheckList.htm?task_id="+view,
		       success : function(data) {
		    		$("#checkListAjax").append($('#checkListAjax').html(data)); 
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		    });
	 	
	 	
	 	
	 	
	} 
	function detailUpdate(){
		var startdate=$('#detailStart').val();
		var enddate=$('#detailEnd').val();
	    var member=$('#member').val();
	/* 	var member="김민성" */
		var follower=$('#follower22').val();
		var explain=$('#modalDetailExplain').val();
		
		$.ajax({
		       type : "get",
		       url : "detailtaskUpdate.htm?task_id="+detailUpdateID+"&start="+startdate+"&end="+enddate+"&member="+member+"&follower="+follower+"&explain="+explain,
		       success : function(data) {
		    	    $("#detailModal").hide();
					$('.modal-backdrop').remove();
					$("#View").empty();
					$("#View").append(data); 
					
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		}); 
	}
	
	function checkreg(){
		var contents=$('#CheckContents').val();
		$.ajax({
		       type : "get",
		       url : "checklistReg.htm?task_id="+detailUpdateID+"&contents="+contents,
		       success : function(data) { 
		    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		}); 
		
	}
	
	function updateChkFlag(chk){
		$.ajax({
		       type : "get",
		       url : "updateChklistFlag.htm?task_id="+detailUpdateID+"&check_id="+chk,
		       success : function(data) { 
		    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		}); 
		
	}
	
	function updateChkFlag_zero(chk){
		console.log("updateChkFlag_zero : "+ detailUpdateID);
		$.ajax({
		       type : "get",
		       url : "updateChkFlag_Zero.htm?task_id="+detailUpdateID+"&check_id="+chk,
		       success : function(data) { 
		    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		}); 
		
	}
	
	
	function modalDeleteTask(){
		
		$.ajax({
		       type : "get",
		       url : "detailtaskDelete.htm?task_id="+detailUpdateID,
		       success : function(data) {
		    		$("#detailModal").hide();
					$('.modal-backdrop').remove();
					$("#View").empty();
					$("#View").append(data); 
					
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		}); 
		
	}
	
	
	
	function checkListDelete(chk){
		$.ajax({
		       type : "get",
		       url : "chkListDelete.htm?task_id="+detailUpdateID+"&check_id="+chk,
		       success : function(data) { 
		    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		});
	}
	
	
	function taskMemberListChk(){
		console.log("taskMemberListChk");
		console.log(detailpid);
		var strlist='';
		$.ajax({
		    type : "get",
		    url : "taskMemberListCheck1.htm?project_id="+detailpid,
		    success : function(data) {
		 		console.log("data:    " + data);
		 		
		 		$.each(data.assignmember,function(index,value){
						console.log(index + "/" + value.user_id);
						strlist+="<input type='checkbox' value='"+value.user_id+"' name='taskMemberChk' >&nbsp&nbsp&nbsp&nbsp"+value.user_id + "<br>";
						/* "+value.user_id+" */
						
				});
		 		var htm="<form name='memberChk'>"+strlist+"</form>";
		 		$("#wMemberList").append($('#wMemberList').html(htm));
		    },
		    error : function() {
		       alert('Error while request..');
		    }
		 });
	}
	
	
	function taskAssign(taskId){
		var checkboxValues = [];
	    $("input[name='taskMemberChk']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
	    console.log('들어오니');
	    $.ajax({
		       type : "get",
		       url : "TaskAssign.htm?checkboxValues="+checkboxValues+"&taskid="+clickTask,
		       success : function(data) {
		    	 /*   if(data.success.equals("success")){
		    	   		console.log('성공');
		    	   		location.reload();
		    	   } */
		    	   $("#taskAssignMember").hide();
		    	   detailModalView(clickTask,detailpid);
				   		    	  
		       },
		       error : function() {
		          alert('Error wh	ile request..');
		       }
		}); 
	}
	
	function cateTitle_Add(){
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
		
	}
	
	/* 배정된 멤버 삭제  */
	function deleteTaskMember(memberId){
		console.log('멤버삭제 들어가라');
		$.ajax({
			type:"get",
			url:"deleteAssignMember.htm?memberId="+memberId+"&taskId="+clickTask,
			success:function(data){
				console.log("멤버삭제 받는 사람: " +memberId)
				console.log("멤버삭제 보내는 사람: " + data.userid);
				console.log("멤버삭제 제목: " +datailTitle)
				
			   /*  if(data.check=="check"){
			    	send( '3', datailTitle, data, data.userid);
					window.location.reload()
			    } */
				 detailModalView(clickTask,detailpid);
			},
			error:function(){
				alert('error');
			}
		});	
	}
	
</script>


<div class="row">
	<div class="col-md-5"></div>
	<div class="col-md-2">
		<ul class="nav nav-tabs">
			<li><a href="Schedule.htm">캘린더</a></li>
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
			정보 수정<span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
			<li role="presentation" ><a role="menuitem" tabindex="-1"
				href="#cateTitle_Update" data-toggle="modal">카테고리제목   수정</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">업무제목   수정</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">필요시 추후 추가 예정</a></li>
			<li role="presentation" class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">필요시 추후 추가 예정</a></li>
		</ul>
	</div>
</div>
      
	<!--카테고리 title 수정 모달  -->
	  <form id="cateUpdate" name="cateUpdate" method="post">
	  <div class="modal fade" id="cateTitle_Update" >
         <div class="modal-dialog">
               <div class="modal-content">
                 <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title text-align-center fw-bold mt" id="myModalLabel18">카테고리 제목 수정</h4>
                         <p class="text-align-center fs-mini text-muted mt-sm">
                                           	원하시는 제목으로 수정이 가능합니다. 오타를 주의해주세요 ^_^
                                        </p>
                                    </div>
                                    <div class="modal-body bg-gray-lighter">
                                    
                                        <div class="row">
                                                &nbsp;<i class="fa fa-circle text-danger"></i> &nbsp; 수정할 카테고리 제목 선택
                                        		<div class="col-md-12">
                                                    <div class="form-group">
                                                   
                                                   
                                           			
                                           			<select id="categoryTitle">
                                           			<option selected>선택하기</option>
														<c:forEach items="${list}" var="n">
						 								<option value="${n.category_id}">${n.title}</option>		
														</c:forEach>
    		        								</select>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                            <div class="row">
                                                &nbsp;<i class="fa fa-circle text-warning"></i>&nbsp; 카테고리 제목 수정
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control input-no-border"
                                                        id="changeTitle" placeholder="변경할 제목을 적어주세요">
                                                    </div>
                                                </div>
                                            </div>
                                      
                                    </div>
                                    <div class="modal-footer">
                                         <button type="submit" class="btn btn-success" id="cateUpdate">Save changes</button>
                                        <button type="button" class="btn btn-gray" data-dismiss="modal">Close</button>
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                      </form>
                
	
	
	
	<!-- detail task modal  -->
	
	<div class="modal fade" id = "detailModal" role="dialog"  aria-hidden="true">
	<div class="modal-dialog modal-lg">
	     	 <div class="modal-content">
    <section class="widget">
        <header>
            <h4>
            	<%-- 
            	<input type="checkbox" id="modal_successF" class="modal_successF"  data-dismiss="modal"
            		<c:if test="${n.success_f eq 1}">
			             checked= "checked"
			             onclick="modalChangeSuccessF();"
			        </c:if> 
			        <c:if test="${n.success_f eq 0}">
			             onclick="modalChangeSuccessF_zero();"
			        </c:if>
            	>
            	 --%>
                <span class="fw-semi-bold" id="span1">
               
                </span> 
                <small><span id="Modalenrolldate"></span></small>
            </h4>
            <div class="widget-controls">
            	<span class="label label-danger fw-normal" id="modal_delete" style="cursor:pointer" data-dismiss="modal" onclick="modalDeleteTask();">delete</span>
            	&nbsp;&nbsp;&nbsp;&nbsp;
                <a data-widgster="close" title="Close" href="#"><i class="glyphicon glyphicon-remove" data-dismiss="modal"></i></a>
            </div>
        </header>
        <div class="widget-body">
            <form id="validation-form" class="form-horizontal form-label-left" method="post"
                  data-parsley-priority-enabled="false"
                  novalidate="novalidate">

                <fieldset>
                    <legend>
                        <!-- <span class="label label-warning  text-gray-dark mr-xs">
                            HTML5
                        </span> -->
                       
                    </legend>
                      
                        <div class="form-group row">
                        	<label class="control-label col-sm-3" for="number">
                                	상세 설명
                            </label>
                        	<div class="col-sm-9">
                        		<textarea rows="3" class="autogrow form-control transition-height" id="modalDetailExplain"
                             	                     placeholder="Try to add few new lines.."></textarea>
                        	</div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="number">
                                	시작일
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="detailStart" name="detailStart" class="form-control"
                                       data-parsley-type="number"
                                       required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="number">
                                	마감일
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="detailEnd" name="detailEnd" class="form-control"
                                       data-parsley-type="number"
                                       required="required">
                            </div>
                        </div>
                        
                  <div class="form-group row">
                            <div data-toggle="modal"
									data-target="#taskAssignMember" onclick="taskMemberListChk();">
                            <label class="control-label col-sm-3" for="range">
                                	배정된 멤버
                            </label>
                           </div>
                            <div class="col-sm-9">
                            
                            
                            <div
								class="select2-container select2-container-multi select2 form-control"
								id="s2id_multiple-select">
							
								
								<ul class="select2-choices">
									<div id="assignMemberCheck">
									
									 </div>
								</ul>
							</div>
                            <!-- 프로젝트 멤버 배정 모달  -->
                            <div class="modal fade" id="taskAssignMember"   aria-hidden="true" style="display: none;">
								<div class="modal-dialog">
						            <div class="modal-content">
						                <div class="modal-header">
						                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						                    <h4 class="modal-title text-xl-center fw-bold mt" id="myModalLabel18">프로젝트 멤버 배정</h4>
						                    <p class="text-xl-center text-muted mt-sm fs-mini">
						                        We need a bit of your detailed information to proceed. US ticketing system requires
						                        us to process and check your personal infromation before we can go.
						                    </p>
						                </div>
						                <div class="modal-body bg-gray-lighter">
						                    	
						                    <div id="wMemberList">
						                    
											</div>
						                    
						                </div>
						                <div class="modal-footer">
						                    <button type="button" class="btn btn-gray" id="taClose" aria-hidden="true" data-dismiss="modal">Close</button>
						                    <button type="button" id="submitbtn" class="btn btn-success" onclick="taskAssign(${n.task_id});">Assign</button>
						                </div>
						            </div>
						       </div>
							</div>
                            
                   
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="password">
                               		 팔로워
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="follower22" name="follower22" class="form-control mb-sm"
                                       data-parsley-trigger="change"
                                       data-parsley-minlength="6"
                                       required="required">
                            </div>
                        </div>
                        
                               <hr>        
                                       
                                       
                       <div class="form-group row">
                            <label class="control-label col-sm-3" for="password">
                               		 체크리스트
                            </label>
                            <div class="col-sm-8">
                                <input type="text" id="CheckContents" name="CheckContents" class="form-control mb-sm" style="width:635px"
                                       data-parsley-trigger="change"
                                       data-parsley-minlength="6"
                                       required="required">
                                       
                            </div>
                            <div class="col-sm-1">
                            	<button type="button" class="btn btn-warning" onclick="checkreg();"><i class="fa fa-plus" 
                            	style="margin-left: 5px;margin-top: 5px;margin-right: 2px;"></i></button>
                            </div>
                        </div>  
                    
                        <div id="checkListAjax">
                        
                        </div>
                   
                </fieldset>

                <div class="form-actions">
                	<div class="row">
                		<div class="col-sm-10">
                    		<button style="margin-left:20px" type="button" class="btn btn-secondary btn-rounded" data-dismiss="modal">Cancel</button>
                    	</div>
                    	<div class="col-sm-2">
                    		<button style="margin-left:20px" type="button" class="btn btn-success" data-dismiss="modal" onclick="detailUpdate();">Submit</button>
                		</div>
                	</div>
                </div>
            </form>
        </div>
    </section>
</div>
</div>
</div>
	
	<!--/detail task modal  -->
	
	<!-- category title 모달  -->
	
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
							<button type="button" class="btn btn-info btn-circle btn-lg"  data-dismiss="modal"
							 onclick="cateTitle_Add()">
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
	
	<!-- /category title 모달 -->
	<div class="col-md-2">

	</div>

	<div class="col-md-7"></div>

	<div class="col-md-2" align="right">
		<button type="button" class="btn btn-default" data-toggle="modal"
			data-target="#add-modal" data-dismiss="modal">업무리스트 추가</button>

	</div>




	
<br>
 


<div id="View">

</div>

