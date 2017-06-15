<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="dist/css/ContestBoardView.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	console.log("dsadasd:");
	var forme='';
	var writer='';
	var follower='';
	
	$.ajax({
		type:"get",
		url:"taskTotalList.htm?forme="+forme+"&writer="+writer+"&follower="+follower,
		/* dataType:'html', */
		success:function(data){
		
			$("#ajaxlist").append($('#ajaxlist').html(data)); 		
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
	});

	
}); 

function myfilter(){
	var forme='';
	var writer='';
	var follower='';

	 if(document.getElementById("forme").checked == true){
		 console.log("forme check됨ㅌㅌㅌㅌㅌㅌㅌ");
		 forme="member2";
	 }else{
		 forme="";
		 console.log("forme check해제");
	 }
	 if(document.getElementById("writer").checked == true){
		 console.log("writer check됨ㅌㅌㅌㅌㅌㅌㅌ");
			writer="zest@kosta.com";
	 }else{
			writer='';
	 }
	 if(document.getElementById("follower").checked == true){
		 console.log("follower check됨ㅌㅌㅌㅌㅌㅌㅌ");
		 follower="follower2";
	 }else {
		 follower='';
	 }
		
	 console.log("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+forme+"/"+writer+"/"+follower);	
	 
		$.ajax({
			type:"get",
			url:"taskTotalList.htm?forme="+forme+"&writer="+writer+"&follower="+follower,
			dataType:'html',
			success:function(data){
			
				$("#ajaxlist").append($('#ajaxlist').html(data)); 		
			},
			error:function(){
				alert('검색 에러! 관리자에게 문의하세요');
			}
		});
}


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
		<select>
			<option>전체</option>
			<option>최근 30일</option>
			<option>최근 60일</option>
			<option>전체</option>
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
		<input type="checkbox" name="project" value="finalproject">finalproject<br>
		<input type="checkbox" name="project" value="DirectTask">DirectTask<br>
		<input type="checkbox" name="project" value="TaskWorldProject">TaskWorldProject<br>
		
		</div>
	<div class="col-sm-10" style="background-color: #D9E5FF; height: 500px">
	<div class="row" style="background-color: #D9E5FF; height: 20px">
	</div>
<div id="filter" style="background-color: #D9E5FF; width: 880px">
	<button type="button" class="btn btn-primary">+ 새업무</button>
	<!--<a class="glyphicon glyphicon-search"></a> -->
		
		<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModal">
  	     <span class="glyphicon glyphicon-stats"></span> 
  	           차트보기
  	  	</button>	
	
	
		<select id="select_order" onchange="fnSearch();">
            <option value="new">최신순</option>
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
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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


 