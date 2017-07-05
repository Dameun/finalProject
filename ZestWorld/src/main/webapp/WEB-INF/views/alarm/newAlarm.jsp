<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/dropdown.js"></script>
<body>
	<div id="notifications-list" class="list-group thin-scroll"> 
	    <c:forEach items="${alarmList}" var="alarm">
	     <div class="list-group-item">
	     <span class="thumb-sm pull-left mr clearfix">
	        <!--  <img class="img-circle" src="./resource/img/people/a5.jpg" alt="..."> -->
	     </span>
	         <p class="no-margin overflow-hidden">
	           <c:if test="${alarm.alarm_type==0}">
	           	[배정] &nbsp;
	           </c:if>
	           <c:if test="${alarm.alarm_type==1}">
	           	[완료] &nbsp;
	           </c:if>
	             <a href="#">${alarm.alarmTitle}</a>
	             &nbsp;&nbsp;
	             <c:if test="${alarm.check_f==0}">
	             <button class="btn btn-xs btn-danger">hot</button>
	             </c:if>
	            <!--  <button class="btn btn-xs btn-danger">Deny</button> -->
	             <time class="help-block no-margin">
	                 ${alarm.img}
	             </time>
	         </p>
	     </div>  
	 	</c:forEach>    
	</div>
	                   
</body>