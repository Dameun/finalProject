<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Sing - Dashboard</title>
 
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="resources/dist/css/ContestBoardView.css">
  
    <link href="resources/build/bootstrap/css/application.min.css" rel="stylesheet">
    <!-- 민성 추가부분 (이부분에 안쓰면 modal 자동으로 닫기는 현상이 발생!!) -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- /민성 추가부분 (이부분에 안쓰면 modal 자동으로 닫기는 현상이 발생!!) -->
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
    <link rel="shortcut icon" href="./resource/img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script>
        /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
         chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
         https://code.google.com/p/chromium/issues/detail?id=332189
         */
    </script>
  
  </head>

<c:set var="member" value="${member}"/>
<nav class="page-controls navbar navbar-default">
    <div class="container-fluid">
        <!-- .navbar-header contains links seen on xs & sm screens -->
        <div class="navbar-header">
            <ul class="nav navbar-nav">
                <li>
                    <!-- whether to automatically collapse sidebar on mouseleave. If activated acts more like usual admin templates -->
                    <a class="hidden-sm hidden-xs" id="nav-state-toggle" href="#" title="" data-placement="bottom" data-original-title="Turn on/off sidebar collapsing">
                        <i class="fa fa-bars fa-lg"></i>
                    </a>
                    <!-- shown on xs & sm screen. collapses and expands navigation -->
                    <a class="visible-sm visible-xs" id="nav-collapse-toggle" href="#" title="" data-placement="bottom" data-original-title="Show/hide sidebar">
                        <span class="rounded rounded-lg bg-gray text-white visible-xs"><i class="fa fa-bars fa-lg"></i></span>
                        <i class="fa fa-bars fa-lg hidden-xs" style="padding-top:5px;"></i>
                    </a>
                </li>
              <li class="ml-sm mr-n-xs hidden-xs"><a href="#"><i class="fa fa-refresh fa-lg"  style="padding-top:5px;"></i></a></li>
                <li class="ml-n-xs hidden-xs"><a href="#"><i class="fa fa-times fa-lg"  style="padding-top:2px;"></i></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right visible-xs">
                <li>
                    <!-- toggles chat -->
                    <a href="#" data-toggle="chat-sidebar">
                        <span class="rounded rounded-lg bg-gray text-white"><i class="fa fa-globe fa-lg"></i></span>
                    </a>
                </li>
            </ul>
         
        </div>

        <!-- this part is hidden for xs screens -->
        <div class="collapse navbar-collapse">
            <!-- search form! link it to your search server -->
         <!--    <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <div class="input-group input-group-no-border">
                    <span class="input-group-addon">
                        <i class="fa fa-search"></i>
                    </span>
                        <input class="form-control" type="text" placeholder="Search Dashboard">
                    </div>
                </div>
            </form>
           -->
            <div id="alarm">
  
            </div>
        </div>
    </div>
</nav>

<!-- common libraries. required for every page-->
<script src="resources/build/bootstrap/vendor/jquery/dist/jquery.min.js"></script>
<script src="resources/build/bootstrap/vendor/jquery-pjax/jquery.pjax.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/transition.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/collapse.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/dropdown.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/button.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/alert.js"></script>
<script src="resources/build/bootstrap/vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="resources/build/bootstrap/vendor/widgster/widgster.js"></script>
<script src="resources/build/bootstrap/vendor/pace.js/pace.js" data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
<script src="resources/build/bootstrap/vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>
<script src="resources/build/bootstrap/vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>

<!-- common app js -->
<script src="resources/build/bootstrap/js/settings.js"></script>
<script src="resources/build/bootstrap/js/app.js"></script>


<!-- page specific libs -->
<script id="test" src="resources/build/bootstrap/vendor/underscore/underscore.js"></script>
<script src="resources/build/bootstrap/vendor/jquery.sparkline/index.js"></script>
<script src="resources/build/bootstrap/vendor/jquery.sparkline/index.js"></script>
<script src="resources/build/bootstrap/vendor/d3/d3.min.js"></script>
<script src="resources/build/bootstrap/vendor/rickshaw/rickshaw.min.js"></script>
<script src="resources/build/bootstrap/vendor/raphael/raphael-min.js"></script>
<script src="resources/build/bootstrap/vendor/jQuery-Mapael/js/jquery.mapael.js"></script>
<script src="resources/build/bootstrap/vendor/jQuery-Mapael/js/maps/usa_states.js"></script>
<script src="resources/build/bootstrap/vendor/jQuery-Mapael/js/maps/world_countries.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/popover.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap_calendar/bootstrap_calendar/js/bootstrap_calendar.min.js"></script>
<script src="resources/build/bootstrap/vendor/jquery-animateNumber/jquery.animateNumber.min.js"></script>

<!-- page specific js -->
<script type="text/javascript" src="resources/Js/ajaxView.js"> </script> 
<script src="resources/build/bootstrap/js/index.js"></script> 
</html>