<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.6.1/fullcalendar.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
 
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#myCalendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<script type='text/javascript'>

$(function() {
	   
	
      from = $( "#Insert_startdate" ).datepicker({
          changeMonth: true,
          dateFormat: "yy/mm/dd"
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ));
        }),
        
      to = $( "#Insert_enddate" ).datepicker({
        changeMonth: true,
        dateFormat: "yy/mm/dd"
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ));
      });
 
   function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
        dateFormat: yy/mm/dd;
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  

  $('#myCalendar').fullCalendar({
        header: {
            left: 'today',
            center: 'title',
            right: 'prev,next'
        },
        
        editable: true,
        selectable: true,
        selectHelper: true,
        
        height: 700,
        titleFormat: {month: 'YYYY년 MM월'},
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
 		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
 		buttonText: {today: '오늘'},
 		displayEventTime: false,
 		 select: function(start, end, allDay) {
             $('#startdate').datepicker("setDate", new Date(start));
             $('#enddate').datepicker("setDate", new Date(end)); 
                
             $('#calEventDialog').dialog('open');   
 		 },
         
         events:
             {
        	  url:"calendarList.htm" 
             }
         , 
       
        eventClick: function(calEvent, jsEvent, view) {
        	
            $('#calEditDialog #title').val(calEvent.title);
            $('#calEditDialog #content').val(calEvent.explain);
            $('#calEditDialog').dialog('open');
            
            
            
        },
    
    });
    
    $('#calEditDialog').dialog({
   	 	draggable : false,
   		modal : true,
     	resizable: false,
     	autoOpen: false,
     	title: '일정관리',
        width: 400,   
     });

 
    $('#calEventDialog').dialog({
    	 draggable : false,
    	 modal : true,
        resizable: false,
      	autoOpen: false,
        title: '일정추가',
        width: 400,
  
    });
      
    $.ajax({
    	
    	type:"post",
    	url:"CalendarDel.htm",
    	data:"title="+$("#title").val()+"&content="+$("#content").val(),
    	success : function(data){
    	console.log("삭제");
    	},
    	error:function(){
    		alert("삭제error");
    	}
    });
    

    

});      
     
    function calinsert(){
  	 
    	$.ajax({
    	
    	type:"get",
    	url:"CalendarIns.htm",
    	data:"ctitle="+$("#categoryTitle option:selected").val()+"&title="+$("#Insert_title").val()+"&content="+$("#Insert_content").val()+"&start_date="+$("#Insert_startdate").val()+"&end_date="+$("#Insert_enddate").val(),
    	success: function(data){
    		console.log("추가");
    	},
    	error:function(){
    		alert("추가 error");
    	}
    
 	   }); 
    	   
    }
 
     
</script>
<body>

	<div id="calEditDialog">
		<form action="CalendarDel.htm" method="post">
			<fieldset>
				<label
					for="eventTitle">Title</label> <input type="text" name="title"
					id="title" style="width: 350px;"/><br> <label
					for="eventContent">Content</label> <input type="text"
					name="content" id="content" style="height: 100px; width: 350px;"
					readonly="readonly" /><br>
				<input type="submit" value="삭제하기">
			</fieldset>
		</form>
	</div>
	
	<div id="calEventDialog">
		<form action="CalendarAdd.date" method="post">
			<fieldset>
				<label for="eventCtitle">Category Title</label><br>
				<select id="categoryTitle">
                   <option selected>선택하기</option>
						<c:forEach items="${list}" var="n">
				  <option value="${n.category_id}">${n.title}</option>		
						</c:forEach>
    		    </select><br>
				<label for="eventTitle">Title</label> <br> 
				<input type="text" name="title" id="Insert_title" style="width: 350px;"/><br> 
				<label for="eventContent">Content</label> 
				<input type="text" name="content" id="Insert_content" style="height: 100px; width: 350px;" /><br>

				<label for="eventStart">Start Date</label> <br> <input
					type="text" name="startdate" id="Insert_startdate" style="width: 200px;" /><br>

				<label for="eventEnd">End Date</label> <br> <input type="text"
					name="enddate" id="Insert_enddate" style="width: 200px;" /><br>
				<br> <input type="button" value="추가하기" align="right" id="CalendarUpdate" onclick="calinsert()">
			</fieldset>
		</form>
	</div>
	<br>
	<br>
	<br>



	<hr>
	<div id='myCalendar'></div>

</body>