<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript" src="./resource/Js/userState.js"> </script> 

           <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle dropdown-toggle-notifications" id="notifications-dropdown-toggle" data-toggle="dropdown">
                        <span class="thumb-sm avatar pull-left">
                            <img class="img-circle" src="./resource/img/people/a5.jpg" alt="...">
                        </span>
                        &nbsp;
                        User <strong>User</strong>&nbsp;
                        <span class="circle bg-warning fw-bold">
                           ${unCount}
                        </span>
                        <b class="caret"></b></a>
                    <!-- ready to use notifications dropdown.  inspired by smartadmin template.
                         consists of three components:
                         notifications, messages, progress. leave or add what's important for you.
                         uses Sing's ajax-load plugin for async content loading. See #load-notifications-btn -->
                    <div class="dropdown-menu animated fadeInUp" id="notifications-dropdown-menu">
                        <section class="panel notifications">
                            <header class="panel-heading">
                                <div class="text-align-center mb-sm">
                                    <strong>User STATE :D</strong>
                                </div>
                                <div class="btn-group btn-group-sm btn-group-justified" id="notifications-toggle" data-toggle="buttons">
                                    <label class="btn btn-default active" onclick="userState('01');">
                                        <!-- ajax-load plugin in action. setting data-ajax-load & data-ajax-target is the
                                             only requirement for async reloading -->
                                        <input type="radio" checked = ""  data-ajax-trigger="change" data-ajax-load="demo/ajax/notifications.html" data-ajax-target="#notifications-list"> 업무
                                    </label>
                                    <label class="btn btn-default" onclick="userState('02');">
                                        <input type="radio" data-ajax-trigger="change" data-ajax-load="demo/ajax/messages.html" data-ajax-target="#notifications-list"> 외출
                                    </label>
                                    <label class="btn btn-default" onclick="userState('03');">
                                        <input type="radio" data-ajax-trigger="change" data-ajax-load="demo/ajax/progress.html" data-ajax-target="#notifications-list"> 회의
                                    </label>
                                     <label class="btn btn-default" onclick="userState('04');" >
                                        <input type="radio" data-ajax-trigger="change" data-ajax-load="demo/ajax/progress.html" data-ajax-target="#notifications-list"> 식사
                                    </label>
                                </div>
                            </header>
                            <!-- notification list with .thin-scroll which styles scrollbar for webkit -->
                            <div id="notifications-list" class="list-group thin-scroll"> 
                                <c:forEach items="${alarmList}" var="alarm">
	                                <div class="list-group-item">
	                                <span class="thumb-sm pull-left mr clearfix">
	                                    <img class="img-circle" src="./resource/img/people/a5.jpg" alt="...">
	                                </span>
	                                    <p class="no-margin overflow-hidden">
	                                        User <a href="#">${alarm.alarmTitle}</a>
	                                        &nbsp;&nbsp;
	                                        <c:if test="${alarm.check_f eq 'N'}">
	                                        <button class="btn btn-xs btn-success">hot</button>
	                                        </c:if>
	                                       <!--  <button class="btn btn-xs btn-danger">Deny</button> -->
	                                        <time class="help-block no-margin">
	                                            12:18 AM
	                                        </time>
	                                    </p>
	                                </div>  
	                            </c:forEach>    
                            </div>
                            <footer class="panel-footer text-sm">
                                <!-- ajax-load button. loads demo/ajax/notifications.php to #notifications-list
                                     when clicked -->
                                <button class="btn btn-xs btn-link pull-right" id="load-notifications-btn" data-ajax-load="demo/ajax/notifications.php" data-ajax-target="#notifications-list" data-loading-text="<i class='fa fa-refresh fa-spin mr-xs'></i> Loading...">
                                    <i class="fa fa-refresh"></i>
                                </button>
                                <span class="fs-mini">Synced at: 21 Apr 2014 18:36</span>
                            </footer>
                        </section>
                    </div>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-cog fa-lg"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"onclick="ajaxView('joinEdit.ajax')"><i class="glyphicon glyphicon-user"></i> &nbsp; My Account</a></li>
                        <li class="divider"></li>
                        
                       
                        <li><a href="index.htm"><i class="fa fa-sign-out"></i> &nbsp; Log Out</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-globe fa-lg"></i>
                    <i class="chat-notification-sing animated bounceIn"></i></a>
                   
                </li>
            </ul> 
<script src="./resource/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/dropdown.js"></script>