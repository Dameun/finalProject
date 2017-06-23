<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	type="text/css" rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.6.1/fullcalendar.min.css"
	type="text/css" rel="stylesheet" />
<link
	href="https://code.jquery.com/ui/1.11.4/themes/south-street/jquery-ui.css"
	type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.6.1/fullcalendar.min.js"></script>
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

$( function() {
	   
      from = $( "#startdate" ).datepicker({
          changeMonth: true,
          dateFormat: "yy/mm/dd"
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
        
      to = $( "#enddate" ).datepicker({
        changeMonth: true,
        dateFormat: "yy/mm/dd"
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
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
  
  
$.ajax({
	
	type: "POST", 
	url: "json-events.jsp",	
	dataType: "json",   	 
	    
	success: function(data){
		title = []; 
		start =[];
		end = [];	
    	content = [];
    	
    	 console.log(data);
    	 
          $.each(data, function(index, obj) {
        	  title = obj.title;
        	  start = obj.start;
        	  end = obj.end;  
        	  content = obj.content;
                
              });
	}
 
}); 

    $myCalendar = $('#myCalendar').fullCalendar({
        header: {
            left: 'today',
            center: 'title',
            right: 'prev,next'
        },
        
        editable: true,
        selectable: true,
        selectHelper: true,
        
        height: 700,
        titleFormat: {month: 'YY년 MM월'},
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
        	  url: "json-events.jsp" 
             }
         , 
       
        eventClick: function(calEvent, jsEvent, view) {
        	
            $('#calEditDialog #title').val(calEvent.title);
            $('#calEditDialog #content').val(calEvent.content);
                     
       
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
   
});     
     
</script>
<body>

<form action="/schedule.htm"></form>

	<div id="calEditDialog">
		<form action="calendarDel.htm" method="post">
			<fieldset>
				<label
					for="eventTitle">Title</label> <input type="text" name="title"
					id="title" style="width: 350px;" readonly="readonly" /><br> <label
					for="eventContent">Content</label> <input type="text"
					name="content" id="content" style="height: 100px; width: 350px;"
					readonly="readonly" /><br>
				<input type="submit" value="삭제하기">
			</fieldset>
		</form>
	</div>

	<div id="calEventDialog">
		<form action="calendarAdd.htm" method="post">
			<fieldset>
				<label
					for="eventTitle">Title</label> <br> <input type="text"
					name="title" id="title" style="width: 350px;" /><br> <label
					for="eventContent">Content</label> <input type="text"
					name="content" id="content" style="height: 100px; width: 350px;" /><br>

				<label for="eventStart">Start Date</label> <br> <input
					type="text" name="startdate" id="startdate" style="width: 200px;" /><br>

				<label for="eventEnd">End Date</label> <br> <input type="text"
					name="enddate" id="enddate" style="width: 200px;" /><br>
				<br> <input type="submit" value="추가하기" align="right">
			</fieldset>
		</form>
	</div>
	<br>
	<br>
	<br>



	<hr>
	<div id='myCalendar'></div>

</body>