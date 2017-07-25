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

<link rel="stylesheet" type="text/css"

	href="resources/dist/css/taskList.css">


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
				/* $(this).parent().parent("#panel").find().val(""); */
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
		
		
	/* 	//datepicker
		$(document).on("click","#calendar",function(){        
            
            $(this).parent(".form-btn").find(".datepicker").removeClass('hasDatepicker').datepicker({                        
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'                       
                }).datepicker("show");
        });
 		 */
 		 
 		 
 		$("#detailStart").datepicker({
 				 dateFormat: 'yy/mm/dd'    
 			});
 	
 		
 		$("#detailEnd").datepicker({
 				 dateFormat: 'yy/mm/dd'    
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
		    	   detailExplain=data.detail.description;
		    		   
		    	   document.getElementById('span1').innerHTML=datailTitle;
		     	   document.getElementById('Modalenrolldate').innerHTML=datailEnrolldate;
		    	    
		    	   if(modalCount == 0){
		    		$('#detailStart').val(data.detail.start_date);
		    		$('#detailEnd').val(data.detail.end_date);
		    		$('#member').val(data.detail.member);
		    		$('#follower22').val(data.detail.follower);
		    		$('#modalTask').val(data.detail.datailTitle);
		    		$('#modalDetailExplain').val(data.detail.description);
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

	 	//멤버배정 후보 리스트
	 	$.ajax({
		    type : "get",
		    url : "taskMemberCheck.htm?project_id="+detailpid+"&task_id="+view,
		    		
		    success : function(data) {
		 		console.log("data:    " + data);
		 		
		 		$.each(data.assignmember,function(index,value){
						console.log(index + "/" + value);
						strlist+="<input type='checkbox' value='"+value+"' name='taskMemberChk' >&nbsp&nbsp&nbsp&nbsp"+value + "<br>";
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
		    	   $("#CheckContents").val('');
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
						strlist+="<input type='checkbox' value='"+value+"' name='taskMemberChk' >&nbsp&nbsp&nbsp&nbsp"+value+ "<br>";
						
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
	
	//데이터 초기화
	function dataErase(){
		$('#datepicker').val('');
	    $('#title').val('');
	    $('#project').val('');
	    $('#catechange').val('');
		
	}
	
	//토글이벤트
	function taskAdd(number)
	{
		$("#task_add_"+number).parent(".tasklist").find("#panel").toggle();	
	}
	
	
	
	function deleteBtn(number)
	{
		$.ajax({
			type:"get",
			url:"deleteTaskList.htm",
			data : "cateId="+number, 
			success:function(data){
				$("#View").empty();
				$("#View").append(data); 		
				},
			error:function(){
				alert('Error while request..');
			}
	});
		
		
	}
	
	
	function createBtn(number)
	{
		
	var title = $("#task-content_"+number).val();
		
		
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
	
	
	/* 
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
	
	//상세보기 수정
	function detailModalUpdateDialog()
	{
		dialogPopup("업무를 수정하시겠습니까?", detailModalUpdateDialogY, detailModalUpdateDialogN);
	}

	//상세보기 수정 yes
	function detailModalUpdateDialogY()
	{
		detailUpdate();

	}
	//상세보기 수정 no
	function detailModalUpdateDialogN()
	{
	
		dataErase();
		return;
	}
	
 */	
	
</script>
<!--  style="padding-left:20px;" -->
 <h3 class="page-title">Task Lists - <span class="fw-semi-bold">Individual Task</span></h3>
<div class="clearfix">
	<!-- <button type="button" class="btn btn-warning mb-xs" href="#add-modal" data-toggle="modal" style="margin-left: 15px">+ 업무리스트 추가</button> -->
	<div class="btn-toolbar pull-right" style="position:fixed;left:75%;">
		<button class="btn btn-inverse mb-xs" role="button" href="#add-modal"
			data-toggle="modal">
			<i class="fa fa-plus text-warning"></i> 업무리스트 추가
		</button>
		<button class="btn btn-inverse mb-xs" role="button"
         	href="#" onclick="ajaxView('analysisU.ajax')" data-toggle="modal">
         	<i class="glyphicon glyphicon-stats text-warning"></i> 차트
      	</button>
		<button class="btn btn-inverse mb-xs" role="button" id="file"
			onclick="ajaxView('calendar.ajax')">	<!-- onclick="location.href='Schedule.htm'"  -->
			<i class="fa fa-calendar text-warning"></i> 캘린더
		</button>
	</div>
</div>

<!--카테고리 title 수정 모달  -->

<div class="modal fade" id="cateTitle_Update">
	<div class="modal-dialog">
		<form>
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel18">카테고리 제목 수정</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						카테고리 제목
						<div class="form-control" id="select_cateTitle"
							style="margin-top: 5px"></div>
						<input type="hidden" id="sel_cateID">
					</div>



					카테고리 제목 수정

					<div class="form-group">
						<input type="text" class="form-control" id="changeTitle"
							placeholder="변경할 제목을 적어주세요">
					</div>




					<div class="form-group" style="text-align: right;">
						<button type="button" class="btn btn-secondary btn-sm"
							data-dismiss="modal" id="upclose">Cancel</button>
						<button type="button" class="btn btn-warning btn-sm"
							data-dismiss="modal" onclick="cateUpdate()">Finish</button>


					</div>
				</div>
			</div>
		</form>
	</div>
</div>

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


				<div class="form-group" style="text-align: right;">
					<!--   <button type="button" class="btn btn-primary">Save changes</button> -->

					<button type="button" class="btn btn-secondary btn-sm"
						data-dismiss="modal" id="ucancle">Cancel</button>
					<button type="button" class="btn btn-warning btn-sm"
						data-dismiss="modal" onclick="cateTitle_Add()">Finish</button>
				</div>
			</div>
		</div>

	</div>

</div>

<!-- /category title 모달 -->
	<jsp:include page="../task/detailModal.jsp"></jsp:include>
<div class="col-md-2"></div>

<div class="col-md-7"></div>

<br>

<div id="View" style="white-space: nowrap; width: 100000px"></div>
