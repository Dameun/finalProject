<%--
	@File name : taskList.jsp
	@Project : ZestWorld
	@Author : 김민성
	@Data : 2017.07.01
	@Desc : 프로젝트 메인 -> 업무리스트 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="resources/dist/css/taskList.css">


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
var modalCount=0;
var task_num=''; 
var click_btn='';
var task_dnum='';
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
			
		
		$(".close").click(function() {
			$('.modal-backdrop').hide();
		});

		
		//취소 눌렀을 때 토글 닫히게	 
			$(document).on("click","#cancleBtn",function(){
				$(this).parent().parent("#panel").toggle();

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
		
		//datepicker
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
 		
 		
 			$("#upclose").click(function(){
 				$("#changeTitle").val('');
 			});
	
	});
	


	 //카테고리 타이틀 수정
	 function cateTitleView(cateId){
	
		 
		 $.ajax({
				type : "get",
				url : "getcateTitle.htm",
				data : 'category_id='+cateId,
				success : function(data){
					
					var cateTitle= data.category.title;
					var cId = data.category.category_id;
			    	
					
					document.getElementById('select_cateTitle').innerHTML = cateTitle;
					$("#sel_cateID").val(cId);
						
				},
				error : function(){
					alert('Error while request..');
				}
		   });
	}
	
	
	
	
	
	//상세업무 페이지 modal
	function detailModalView(view,project_id){
	 	var str='';
	 	detailpid=project_id;
	 	var strlist='';
		clickTask= view;
		$.ajax({
		       type : "get",
		       url : "detailtaskModal.htm?task_id="+view+"&project_id="+project_id,
		       success : function(data) {

		    	  $("#CheckContents").val('');
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
		    	    
		    	   if(modalCount == 0){
		    		$('#detailStart').val(data.detail.start_date);
		    		$('#detailEnd').val(data.detail.end_date);
		    		$('#member').val(data.detail.member);
		    		$('#follower22').val(data.detail.follower);
		    		$('#modalTask').val(data.detail.datailTitle);
		    		$('#modalDetailExplain').val(data.detail.explain);
		    	   }
		    		
		    	  modalCount=0; 
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

	 	
	 	$.ajax({
		    type : "get",
		    url : "taskMemberCheck.htm?project_id="+detailpid+"&task_id="+view,
		    		
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
	
	
	//상세업무 수정
	function detailUpdate(){
		var startdate=$('#detailStart').val();
		var enddate=$('#detailEnd').val();
	    var member=$('#member').val();
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
	
	//체크리스트 등록
	function checkreg(){
		var contents=$('#CheckContents').val();
		if(contents!="" && contents!=null){
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
	}
	
	//체크리스트 완료여부
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
	
	//업무삭제
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
	
	
	//체크리스트 삭제
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
	
	//체크리스트 확인
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
						
						
				});
		 		
		 		var htm="<form name='memberChk'>"+strlist+"</form>";
		 		$("#wMemberList").append($('#wMemberList').html(htm));
		    },
		    error : function() {
		       alert('Error while request..');
		    }
		 });
	}
	
	//배정된 멤버 등록
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
		    	
		    	   $("#taskAssignMember").hide();
		    	   $('#taskAssignMember .modal-backdrop').remove();
		    	   modalCount=1;
		    	   detailModalView(clickTask,detailpid);

		       },
		       error : function() {
		          alert('Error wh	ile request..');
		       }
		}); 
	}
	
	//카테고리 타이틀 추가
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
				$('#title').val('');
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
				console.log("멤버삭제 받는 사람: " +memberId);
				console.log("멤버삭제 보내는 사람: " + data.userid);
			
				
			   /*  if(data.check=="check"){
			    	send( '3', datailTitle, data, data.userid);
					window.location.reload()
			    } */
			     modalCount=1;
				 detailModalView(clickTask,detailpid);
			},
			error:function(){
				alert('error');
			}
		});	
	}
	
	
	//카테고리 타이틀 수정
	function cateUpdate(){
				
		$.ajax({
			type : "post",
			url : "cateUpdate.htm",
			cache : false,
			data : 'category_id='+$("#sel_cateID").val()+'&changeTitle='+$("#changeTitle").val(),
			success : function(data){
				console.log(data);
			
				$("#cateTitle_Update").hide();
				$('#changeTitle').val('');
				
				$('.modal-backdrop').remove();
				
				$("#View").empty();
				$("#View").append(data); 
			},
			error : function() {
				alert('Error while request..');
			}
		});
	}
	
	//토글이벤트
	function taskAdd(number)
	{
		$("#task_add_"+number).parent(".tasklist").find("#panel").toggle();	
	}
	
	function yes()
	{
		var title = $("#task-content_"+task_num).val();
		
		
		$.ajax({
			type : "post",
			url : "tasktitleInsert.htm",
			cache : false,
			data : 'title='+title+'&cateId='+task_num,
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
	
	function no()
	{
			
			$(click_btn).parent().parent("#panel").toggle();
			
			$("#task-content_number_"+task_num).val("");
			 
	
		
	}
	
	//업무 생성 
	function createBtn(number,btn) 
	{
		
		dialogPopup("업무를 생성하시겠습니까?", yes, no);
		task_num = number;
		click_btn = btn;
		
	}	
	
	//카테고리 삭제
	function deleteBtn(number)
	{
		
		dialogPopup("카테고리를 삭제하시겠습니까?", dYes, dNo);
		task_dnum = number;
	
	}
	
	function dYes()
	{
		
		$.ajax({
					type:"get",
					url:"deleteTaskList.htm",
					data : "cateId="+task_dnum, 
					success:function(data){
						$("#View").empty();
						$("#View").append(data); 		
						},
					error:function(){
						alert('Error while request..');
					}
			});
				
		 
	}
	
	function dNo()
	{
			
	}
	
	
	
	
</script>

<div class="row" style="padding-left:20px;">
      <!-- <button type="button" class="btn btn-warning mb-xs" href="#add-modal" data-toggle="modal" style="margin-left: 15px">+ 업무리스트 추가</button> -->
	<div class="btn-toolbar pull-left">
		<button class="btn btn-inverse mb-xs" role="button" href="#add-modal"data-toggle="modal">
                                <i class="fa fa-plus text-warning"></i>
                               업무리스트 추가
                            </button>
		<button class="btn btn-inverse mb-xs" role="button" id="file" onclick="location.href='Schedule.htm'">
		<i class="fa fa-calendar text-warning"></i>
		캘린더</button>
</div> 
</div>
      
	<!--카테고리 title 수정 모달  -->

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
                                                &nbsp;<i class="fa fa-circle text-danger"></i> &nbsp; 이전 카테고리 제목 
                                        		<div class="col-md-12">
                                                    <div class="form-group" id="select_cateTitle" style="margin-left: 13px; margin-top: 5px">
                                                  
                                                  		
                                                    </div>
                                                      <input type="hidden" id="sel_cateID">
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
                                         <button type="button" class="btn btn-success" data-dismiss="modal" onclick="cateUpdate()">Save changes</button>
                                        <button type="button" class="btn btn-gray" data-dismiss="modal" id="upclose">Close</button>
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                
                
	
	
	
	<!-- detail task modal  -->
	
	<div class="modal fade" id = "detailModal" role="dialog"  aria-hidden="true">
	<div class="modal-dialog modal-lg">
	     	 <div class="modal-content">
    <section class="widget">
        <header>
            <h4>
            	
                <span class="fw-semi-bold" id="span1">
               
                </span>&nbsp;&nbsp; 
                <span class="label label-danger fw-normal" id="modal_delete" style="cursor:pointer" data-dismiss="modal" onclick="modalDeleteTask();">delete</span>
                <small><span id="Modalenrolldate"></span></small>
            </h4>
            <div class="widget-controls">
                <a data-widgster="close" title="Close" href="#"><i class="glyphicon glyphicon-remove" data-dismiss="modal"></i></a>
            </div>
        </header>
        <div class="widget-body">
            <form id="validation-form" class="form-horizontal form-label-left" method="post"
                  data-parsley-priority-enabled="false"
                  novalidate="novalidate">

                <fieldset>
                    <legend>
                     
                       
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
                            <div>
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
							<br>
							<div id="wMemberList" style="background-color:#EAEAEA">
						                    
							</div>
							 <button type="button" style="margin-left: 568px"class="btn btn-success" onclick="taskAssign(${n.task_id});">Assign</button>
                            
						
                   
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
						<div class="form-group">
							<input class="form-control" type="text" id="title" name="title"
								placeholder="업무리스트 이름">
						</div>
						
					
							<div class="form-group" style="text-align:right;">
							<!--   <button type="button" class="btn btn-primary">Save changes</button> -->
							
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal" id="ucancle">
								Cancel
							</button>
							<button type="button" class="btn btn-warning btn-sm"  data-dismiss="modal"
							 onclick="cateTitle_Add()">
								Finish
							</button>
						</div>
						</div>
					</div>

				</div>

			</div>
	
	<!-- /category title 모달 -->
	<div class="col-md-2">

	</div>

	<div class="col-md-7"></div>
	
<br>
 


<div id="View" style="white-space:nowrap;width:100000px">

</div>

