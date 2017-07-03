<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="http://www.google.com/jsapi"></script>
    
    <script type="text/javascript">

      google.charts.load('current', {'packages':['corechart']});
      
      google.charts.setOnLoadCallback(drawChart_me); 
      google.charts.setOnLoadCallback(drawChart_i);
      google.charts.setOnLoadCallback(drawChart_follow);
      google.charts.setOnLoadCallback(drawChart_bar);
      google.charts.setOnLoadCallback(drawChart_Curve);
	  
      
      
      
      
      function drawChart_me() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', '업무상태');
        data.addColumn('number', '업무개수');
        data.addRows([
        	['완료됨', ${getTaskMe_compU}],  
            ['마감일 지남', ${getTaskMe_enddateLateU}],
            ['진행중', ${getTaskMe_ingU}],
            ['마감일 없음', ${getTaskMe_enddateNoU}], 
          
        ]);
        
        var options = {
                title: '나에게 배정된 업무',
                pieHole: 0.9,
                 pieSliceTextStyle: {
                    color: 'black'
                  } ,
            };
              
         var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
         chart.draw(data, options);
              
	  }
      
      
      function drawChart_i() {
		  
 
          var data = new google.visualization.DataTable();
          data.addColumn('string', '업무상태');
          data.addColumn('number', '업무개수');
          data.addRows([
        	  ['완료됨',  ${getTaskI_compU}],
              ['마감일 지남', ${getTaskI_enddateLateU}],
              ['진행중', ${getTaskI_ingU}],
              ['마감일 없음', ${getTaskI_enddateNoU}],
            
          ]);
          
          var options = {
                  title: '내가 작성한 업무',
                  pieHole: 0.9,
                   pieSliceTextStyle: {
                      color: 'black'
                    } ,
              };
                
           var chart = new google.visualization.PieChart(document.getElementById('donutchart1'));
           chart.draw(data, options);
                
 	  }
      
      
      function drawChart_follow() {

          var data = new google.visualization.DataTable();
          data.addColumn('string', '업무상태');
          data.addColumn('number', '업무개수');
          data.addRows([
        	  ['완료됨', ${getTaskFollow_compU}],
              ['마감일 지남', ${getTaskFollow_enddateLateU}],
              ['진행중', ${getTaskFollow_ingU}],
              ['마감일 없음', ${getTaskFollow_enddateNoU}],
            
          ]);
          
          var options = {
                  title: '내가 팔로우하는 업무',
                  pieHole: 0.9,
                   pieSliceTextStyle: {
                      color: 'black'
                    } ,
              };
                
           var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
           chart.draw(data, options);
                
  	  }
      
      
      
      function drawChart_bar() {
    	  
    	  var categoryTitle = new Array();
    	  var str;
    	  <c:forEach items="${getTaskAllFlow_compU}" var ="categoryTitle">
    	  		var json = new Object();
    	  		json =  "${categoryTitle}";
    	  		categoryTitle.push(json);
    	  </c:forEach>
    	  
    	  
    	  var compCount = new Array();
    	  <c:forEach items="${getTaskAllFlow_comp_countU}" var ="compCount">
    	  		var json = new Object();
	  			json =  ${compCount};
	  			compCount.push(json);
	  	  </c:forEach>    	  
    	  
    	  
    	  var endLateCount = new Array();
    	  <c:forEach items="${getTaskAllFlow_enddateLate_countU}" var ="endLateCount">
    	  		var json = new Object();
	  			json =  ${endLateCount};
  	  			endLateCount.push(json);
	  	  </c:forEach>
	  	  
    	  var endNoCount = new Array();
    	  <c:forEach items="${getTaskAllFlow_enddateNo_countU}" var ="endNoCount">
    	  		var json = new Object();
	  			json =  ${endNoCount};
	  			endNoCount.push(json);
	  	  </c:forEach>
	  	  
    	  var ingCount = new Array();
    	  <c:forEach items="${getTaskAllFlow_ing_countU}" var ="ingCount">
    	  		var json = new Object();
	  			json =  ${ingCount};
	  			ingCount.push(json);
	  	  </c:forEach>	  	  
    	  
    	  
   	   var dataArray = [['업무'          ,   '완료됨'           ,   '마감일 지남'      ,   '진행중'   ,   '마감일 없음'           ,   ]];

       for (var n =0; n < categoryTitle.length; n++)
       {
         	 dataArray.push ([categoryTitle[n] , compCount[n] , endLateCount[n] , ingCount[n] , endNoCount[n] , ])
        }

       var data = new google.visualization.arrayToDataTable(dataArray); 


        
         var options = {
        		
        		title: '전체 업무리스트 개요' ,
                isStacked: 'percent',
                height: 300,
                legend: {position: 'top', maxLines: 3},
                hAxis: {
                  minValue: 0,
                  ticks: [0, .1, .2, .3, .4, .5, .6, .7, .8, .9, 1]
                }
              };
        
        var chart = new google.visualization.BarChart(document.getElementById("barchart"));
        chart.draw(data, options); 
    	
      }
      
              
       
        
        function drawChart_Curve() {
            var data = google.visualization.arrayToDataTable([
            	 ['업무', '나에게 배정된 업무', '내가 작성한 업무' , '내가 팔로우하는 업무'],
                 ['진행중인 업무',   ${getTaskMe_ingU}, ${getTaskI_ingU}, ${getTaskFollow_ingU} ],
                 ['완료된 업무',   ${getTaskMe_compU}, ${getTaskI_compU}, ${getTaskFollow_compU} ],
                 ['마감일지난 업무', ${getTaskMe_enddateLateU}, ${getTaskI_enddateLateU}, ${getTaskFollow_enddateLateU} ]
              
            ]);

            var options = {
              title: '내 업무 흐름도',
              curveType: 'function',
              legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
          }
        

        
</script>
</head>
<body>
	
		 <h3 class="page-title">Project Chart - <span class="fw-semi-bold">Task Lists</span></h3>
		
    <table class="columns">
      <tr>
        <td><div id="donutchart" style="width: 433px; height: 300px;"></div></td>
        <td><div id="donutchart1" style="width: 433px; height: 300px;"></div></td>
        <td><div id="donutchart2" style="width: 434px; height: 300px;"></div></td>
      </tr>
    </table>
    <br>
   <table class="columns">
    	<tr>
    		<div id="barchart" style="width: 1300px; height: 100px;"></div>
    	</tr>	
    </table>
    <br><br><br><br><br><br><br><br><br><br><br>
    <table class="columns">
    	<tr>
			<div id="curve_chart" style="width: 1300px; height: 300px"></div>
		</tr>	
    </table> 
    
    
</body>
</html>


