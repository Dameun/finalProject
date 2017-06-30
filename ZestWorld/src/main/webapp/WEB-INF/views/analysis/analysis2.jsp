<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
    
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
    
    <script type="text/javascript">

      google.charts.load('current', {'packages':['corechart', 'table']});
      
      google.charts.setOnLoadCallback(drawTable);  
      google.charts.setOnLoadCallback(drawChart_me); 
      google.charts.setOnLoadCallback(drawChart_i);
      google.charts.setOnLoadCallback(drawChart_follow);
      google.charts.setOnLoadCallback(drawChart_bar);
      google.charts.setOnLoadCallback(drawChart_Curve);
	  
      
      
      $( function() {
    	  
    	  
    	  
    	    var dateFormat = "mm/dd/yy",
    	      from = $( "#from" )
    	        .datepicker({
    	          defaultDate: "+1w",
    	          changeMonth: true,
    	          numberOfMonths: 1
    	        })
    	        .on( "change", function() {
    	          to.datepicker( "option", "minDate", getDate( this ) );
    	        }),
    	      to = $( "#to" ).datepicker({
    	        defaultDate: "+1w",
    	        changeMonth: true,
    	        numberOfMonths: 1
    	      })
    	      .on( "change", function() {
    	        from.datepicker( "option", "maxDate", getDate( this ) );
    	      });
    	 
    	    function getDate( element ) {
    	      var date;
    	      try {
    	        date = $.datepicker.parseDate( dateFormat, element.value );
    	      } catch( error ) {
    	        date = null;
    	      }
    	 
    	      return date;
    	    }
    	  } );
      
      
      function drawTable() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', '멤버 이름');
          data.addColumn('number', '전체 업무');
          data.addColumn('number', '진행 중인 업무');
          data.addColumn('number', '남은 업무');
          data.addColumn('boolean', '완료 유무');
          data.addRows([
        	
/*           for(i = 0; i < years.length; i++)
        	  data.addRow([years[i], sales[i]]); */
  
            ['장윤희' ,{v: 8, f: '8'}, {v: 8, f: '8'}, {v: 0, f: '0'}, true],
            
            
          ]);

          var table = new google.visualization.Table(document.getElementById('table_div'));

          table.draw(data, {showRowNumber: false,  width: '100%', height: '100%'});
        }
       
      
    
      
      
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
    	  		json =  "${categoryTitle.title}";
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
    <!-- <div class="row" style="background-color:white">
    	<div class="col-md-4">
    	</div>
    	<div class="col-md-4">
    		<ul class="nav nav-tabs">
          		<li><a href="#">업무</a></li>
          		<li><a href="#">분석</a></li>
             	<li><a href="#">파일</a></li>
       		</ul>
       		
    	</div>
    	<div class="col-md-4">
    	</div>
	</div>&nbsp -->
	
	<b style="font-size:18px" >Project All Chart</b> <br><br>
	<!-- <b style="font-size:18px" >업무추가 </b> <br><br>
	
	<table class="columns">
		<tr>
			<td><p>시작일 <input type="text" id="datepicker"></p></td>
			<td><p>마감일 <input type="text" id="datepicker2"></p></td>
			<label for="from">&nbsp&nbsp&nbsp&nbsp시작일</label>
			&nbsp&nbsp
			<input type="text" id="from" name="from">
			&nbsp&nbsp&nbsp&nbsp
			
			<label for="to">&nbsp마감일</label>
			&nbsp&nbsp&nbsp&nbsp
			<input type="text" id="to" name="to">
			&nbsp&nbsp&nbsp&nbsp
			<button type="button" class="btn btn-warning btn-sm">추가</button> -->
			
			<%-- <c:forEach items="${getTaskAllFlow_comp}"  var="n">
				${n.categorytitle}
			</c:forEach> --%>
        	
			<%-- for(List i = ${getTaskAllFlow_comp} ){
    	  ${i.categorytitle}
      		} --%>
		</tr>
	</table>
					
        	
	<br>
	<!-- 테이블 차트 -->
	<!-- <div id="table_div" style="width: 1350px; height: 200px;"></div> -->
	<br>
	
    <table class="columns">
      <tr>
        <td><div id="donutchart" style="width: 433px; height: 300px;"></div></td>
        <td><div id="donutchart1" style="width: 433px; height: 300px;"></div></td>
        <td><div id="donutchart2" style="width: 434px; height: 300px;"></div></td>
      </tr>
    </table>
    <br>
    <%-- <c:forEach items="${getTaskAllFlow_comp}"  var="n">
				${n.categorytitle} 
	</c:forEach>
	
	<c:forEach items="${getMemberListMe}"  var="n">
				${n} 
	</c:forEach> --%>

    <table class="columns">
    	<tr>
    		<div id="barchart" style="width: 1300px; height: 100px;"></div>
    	</tr>	
    </table>
    
    <br><br><br><br><br><br><br><br><br><br><br>
    
    <table class="columns">
    	<tr>
 			<!-- <span id='colchart_diff' style='width: 450px; height: 250px; '></span> 
			<span id='barchart_diff' style='width: 450px; height: 250px;'></span> -->
			<!-- <div id='visualization' style='width: 450px; height: 250px;'></div> -->
			<div id="curve_chart" style="width: 1300px; height: 300px"></div>
		</tr>	
    </table> 
    
</body>
</html>


