<%--
	@Project : ZestWorld
	@File name : totalTaskList.jsp
	@Author : 최담은
	@Data : 2017.07.01
	@Desc : 전체개요 -> 기본 페이지(필터 선택)
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="resources/dist/css/ContestBoardView.css">
<script type="text/javascript">
var categoryId='';
var categoryTitle='';
var detailUpdateID='';

var detailStart='';
var detailEnd='';
var member='';
var detailExplain='';
var clickTask='';
var datailTitle='';
var detailpid='';
var paging=1;
var assignFollower='';
var modalCount=0;
var success_f_dialog=0;
$(document).ready(function(){
	var forme='';
	var writer='';
	var follower='';
	var success='';
	var writermember='';
	var datefilter='';
	var order='';
	var p=500000;
	$.ajax({
		type:"get",
		url:"taskTotalList.htm?forme="+forme+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order+"&project_id="+p+"&paging=1",
		
		success:function(data){
			
			$("#ajaxlist").append($('#ajaxlist').html(data)); 		
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
	});
/* 	
	 $(this).removeClass('hasDatepicker').datepicker();
	 $( "#datepicker" ).datepicker({ dateFormat: 'yy/mm/dd' });
	 */
	  
	 
	$("#detailEnd").datepicker({ dateFormat: 'yy/mm/dd' });
    $("#detailStart" ).datepicker({ dateFormat: 'yy/mm/dd'});
	 
}); 

//리스트 새로고침
function refresh(){
	
	var forme='';
	var writer='';
	var follower='';
	var success='';
	var writermember='';
	var datefilter='';
	var order='';
	var p=500000;
	$.ajax({
		type:"get",
		url:"taskTotalList.htm?forme="+forme+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order+"&project_id="+p+"&paging=1",
	
		success:function(data){
			$("#ajaxlist").append($('#ajaxlist').html(data)); 		
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
	});
	
	/*  $(this).removeClass('hasDatepicker').datepicker();
	 $( "#datepicker" ).datepicker({ dateFormat: 'yy/mm/dd' });  */
}

//업무완료 
function changeSuccessF(taskid){
	console.log("hidden :   "+ $('#hiddenFollower').val());
	console.log("hiddenUserId :   "+ $('#hiddenUserId').val());
	
	 $.ajax({
			type:"get",
			url:"updateFlag.htm?task_id="+taskid,
			dataType:'html',
			success:function(data){
				send('1','title',$('#hiddenFollower').val(), $('#hiddenUserId').val());
				$("#ajaxlist").append($('#ajaxlist').html(data)); 
				refresh();
			},
			error:function(){
				alert('검색 에러! 관리자에게 문의하세요');
			}
		});
}

//업무완료 취소
function changeSuccessF_zero(taskid){
	 $.ajax({
			type:"get",
			url:"updateFlagZero.htm?task_id="+taskid,
			dataType:'html',
			success:function(data){
				$("input:checkbox[id='complete']").attr("checked", false);
				$("#ajaxlist").append($('#ajaxlist').html(data)); 	
				refresh();
			},
			error:function(){
				alert('검색 에러! 관리자에게 문의하세요');
			}
		});
}

//업무완료취소 여부 확인 dialog
function modalSuccessUpdateDialog(task_id)
{
	success_f_dialog=task_id;
	dialogPopup("업무 완료를 취소 하시겠습니까?", modalSuccessUpdateDialogY, modalSuccessUpdateDialogN);
}

//업무완료취소 여부 확인 dialog-Y
function modalSuccessUpdateDialogY()
{
	changeSuccessF_zero(success_f_dialog);
}
//업무완료취소 여부 확인 dialog-N
function modalSuccessUpdateDialogN()
{
	$("input:checkbox[id="+success_f_dialog+"]").attr("checked", true);
	return;
}

//업무완료 여부 확인 dialog
function modalSuccess_kUpdateDialog(task_id)
{
	success_f_dialog=task_id;
	dialogPopup("업무를 완료하셨습니까?", modalSuccess_kUpdateDialogY, modalSuccess_kUpdateDialogN);
}

//업무완료 여부 확인 dialog-Y
function modalSuccess_kUpdateDialogY()
{
	changeSuccessF(success_f_dialog);
 	
}

//업무완료 여부 확인 dialog-N
function modalSuccess_kUpdateDialogN()
{
	return;
}

//필터 처리
function myfilter(paging,flag){
	var forme='';
	var writer='';
	var follower='';
	var writermember='';
	var success='';
	var datefilter='';
	var order='';
	var project=500000;;
	var resultPaging=0;
	
	if(flag==0){
		resultPaging=paging-1;
	}else if(flag==1){
		resultPaging=paging+1;
	}else{
		resultPaging=1;
	}

	 //나에게 배정된, 내가 작성한, 내가 팔로워하는..  필터
	 if(document.getElementById("forme").checked == true){
		 forme="assign";
	 }else{
		 forme="";
		 console.log("forme check해제");
	 }
	 
	 if(document.getElementById("follower").checked == true){
		 follower="check";
	 }else {
		 follower='';
	 }
	 
	 if(document.getElementById("complete").checked == true){
		 console.log("complete check됨ㅌㅌㅌㅌㅌㅌㅌ");
		 success="complete";
	 }else {
		 ing='';
	 }
	 
	 //작성자 필터
	 writermember=$(":input:radio[name=writermember]:checked").val();	 
	 project=$(":input:radio[name=projectlist]:checked").val();
	 
	 
	 //기간 필터
	 datefilter=$("#dayfilter").val(); 
	 console.log("datefilter: " + datefilter);
	 
	 order=$("#select_order").val(); 
	 
		$.ajax({
			type:"get",
			url:"taskTotalList.htm?forme="+forme+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order+"&project_id="+project+"&paging="+resultPaging,
			dataType:'html',
			success:function(data){
			
				$("#ajaxlist").append($('#ajaxlist').html(data)); 		
			},
			error:function(){
				alert('검색 에러! 관리자에게 문의하세요');
			}
		});
}

//상세보기 모달
function detailModalView(view,project_id){
 	var str='';
 	detailpid=project_id;
	var strlist='';
	clickTask= view;
	$.ajax({
	       type : "get",
	       url : "detailModal.htm?task_id="+view+"&project_id="+project_id,
	       success : function(data) {
	    	  console.log("detailmodal success: "+data.detail.user_id);
	    	   datailTitle=data.detail.title;
	    	   var datailEnrolldate=data.detail.endrolldate;
	    	   console.log("dasdasdasdasd: " +datailEnrolldate);
	    	   console.log(data.detail.endrolldate);
	    	   detailUpdateID=data.detail.task_id;
	    	   detailStart=data.detail.start_date;
	    	   detailEnd=data.detail.end_date;
	    	   member=data.detail.member;
	    	   detailExplain=data.detail.description;
	    		   
	    	   document.getElementById('span1').innerHTML=datailTitle;
	     	   document.getElementById('Modalenrolldate').innerHTML=datailEnrolldate;
	    	    
	     	   assignFollower=data.detail.follower;
	     	   if(modalCount==0){
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
 	
	    
	 //멤버 배정
	 $.ajax({
		       type : "get",
		       url : "detailModalAssign.htm?task_id="+view+"&project_id="+project_id,
		       success : function(data2) {
		    		
		    		$("#assignMemberCheck").append($('#assignMemberCheck').html(data2));
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		    });
	
	//체크리스트
 	$.ajax({
	       type : "get",
	       url : "detailModalCheckList.htm?task_id="+view,
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
	    url : "taskMemberListChk1.htm?project_id="+detailpid+"&task_id="+view,
	    		
	    success : function(data) {
	 		console.log("data:    " + data);
	 		
	 		$.each(data.assignmember,function(index,value){
					console.log(index + "/" + value.user_id);
					strlist+="<input type='checkbox' value='"+value+"' name='taskMemberChk' >&nbsp&nbsp&nbsp&nbsp"+value+ "<br>";
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

//업무 추가
function taskReg(){

		var enddate = $("#datepicker").val();
		title=$("#title").val();
		var project_id= $('#project').val();
	 	console.log(title); 
	 	
		if(title==""){
			alert('제목을 입력해주세요');
			$('#add-modal').modal('show');
			return;
		}
	 	if(project_id=="before"){
			alert('프로젝트 선택');
			return;
		}
		if(categoryId=="cateBefore"){
			alert('카테고리 선택');
			return;
		}
		
		$.ajax({
		       type : "get",
		       url : "taskInsert.htm?title="+title+"&categoryId="+categoryId+"&enddate="+enddate+"&project_id="+project_id,
		    
		       success : function(data) {
	
		    	 $("#ajaxlist").empty();
		    	 $("#ajaxlist").append($('#ajaxlist').html(data));               
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		    });
			console.log("check");
		    $('#datepicker').val('');
		    $('#title').val('');
		    $('#project').val('');
		    $('#catechange').val('');
}

//프로젝트 선택
function projectchange(){

	projectId=$("#project").val();
	/* categoryTitle=$("#title").val(); */
	if(projectId!=""){
		console.log("ProjectID: 0");
	 	 $.ajax({
		       type : "get",
		       url : "categoryFilterList.htm?projectId="+projectId,
		       success : function(data) {
		    	   $("#categoryList").append($('#categoryList').html(data)); 
		    	 
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		    });
	}else{
		console.log("ProjectID: 1");
	}
}

//상세보기에서 프로젝트 선택
function projectchange2(){

	projectId=$("#project2").val();
	/* categoryTitle=$("#title").val(); */
	if(projectId!=""){
		console.log("ProjectID: 0");
	 	 $.ajax({
		       type : "get",
		       url : "categoryFilterList.htm?projectId="+projectId,
		       success : function(data) {
		    	   console.log(data);
		    	   $("#categoryListModal").append($('#categoryListModal').html(data)); 
		       },
		       error : function() {
		          alert('Error while request..');
		       }
		    });
	}else{
		console.log("ProjectID: 1");
	}
}

//카테고리 선택
function categorychange(){
	
	categoryId=$("#catechange").val();
	console.log(categoryId);
}

//상세보기 모달에서 수정
function detailUpdate(){
	var checkboxValues = [];
    $("input[name='membercheck']:checked").each(function(i) {
        checkboxValues.push($(this).val());
    });
    console.log("checkboxValues : "+ checkboxValues[0]);
	var startdate=$('#detailStart').val();
	var enddate=$('#detailEnd').val();
	var member=$('#member').val();
	var follower=$('#follower22').val();
	var explain=$('#modalDetailExplain').val();
	
	$.ajax({
	       type : "get",
	       url : "detailUpdate.htm?task_id="+detailUpdateID+"&start="+startdate+"&end="+enddate+"&follower="+follower+"&explain="+explain+"&chkmember="+checkboxValues,
	       success : function(data) {
	    	   console.log('성공');
	    	   refresh();
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	}); 
	
}

//업무 삭제
function modalDeleteTask(){
	
	$.ajax({
	       type : "get",
	       url : "detailDelete.htm?task_id="+detailUpdateID,
	       success : function(data) {
	    		$("#ajaxlist").append($('#ajaxlist').html(data)); 
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	}); 
	
}


//체크리스트 추가
function checkreg(){
	var contents=$('#CheckContents').val();
	console.log("cheecj: " + contents);
	$.ajax({
	       type : "get",
	       url : "checkListReg.htm?task_id="+detailUpdateID+"&contents="+contents,
	       success : function(data) { 
	    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
	    	   $("#CheckContents").val('');
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	}); 
	
}

//체크리스트 완료
function updateChkFlag(chk){
	console.log("updateChkFlag : "+ detailUpdateID);
	$.ajax({
	       type : "get",
	       url : "updateChkFlag.htm?task_id="+detailUpdateID+"&check_id="+chk,
	       success : function(data) { 
	    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	}); 
	
}

//체크리스트 완료취소
function updateChkFlag_zero(chk){
	console.log("updateChkFlag_zero : "+ detailUpdateID);
	$.ajax({
	       type : "get",
	       url : "updateChkFlagZero.htm?task_id="+detailUpdateID+"&check_id="+chk,
	       success : function(data) { 
	    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
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
	       url : "checkListDelete.htm?task_id="+detailUpdateID+"&check_id="+chk,
	       success : function(data) { 
	    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	});
}

//업무 배정
function taskAssign(taskId){
	var checkboxValues = [];
    $("input[name='taskMemberChk']:checked").each(function(i) {
        checkboxValues.push($(this).val());
    });
    console.log('들어오니');
    console.log('들어오니:::: '+ datailTitle);
    $.ajax({
	       type : "get",
	       url : "taskAssign.htm?checkboxValues="+checkboxValues+"&taskid="+clickTask+"&follower="+follower,
	       success : function(data) {
	    	
	    		   //send( '0', title,'dbsl215@naver.com', 'yh215@naver.com');
	    		   console.log('추가성공되라  보내는사람 :::::   '+assignFollower);
	    		   for(var i=0;i<checkboxValues.length;i++){
	    			   console.log('추가성공되라:::::   '+checkboxValues[i]);
	    			   
	    			   send( '0', datailTitle,checkboxValues[i], assignFollower);
	    		   }
	    		   modalCount=1;
	    		   $('#taskAssignMember').hide();
	    		   detailModalView(clickTask,detailpid);
	    		  
	    	   
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

//배정된 멤버 삭제
function deleteTaskMember(memberId){
	console.log('멤버삭제 들어가라');
	$.ajax({
		type:"get",
		url:"deleteTaskMember.htm?memberId="+memberId+"&taskId="+clickTask,
		success:function(data){
			console.log("멤버삭제 받는 사람: " +memberId)
			console.log("멤버삭제 보내는 사람: " + data.userid);
			console.log("멤버삭제 제목: " +datailTitle)

		    modalCount=1;
			 detailModalView(clickTask,detailpid);
		},
		error:function(){
			alert('error');
		}
	});	
}

//업무 추가
function taskInsertDialog()
{
	dialogPopup("업무를 추가하시겠습니까?", yes, no);
}

//업무추가 yes
function yes()
{
	
	taskReg();
}
//업무 추가 no
function no()
{
	dataErase();
	return;
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

</script>


<style>
#nav {
	width: 100%;
	float: left;
	margin: 0 0 1em 0;
	padding: 0;
	background-color: #f2f2f2;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
}

#nav ul {
	list-style: none;
	width: 800px;
	margin: 0 auto;
	padding: 0;
}

#nav li {
	float: left;
}

#nav li a {
	display: block;
	padding: 8px 15px;
	text-decoration: none;
	font-weight: bold;
	color: #069;
	border-right: 1px solid #ccc;
}

#nav li:first-child a {
	border-left: 1px solid #ccc;
}

#nav li a:hover {
	color: #c00;
	background-color: #fff;
}
</style>


<!-- <div id="filter" style=" width: 880px"> -->
	 <h3>Total Task - <span class="fw-semi-bold">Project</span></h3>
		<div class="clearfix">
		<div class="btn-toolbar pull-right">
		<button type="role" class="btn btn-inverse mb-xs" data-toggle="modal"
	         data-target="#add-modal">
	         <i class="fa fa-plus text-warning"></i>
	           업무 추가</button>
		</div>
		</div>
		<div class="row">
		
	
	<div class="col-sm-2" style="background-color: #ffffff; height: auto;">

	      
	<div class="form-group">
	    <br>
	정렬<br>
		<select id="select_order" onchange="myfilter();" style="width:85px;">
	            <option value="">최신순</option>
	            <option value="end">마감순</option>
	        </select> 
</div>
<hr>
<div class="form-group">		
기간<br> 
		<select id="dayfilter" onChange="myfilter();">
			<option value="">전체</option>
			<option value="30">최근 30일</option>
			<option value="60">최근 60일</option>
		</select>
</div>

<hr>
<div class="form-group">
	
		빠른필터<br>
		<input type="hidden" id="forme" name="filter" value="for" onclick="myfilter();">
		
		<input type="checkbox" id="follower" name="filter" value="${n.user_id}" onclick="myfilter();">내가 팔로우하는 업무<br>
		</div>
		
		
		<hr>
		<div class="form-group">
		 프로젝트<br>
			<input type="radio" name="projectlist" onclick="myfilter();" value="500000" checked>전체<br>
		<c:forEach items="${projectlist}"  var="n">
			<input type="radio" name="projectlist" value="${n.project_id}" onclick="myfilter();">${n.p_title}<br>
		</c:forEach> 
		</div>
		<hr>
		<div class="form-group">
		Essence 프로젝트<br>
		
		<c:forEach items="${essencelist}"  var="e">
			<input type="radio" name="projectlist" value="${e.project_id}" onclick="myfilter();">${e.p_title}<br>
		</c:forEach> 
		</div>
		<hr>
		<div class="form-group">
		작성자<br>
		<input type="radio" id="writermember2" name="writermember" onclick="myfilter();" value="" checked>전체<br>
		<c:forEach items="${assign}" var="n" >
			<input  type="radio" id="writermember" name="writermember" onclick="myfilter();" value="${n.user_id}">${n.user_id}<br>
		</c:forEach>
		</div>
		<hr>
		<div class="form-group">
		상태<br>
		<!-- 
		<input type="radio" id="all" name="success_f" onclick="myfilter();" value="" checked>전체<br>
		
		
		<input type="radio" id="ing"  name="success_f" onclick="myfilter();" value="" checked >진행중인 업무<br>-->
		<input type="checkbox" id="complete" name="success_f" onclick="myfilter();" value="" >마감 업무<br>

		</div>
		</div>
	<div class="col-sm-10" style="height: 500px">


			<div id="ajaxlist" style="margin-top:-30px;">
			</div>
	
	

         <!-- modal -->
         <form id="add_taskTitle" name="add_taskTitle" method="post" >
         <div class="modal fade" id="add-modal" style="display: none;">
            <div class="modal-dialog"style="width:30%;">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"  onclick="dataErase();"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                     <h4 class="modal-title" style="align: center">새 업무</h4>
                  </div>
                  <div class="modal-body">
                  <div class="form-group" style="float:left;">
                  
                     
                 <!--  <label for="">프로젝트 선택</label> -->
                 <div style="display:inline;">
                  <select id="project" onchange="projectchange();">
						<option value="before" selected disabled>프로젝트 선택  </option>
						<c:forEach items="${projectlist}" var="n">
						 	<option value="${n.project_id}">${n.p_title}</option>		
						</c:forEach>
    		        </select>
    		      	</div>
    		    
    		         <!-- 프로젝트 별 카테고리 리스트  -->
    		     <div id= "categoryList" style="display:inline;">
    		        
    		        </div>
    		        
                  </div>
                  <div class="form-group">
                     <input class="form-control" type="text" id="title" name="title"
                        placeholder="업무 제목" >

					</div>
					
    		        
    		       
                  <div class="form-group">
                  <!-- 마감일 선택 -->     
                 마감일: <input type="text" id="datepicker" class="form-control">
                 </div>
                  
				<div class="form-group"style="text-align:right;">
                     
                     <button type="button" class="btn btn-secondary btn-sm"
                        data-dismiss="modal" id="ucancle">
                        Cancel
                     </button>
                     <button type="button" class="btn btn-warning btn-sm"
                        id="addbtn" onclick="taskReg();"   data-dismiss="modal">
                        Finish
                     </button>
                    </div> 
                 
               </div>

            </div>

         </div>
     </div>
      </form>
      <!-- /modal  -->
	<!--<a class="glyphicon glyphicon-search"></a> -->

	         
      </div>

		<div id="container" data-activity-id="320">
	
			
		</div>
	</div>
	
	
	<jsp:include page="../task/detailModal.jsp"></jsp:include>





</div>