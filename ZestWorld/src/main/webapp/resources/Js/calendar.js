$(function(){
    function pageLoad(){
     /*   $('#external-events').find('div.external-event').each(function() {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
                title: $.trim($(this).text()) // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });*/

        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var $calendar=$('#calendar').fullCalendar({
            
            /*
            editable: true,
            selectable: true,
            selectHelper: true,
            */
            height: 700,
            /*titleFormat: {month: 'yyyy년 MM월'},*/
    		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
    		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
    		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
     		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
     	/*	buttonText: {
     			prev: "<span class='fc-text-arrow'>&lsaquo;</span>",
     			next: "<span class='fc-text-arrow'>&rsaquo;</span>",
     			prevYear: "<span class='fc-text-arrow'>&laquo;</span>",
     			nextYear: "<span class='fc-text-arrow'>&raquo;</span>",
     			today: 'today',
     			month: 'month',
     			week: 'week',
     			day: 'day'
     		},*/
     		
     		displayEventTime: false,
     		 selectable: true,
             selectHelper: true,
     		 select: function(start, end, allDay) {
               /*  $('#startdate').datepicker("setDate", new Date(start));
                 $('#enddate').datepicker("setDate", new Date(end)); 
                    
                 $('#calEventDialog').dialog('open');   */
     		 },
             
             events:
                 {
            	  url:"calendarList.htm" 
                 }
             , 
           
            eventClick: function(calEvent, jsEvent, view) {
            	
             /*   $('#calEditDialog #title').val(calEvent.title);
                $('#calEditDialog #content').val(calEvent.explain);
                $('#calEditDialog #cal_taskId').val(calEvent.task_id);
                $('#calEditDialog').dialog('open');
                */
                
                
            },
        
        });

        $("#calendar-switcher").find("label").click(function(){
            $calendar.fullCalendar( 'changeView', $(this).find('input').val() )
        });

        var currentDate = $calendar.fullCalendar('getDate');

        $('#calender-current-date').html(
                $.fullCalendar.formatDate(currentDate, "yyyy MMM d") +
                " - <span class='fw-semi-bold'>" +
                $.fullCalendar.formatDate(currentDate, "dddd") +
                "</span>"
        );


        $('#calender-prev').click(function(){
            $calendar.fullCalendar( 'prev' );
            currentDate = $calendar.fullCalendar('getDate');
            $('#calender-current-date').html(
                    $.fullCalendar.formatDate(currentDate, "yyyy MMM d") +
                    " - <span class='fw-semi-bold'>" +
                    $.fullCalendar.formatDate(currentDate, "dddd") +
                    "</span>"
            );
        });
        $('#calender-next').click(function(){
            $calendar.fullCalendar( 'next' );
            currentDate = $calendar.fullCalendar('getDate');
            $('#calender-current-date').html(
                    $.fullCalendar.formatDate(currentDate, "yyyy MMM d") +
                    " - <span class='fw-semi-bold'>" +
                    $.fullCalendar.formatDate(currentDate, "dddd") +
                    "</span>"
            );
        });
    }
    pageLoad();
    SingApp.onPageLoad(pageLoad);
});