<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<!-- 
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
     -->
     <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      google.charts.load("current", {"packages":["corechart"]});
      

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
        	['완료됨', ${getTaskMe_comp}],  
            ['마감일 지남', ${getTaskMe_enddateLate}],
            ['진행중', ${getTaskMe_ing}],
            ['마감일 없음', ${getTaskMe_enddateNo}], 
          
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
        	  ['완료됨',  ${getTaskI_comp}],
              ['마감일 지남', ${getTaskI_enddateLate}],
              ['진행중', ${getTaskI_ing}],
              ['마감일 없음', ${getTaskI_enddateNo}],
            
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
        	  ['완료됨', ${getTaskFollow_comp}],
              ['마감일 지남', ${getTaskFollow_enddateLate}],
              ['진행중', ${getTaskFollow_ing}],
              ['마감일 없음', ${getTaskFollow_enddateNo}],
            
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
    	  console.log('============================================================1');
    	  <c:forEach items="${getTaskAllFlow_comp}" var ="categoryTitle">
    	  		var json = new Object();
    	  		json =  "${categoryTitle}";
    	  		categoryTitle.push(json);
    	  		console.log(json);
    	  </c:forEach>
    	  
    	  console.log('============================================================2');
    	  var compCount = new Array();
    	  <c:forEach items="${getTaskAllFlow_comp_count}" var ="compCount">
    	  		var json = new Object();
	  			json =  ${compCount};
	  			compCount.push(json);
	  	  </c:forEach>    	  
    	  
    	  
	  	  console.log('============================================================3');
    	  var endLateCount = new Array();
    	  <c:forEach items="${getTaskAllFlow_enddateLate_count}" var ="endLateCount">
    	  		var json = new Object();
	  			json =  ${endLateCount};
  	  			endLateCount.push(json);
	  	  </c:forEach>
	  	  
	  	  console.log('============================================================4');
    	  var endNoCount = new Array();
    	  <c:forEach items="${getTaskAllFlow_enddateNo_count}" var ="endNoCount">
    	  		var json = new Object();
	  			json =  ${endNoCount};
	  			endNoCount.push(json);
	  	  </c:forEach>
	  	  
	  	  console.log('============================================================5');
    	  var ingCount = new Array();
    	  <c:forEach items="${getTaskAllFlow_ing_count}" var ="ingCount">
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

      
      /*var data = google.visualization.arrayToDataTable(dataArray);/*([
          ['Genre', '완료됨', '마감일 지남', '계획됨', '마감일 없음', { role: 'annotation' } ],
          
          ['스프링' , 2 , 3, 4, 5, ''],
          
        
		]);*/
        
      
      
      
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
              ['진행중인 업무',    2,            2 ,             3       ],
              ['완료된 업무',   1,            5 ,             2       ],
              ['마감일지난 업무',    2,            1,              0        ]
              
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
	
	<b style="font-size:18px" >WorkSpace All Chart</b> <br><br>
	

		</tr>
	</table>
					
        	
	<br>
	<br>
	
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


