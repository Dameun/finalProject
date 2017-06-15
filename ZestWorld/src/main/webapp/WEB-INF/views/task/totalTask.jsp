<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <link rel="stylesheet" type="text/css" href="dist/css/ContestBoardView.css"> -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script type="text/javascript" src="Js/chartAll.js"></script>

<script type="text/javascript">
var categoryId='';
var categoryTitle='';

$(document).ready(function(){
	console.log("dsadasd:");
	var forme='';
	var writer='';
	var follower='';
	var success='';
	var writermember='';
	var datefilter='';
	var order='';
	
	$.ajax({
		type:"get",
		url:"taskTotalList.htm?forme="+forme+"&writer="+writer+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order,
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
	 
	 $( "#datepicker" ).datepicker();
	
	  
	 
}); 

/* $("#datepicker").datepicker({ onSelect: function(dateText){
	 enddate=dateText;
	 console.log("enddateeeee"+enddate);
   	}
}); */

function myfilter(){
	var forme='';
	var writer='';
	var follower='';
	var writermember='';
	var success='';
	var datefilter='';
	var order='';
	
	 //나에게 배정된, 내가 작성한, 내가 팔로워하는..  필터
	 if(document.getElementById("forme").checked == true){
		 forme="member2";
	 }else{
		 forme="";
		 console.log("forme check해제");
	 }
	 if(document.getElementById("writer").checked == true){
			writer="";
	 }else{
			writer='';
	 }
	 if(document.getElementById("follower").checked == true){
		 follower="follower2";
	 }else {
		 follower='';
	 }
	 
	//상태 필터
	 if(document.getElementById("all").checked == true){
		 console.log("all됨ㅌㅌㅌㅌㅌㅌㅌ");
		 success="all";
	 }else {
		 all='';
	 }
	 
	 if(document.getElementById("ing").checked == true){
		 console.log("ing check됨ㅌㅌㅌㅌㅌㅌㅌ");
		 success="ing";
	 }else {
		 ing='';
	 }
	 
	 if(document.getElementById("complete").checked == true){
		 console.log("complete check됨ㅌㅌㅌㅌㅌㅌㅌ");
		 success="complete";
	 }else {
		 ing='';
	 }
	 
	 //작성자 필터
	 writermember=$(":input:radio[name=writermember]:checked").val();
	 
	 //기간 필터
	 datefilter=$("#dayfilter").val(); 
	 console.log("datefilter: " + datefilter);
	 
	 order=$("#select_order").val(); 
	 
		$.ajax({
			type:"get",
			url:"taskTotalList.htm?forme="+forme+"&writer="+writer+"&follower="+follower+"&writermember="+writermember+"&success="+success+"&datefilter="+datefilter+"&order="+order,
			dataType:'html',
			success:function(data){
			
				$("#ajaxlist").append($('#ajaxlist').html(data)); 		
			},
			error:function(){
				alert('검색 에러! 관리자에게 문의하세요');
			}
		});
}

/* 
google.charts.load('current', {'packages':['corechart']});

google.charts.setOnLoadCallback(drawChart_donutAll); 
google.charts.setOnLoadCallback(drawChart_comboAll); 


function drawChart_donutAll() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', '업무상태');
  data.addColumn('number', '업무개수');
  data.addRows([
    ['완료됨', 3],
    ['마감일 지남', 1],
    ['계획됨', 1],
    ['마감일 없음', 1],
    
  ]);
  
  var options = {
          title: '전체 업무',
          pieHole: 0.9,
          pieSliceTextStyle: {
              color: 'black'
            } , 
      };
        
   var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
   chart.draw(data, options);
        
}

function drawChart_comboAll() {
    // Some raw data (not necessarily accurate)
    var data = google.visualization.arrayToDataTable([
     ['Month', '완료됨', '마감일 지남', '계획됨', '마감일 없음'],
     ['오늘',  2,      3,         1,             0],
     ['내일',  3,      2,        3,             1],
     ['이번주',  4,      2,        3,             0],
     ['이번달',  0,      2,        1,             4],
     ['다음달',  3,      5,         2,             1]
  ]);

var options = {
  title : ' ',
  vAxis: {title: '업무개수'},
  hAxis: {title: '마감일자'},
  seriesType: 'bars',
  series: {5: {type: 'line'}}
  
};

var chart = new google.visualization.ComboChart(document.getElementById('combochart'));
chart.draw(data, options);
}
 */

function submit2(){
	/* var enddate = $("#datepicker").value(); */
	title=$("#title").val();
 	console.log(title); 
	 $.ajax({
	       type : "get",
	       url : "taskInsert.htm?title="+title+"&categoryId="+categoryId,
	       success : function(data) {
	          console.log(data);               
	       },
	       error : function() {
	          alert('Error while request..');
	       }
	    });
	    console.log("check");
}

function projectchange(){

	projectId=$("#project").val();
	console.log("dsadasdasdsadasdas"+ projectId);
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

function categorychange(){
	
	categoryId=$("#catechange").val();
	console.log(categoryId);
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
			<nav> <span>
				<ul>
					<li class="active"><a href="#">업무</a></li>
					<li><a href="#">캘린더</a></li>
				</ul>
			</span> </nav>
		</div>
	</div>
	<div class="col-sm-5"></div>
</div>



<div class="row">
	<div class="col-sm-2">

	<br>
		기간<br> 
		<select id="dayfilter" onChange="myfilter();">
			<option value="">전체</option>
			<option value="30">최근 30일</option>
			<option value="60">최근 60일</option>
		</select>

		<hr>
		<br>
		<input type="radio" name="task" value="mytask">내업무
		<br>
		<input type="radio" name="task" value="alltask" checked="checked">전체업무
		<hr>
		<br>
		빠른필터<br>
		<input type="checkbox" id="forme" name="filter" value="for" onclick="myfilter();">나에게 배정된 업무<br>
		<input type="checkbox" id="writer" name="filter" value="writer" onclick="myfilter();">내가 작성한 업무<br>
		<input type="checkbox" id="follower" name="filter" value="follower" onclick="myfilter();">내가 팔로우하는 업무<br>
		<hr>
		프로젝트<br>
		<c:forEach items="${projectlist}" var="n">
			<input type="checkbox" name="project" value="${n.p_title}" >${n.p_title}<br>
		</c:forEach>
		
		<hr>
		작성자<br>
		<input type="radio" id="writermember2" name="writermember" onclick="myfilter();" value="" checked>전체<br>
		<c:forEach items="${assign}" var="n" >
			<input  type="radio" id="writermember" name="writermember" onclick="myfilter();" value="${n.userid}">${n.userid}<br>
		</c:forEach>
		<hr>
		상태<br>
		<input type="radio" id="all" name="success_f" onclick="myfilter();" value="" checked>전체<br>
		<input type="radio" id="ing"  name="success_f" onclick="myfilter();" value="" >진행중인 업무<br>
		<input type="radio" id="complete" name="success_f" onclick="myfilter();" value="" >마감 업무<br>

		
		</div>
	<div class="col-sm-10" style="height: 500px">
	<div class="row" style=" height: 20px">
	</div>
	
	
	<div id="filter" style=" width: 880px">
	<button type="button" class="btn btn-primary" data-toggle="modal"
         data-target="#add-modal">+ 새업무</button>
         
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
						<option value="" selected="selected">  </option>
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
                        id="addbtn" onclick="submit2();">
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
		
		<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModal">
  	     <span class="glyphicon glyphicon-stats"></span> 
  	           차트보기
  	  	</button>	
	
	
		<select id="select_order" onchange="myfilter">
            <option value="">최신순</option>
            <option value="end">마감순</option>
            
         </select>
         
         
	  	  	 
	  	 <!-- 차트보기 (모달) --> 	 
	  	 <div class="modal fade" id="myModal" role="dialog">
	     	<div class="modal-dialog modal-lg">
	     	 <div class="modal-content">
	      
	        	<div class="modal-header">
	         		 <button type="button" class="close" data-dismiss="modal">&times;</button>
	          		 <h4 class="modal-title">전체분석</h4>
	          
	        	</div>
	        
	        	<div class="modal-body">
	        		<table class="columns">
	      		 		<tr>
		      		 		<td><div style="width: 200px; height: 200px;"></div></td>
		       				<td><div id="donutchart" style="width: 500px; height: 300px;"></div></td>
	     	   	  	  </tr>
	    	    	</table>
	    	    
	    	    	<table class="columns">
	      		 		<tr>
	      		 			<td><div style="width: 200px; height: 200px;"></div></td>
	       					<td><div id="combochart" style="width: 500px; height: 300px;"></div></td>
	     	   	   	    </tr>
	    	    	</table>
	        	</div>
	        
	        
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="button22();">Close</button>
	        </div>
	        
	       </div>
	    </div>
	  </div>
	         
         </div>
		<div id="container" data-activity-id="320">
	
			<div class="row" style="background-color: #D9E5FF; height: 20px"></div>
			<div id="ajaxlist">
				<%-- 
				<c:forEach items="${list}" var="n">
					<div class="articlesteam" >
				   		<!-- <h2>팀원 모집</h2> -->
						<ol class="group">
					    	<li class="comment"><p class="text"><input type="checkbox" value="dd">&nbsp ${n.title}</p>
					        	<time>taskworldproject > ${n.member}</time>
					          		<a class="remove">마감일 없음</a>
					            	<hr>
					        </li>
					    </ol>
				    </div>
				</c:forEach> --%>
			</div>
		</div>
	</div>
</div>


 