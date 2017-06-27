<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<nav id="sidebar" class="sidebar" role="navigation">
    <!-- need this .js class to initiate slimscroll -->
    <div class="slimScrollDiv">
    <div class="js-sidebar-content">
        <header class="logo hidden-xs">
            <a href="index.htm">ZEST</a>
        </header>
        <!-- seems like lots of recent admin template have this feature of user info in the sidebar.
             looks good, so adding it and enhancing with notifications -->
     <!--    <div class="sidebar-status visible-xs" >
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="thumb-sm avatar pull-right">
                    <img class="img-circle" src="./resource/img/people/a5.jpg" alt="...">
                </span>
                .circle is a pretty cool way to add a bit of beauty to raw data.
                     should be used with bg-* and text-* classes for colors
                <span class="circle bg-warning fw-bold text-gray-dark">
                    13
                </span>
                &nbsp;
                Philip <strong>Smith</strong>
                <b class="caret"></b>
            </a>
            #notifications-dropdown-menu goes here when screen collapsed to xs or sm
        </div> -->
        <!-- main notification links are placed inside of .sidebar-nav -->
        <ul class="sidebar-nav">
          <li>
                <a href="#" onclick="ajaxView('totalTask.ajax')">
                    <span class="icon">
                        <i class="glyphicon glyphicon-tasks"style="padding-top:5px;"> </i>
                    </span>
                    	전체업무
                </a>
            </li>
            <li>
                <a href="#" onclick="ajaxView('projectMain.ajax')">
                    <span class="icon">
                        <i class="glyphicon glyphicon-tasks" style="padding-top:5px;"></i>
                    </span>
                    	개별업무
                </a>
            </li>
            <li>
                <a href="#" onclick="ajaxView('wSpace.ajax')">
                    <span class="icon">
                        <i class="fa fa-envelope" style="padding-top:5px;"></i>
                    </span>
                   	프로젝트
                    <!-- <span class="label label-danger">
                        new
                    </span> -->
                </a>
            </li>
            <li>
                <a href="#" onclick="ajaxView('analysis.ajax')">
                    <span class="icon">
                        <i class="glyphicon glyphicon-stats" style="padding-top:5px;"></i>
                    </span>
                    Charts
                </a>
            </li>
            <li>
<!--             location.href=('joinEdit.htm') -->
                <a href="#" onclick="ajaxView('joinEdit.ajax')">
                    <span class="icon">
                        <i class="glyphicon glyphicon-user"style="padding-top:5px;"></i>
                    </span>
                    Profile
                    <!-- <sup class="text-warning fw-semi-bold">
                        new
                    </sup> -->
                </a>
            </li>
            <li>
                <a href="#" onclick="location.href='chat.htm'">
                    <span class="icon">
                        <i class="glyphicon glyphicon-comment" style="padding-top:5px;"></i>
                    </span>
                    Chat
                </a>
            </li>
            <li>
                <a href="#" onclick="ajaxView('template.ajax')">
                    <span class="icon">
                        <i class="glyphicon glyphicon-inbox" style="padding-top:5px;"></i>
                    </span>
                    Template
                </a>
            </li>
        </ul>
        <!-- every .sidebar-nav may have a title -->
       </div>
   </div>
</nav>