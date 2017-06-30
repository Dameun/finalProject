<%--
	@Project : ZestWorld
	@File name : detailModal.jsp
	@Author : 최담은
	@Data : 2017.6.28
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

$(document).ready(function(){
	var forme='';
	var writer='';
	var follower='';
	var success='';
	var writermember='';
	var datefilter='';
	var order='';
	var p=500000;
	//var paging=$('#paging').val();
	
	console.log('Paging:  ******'+paging);
	/* 
	url:"taskTotalList.htm?forme="+forme+"&writer="+writer+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order+"&project_id="+p, */
	$.ajax({
		type:"get",
		url:"taskTotalList.htm?forme="+forme+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order+"&project_id="+p+"&paging=1",
		/* dataType:'html', */
		success:function(data){
			$("#ajaxlist").append($('#ajaxlist').html(data)); 		
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
	});
	 $("#addbtn").on("click", function() {

	   // $("#add_taskTitle").submit();

	    $("#add-modal").hide();
	    $('.modal-backdrop').hide();

	 }); 
	 $(this).removeClass('hasDatepicker').datepicker();
	 $( "#datepicker" ).datepicker({ dateFormat: 'yy/mm/dd' });
	
	  
	 
}); 

function refresh(){
	
	var forme='';
	var writer='';
	var follower='';
	var success='';
	var writermember='';
	var datefilter='';
	var order='';
	var p=500000;
	//var paging=$('#paging').val();
	
	console.log('Paging:  ******'+paging);
	/* 
	url:"taskTotalList.htm?forme="+forme+"&writer="+writer+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order+"&project_id="+p, */
	$.ajax({
		type:"get",
		url:"taskTotalList.htm?forme="+forme+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order+"&project_id="+p+"&paging=1",
		/* dataType:'html', */
		success:function(data){
			$("#ajaxlist").append($('#ajaxlist').html(data)); 		
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
	});
	 $("#addbtn").on("click", function() {

	   // $("#add_taskTitle").submit();

	    $("#add-modal").hide();
	    $('.modal-backdrop').hide();

	 }); 
	 $(this).removeClass('hasDatepicker').datepicker();
	 $( "#datepicker" ).datepicker({ dateFormat: 'yy/mm/dd' });
	
	  
	 
}
function modalChangeSuccessF(taskid){
	$.ajax({
		type:"get",
		url:"updateFlag.htm?task_id="+taskid,
		dataType:'html',
		success:function(data){
		
			$("#ajaxlist").append($('#ajaxlist').html(data)); 		
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
	});
	
}
function modalChangeSuccessF_zero(taskid){
	$.ajax({
		type:"get",
		url:"updateFlagZero.htm?task_id="+taskid,
		dataType:'html',
		success:function(data){
			$("input:checkbox[id='complete']").attr("checked", false);
			$("#ajaxlist").append($('#ajaxlist').html(data)); 		
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
	});
	
}
function changeSuccessF(taskid){
	console.log("hidden :   "+ $('#hiddenFollower').val());
	console.log("hiddenUserId :   "+ $('#hiddenUserId').val());
	
	 /* alert(taskid); */
	 $.ajax({
			type:"get",
			url:"updateFlag.htm?task_id="+taskid,
			dataType:'html',
			success:function(data){
				/* console.log("성공시 보내는 사람 :     "+data.userId); */
				send('1','title',$('#hiddenFollower').val(), $('#hiddenUserId').val());
				$("#ajaxlist").append($('#ajaxlist').html(data)); 		
			},
			error:function(){
				alert('검색 에러! 관리자에게 문의하세요');
			}
		});
}
function changeSuccessF_zero(taskid){
	 alert(taskid);
	 $.ajax({
			type:"get",
			url:"updateFlagZero.htm?task_id="+taskid,
			dataType:'html',
			success:function(data){
				$("input:checkbox[id='complete']").attr("checked", false);
				$("#ajaxlist").append($('#ajaxlist').html(data)); 		
			},
			error:function(){
				alert('검색 에러! 관리자에게 문의하세요');
			}
		});
}
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
	
	
	console.log('resultPaging:  ******'+paging);
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
	    	   console.log(data.detail.endrolldate);
	    	   detailUpdateID=data.detail.task_id;
	    	   detailStart=data.detail.start_date;
	    	   detailEnd=data.detail.end_date;
	    	   member=data.detail.member;
	    	   detailExplain=data.detail.explain;
	    		   
	    	   document.getElementById('span1').innerHTML=datailTitle;
	     	   document.getElementById('Modalenrolldate').innerHTML=datailEnrolldate;
	    	    
	     	   assignFollower=data.detail.follower;
	     	   if(modalCount==0){
		    		$('#detailStart').val(data.detail.start_date);
		    		$('#detailEnd').val(data.detail.end_date);
		    		$('#member').val(data.detail.member);
		    		$('#follower22').val(data.detail.follower);
		    		$('#modalTask').val(data.detail.datailTitle);
		    		$('#modalDetailExplain').val(data.detail.explain);
	     	   }
	    	   modalCount=0;
	    		/* $.each(data.assignmember,function(index,value){
					console.log(index + "/" + value);
					str+="<input type='checkbox' id='"+data.assignmember.user_id+"'>"+assignmember.user_id + "<br>";
					$("#assignMemberCheck").append($('#assignMemberCheck').html(str));
					
					
				}); */
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	    });
 	
	    
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
function submit2(){
	    
		var enddate = $("#datepicker").val();
		title=$("#title").val();
		var project_id= $('#project').val();
	 	console.log(title); 
	 	/* if(title==""){
			alert('제목을 입력해주세요');
			$('#add-modal').modal('show');
			return;
			//return false; 
		}
	 	if(project_id=="before"){
			alert('프로젝트 선택');
			return;
			//return false; 
		}
		if(categoryId=="cateBefore"){
			alert('카테고리 선택');
			return;
			//return false; 
		} */
		 $.ajax({
		       type : "get",
		       url : "taskInsert.htm?title="+title+"&categoryId="+categoryId+"&enddate="+enddate+"&project_id="+project_id,
		    
		       success : function(data) {
		    	 /* alert(data);
		    	 if( data == 'success')
	    		{
	    		 	ajaxView('totalTask.ajax');
	    		 } */
	    		/*  send( '0', title,'dbsl215@naver.com', 'yh215@naver.com'); */
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

function categorychange(){
	
	categoryId=$("#catechange").val();
	console.log(categoryId);
}

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

function checkreg(){
	var contents=$('#CheckContents').val();
	console.log("cheecj: " + contents);
	$.ajax({
	       type : "get",
	       url : "checkListReg.htm?task_id="+detailUpdateID+"&contents="+contents,
	       success : function(data) { 
	    	   $("#checkListAjax").append($('#checkListAjax').html(data)); 
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	}); 
	
}

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


/*  function taskMemberListChk(){
	console.log("taskMemberListChk");
	console.log(detailpid);
	var strlist='';
	$.ajax({
	    type : "get",
	    url : "taskMemberListChk1.htm?project_id="+detailpid,
	    		
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
 */


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
function dataErase(){
	$('#datepicker').val('');
    $('#title').val('');
    $('#project').val('');
    $('#catechange').val('');
	
}
/* 배정된 멤버 삭제  */
function deleteTaskMember(memberId){
	console.log('멤버삭제 들어가라');
	$.ajax({
		type:"get",
		url:"deleteTaskMember.htm?memberId="+memberId+"&taskId="+clickTask,
		success:function(data){
			console.log("멤버삭제 받는 사람: " +memberId)
			console.log("멤버삭제 보내는 사람: " + data.userid);
			console.log("멤버삭제 제목: " +datailTitle)
			
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
//업무
function submitBtn() 
{
	return;
}
//yes클릭
function yes()
{
	submit2();
}
//no 클릭
function no()
{
	dataErase();
	return;
}

//업무 추가
function taskInsertDialog()
{
/* 	var enddate = $("#datepicker").val();
	title=$("#title").val();
	var project_id= $('#project').val();
 	console.log(title); 
 	if(title==""){
		alert('제목을 입력해주세요');
		$('#add-modal').modal('show');
		return;
		//return false; 
	}
 	if(project_id=="before"){
		alert('프로젝트 선택');
		return;
		//return false; 
	}
	if(categoryId=="cateBefore"){
		alert('카테고리 선택');
		return;
		//return false; 
	} */
	dialogPopup("업무를 추가하시겠습니까?", yes, no);
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


<div class="row">
	<div id="nav">
		<div class="col-sm-5"></div>
		<div class="col-sm-2">
			<!-- <nav> <span>
				<ul>
					<li class="active"><a href="#">업무</a></li>
					<li><a href="#">캘린더</a></li>
				</ul>
			</span> </nav> -->
		</div>
	</div>
	<div class="col-sm-5"></div>
</div>



<div class="row" >

	<div class="col-sm-2" style="background-color: #ffffff; height: 900px">
	<br>
	정렬<br>
			<select id="select_order" onchange="myfilter();">
	            <option value="">최신순</option>
	            <option value="end">마감순</option>
	            
	        </select>
	    <hr>
	<br>
		기간<br> 
		<select id="dayfilter" onChange="myfilter();">
			<option value="">전체</option>
			<option value="30">최근 30일</option>
			<option value="60">최근 60일</option>
		</select>

		<hr>
<!-- 		<br>
		<input type="radio" name="task" value="mytask">내업무
		<br>
		<input type="radio" name="task" value="alltask" checked="checked">전체업무
		<hr> -->
		<br>
		빠른필터<br>
		<input type="hidden" id="forme" name="filter" value="for" onclick="myfilter();"><br>
		<input type="checkbox" id="follower" name="filter" value="${n.user_id}" onclick="myfilter();">내가 팔로우하는 업무<br>
		<br><hr>
		 프로젝트<br>
			<input type="radio" name="projectlist" onclick="myfilter();" value="500000" checked>전체<br>
		<c:forEach items="${projectlist}"  var="n">
			<input type="radio" name="projectlist" value="${n.project_id}" onclick="myfilter();">${n.p_title}<br>
		</c:forEach> 
		
		<hr>
		작성자<br>
		<input type="radio" id="writermember2" name="writermember" onclick="myfilter();" value="" checked>전체<br>
		<c:forEach items="${assign}" var="n" >
			<input  type="radio" id="writermember" name="writermember" onclick="myfilter();" value="${n.user_id}">${n.user_id}<br>
		</c:forEach>
		<hr>
		상태<br>
		<!-- 
		<input type="radio" id="all" name="success_f" onclick="myfilter();" value="" checked>전체<br>
		
		
		<input type="radio" id="ing"  name="success_f" onclick="myfilter();" value="" checked >진행중인 업무<br>-->
		<input type="checkbox" id="complete" name="success_f" onclick="myfilter();" value="" >마감 업무<br>

		
		</div>
	<div class="col-sm-10" style="height: 500px">

	
	
	<div id="filter" style=" width: 880px">
	<div class="row" style="margin-left:30px">
		<div class="col-sm-11">
		<button type="button" class="btn btn-primary" data-toggle="modal"
	         data-target="#add-modal">+ 새업무</button>
	<!--          
	    <button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModal">
	   		<span class="glyphicon glyphicon-stats"></span> 
	         	차트보기
		</button> -->
		</div>
		
	</div>

         <!-- modal -->
         <form id="add_taskTitle" name="add_taskTitle" method="post">
         <div class="modal fade" id="add-modal" style="display: none;">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"  onclick="dataErase();"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                     <h4 class="modal-title" style="align: center">새 업무</h4>
                  </div>
                  <div class="modal-body">
                     <input class="form-control" type="text" id="title" name="title"
                        placeholder="업무 제목" >
                        
                     <%-- 
                     <c:forEach items="${projectlist}" var="n">
						<input type="radio" name="project" value="${n.p_title}">${n.p_title}<br>
					 </c:forEach>
 --%>

					<select id="project" onchange="projectchange();">
						<option value="before" selected="selected">  </option>
						<c:forEach items="${projectlist}" var="n">
						 	<option value="${n.project_id}">${n.p_title}</option>		
						</c:forEach>
    		        </select>
    		        
    		        <!-- 프로젝트 별 카테고리 리스트  -->
    		        <div id= "categoryList">
    		        
    		        </div>
                  
                  <!-- 마감일 선택 -->     
                  <p>마감일: <input type="text" id="datepicker"></p>
                  </div>
                  <div class="modal-footer">

                     <button type="button" class="btn btn-info btn-circle btn-lg"
                        id="addbtn" onclick="taskInsertDialog();"   data-dismiss="modal">
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
     
      </form>
      <!-- /modal  -->
	<!--<a class="glyphicon glyphicon-search"></a> -->

	         
      </div>
      <br><br>
		<div id="container" data-activity-id="320">
	
			<div class="row"></div>
			<div id="ajaxlist">
			</div>
		</div>
	</div>
	
	
	<jsp:include page="../task/detailModal.jsp"></jsp:include>





</div>