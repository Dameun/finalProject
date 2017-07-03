<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <script src="resources/build/bootstrap/vendor/jquery/dist/jquery.min.js"></script>
 <script src="resources/build/bootstrap/vendor/moment/min/moment.min.js"></script>
<script src="resources/build/bootstrap/vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="resources/build/bootstrap/vendor/jquery-ui/ui/core.js"></script>
<script src="resources/build/bootstrap/vendor/jquery-ui/ui/widget.js"></script>
<script src="resources/build/bootstrap/vendor/jquery-ui/ui/mouse.js"></script>
<script src="resources/build/bootstrap/vendor/jquery-ui/ui/draggable.js"></script>
<script src="resources/build/bootstrap/vendor/fullcalendar/fullcalendar.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/modal.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap_calendar/bootstrap_calendar/js/bootstrap_calendar.min.js"></script>
<!-- page specific js -->
<script src="resources/Js/calendar.js"></script>
<style>

</style>
</head>
<script type='text/javascript'>
/* 
$(function(){
	   
	
      from = $( "#Insert_startdate" ).datepicker({
          changeMonth: true,
          dateFormat: "yy-mm-dd"
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ));
        }),
        
      to = $( "#Insert_enddate" ).datepicker({
        changeMonth: true,
        dateFormat: "yy-mm-dd"
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ));
      });
 
   function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
        dateFormat: "yy/mm/dd";
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
    
});      
     */
    
</script>
<div class="row">
            <div class="col-lg-4">
                <h1 class="page-title" id="calender-current-date"> <span class="fw-semi-bold"></span></h1>
            </div>
        </div>

	<div class="row" style="padding-top:10%;">

                <section class="widget widget-calendar">
                    <div class="widget-body">
                        <div class="calendar-controls">
                            <div class="btn-group"style="float:left">
                                <button class="btn btn-default" id="calender-prev"><i class="fa fa-angle-left"></i></button>
                                <button class="btn btn-default" id="calender-next"><i class="fa fa-angle-right"></i></button>
                            </div>
                            <div id="calendar-switcher" class="btn-group pull-right" data-toggle="buttons">
                                <label class="btn btn-default active">
                                    <input type="radio" name="view" value="month"> Month
                                </label>
                                <label class="btn btn-default">
                                    <input type="radio" name="view" value="agendaWeek"> Week
                                </label>
                                <label class="btn btn-default">
                                    <input type="radio" name="view" value="agendaDay"> Day
                                </label>
                            </div>
                        </div>
                        <div id="calendar" class="calendar"></div>
	
</div>
</section>

</div>