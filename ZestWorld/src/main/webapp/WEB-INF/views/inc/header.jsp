<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Sing - Dashboard</title>
    <link href="./build/bootstrap/css/application.min.css" rel="stylesheet">
    <!-- 민성 추가부분 (이부분에 안쓰면 modal 자동으로 닫기는 현상이 발생!!) -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- /민성 추가부분 (이부분에 안쓰면 modal 자동으로 닫기는 현상이 발생!!) -->
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
    <link rel="shortcut icon" href="./dist/img/favicon.png">
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
    <script type="text/javascript" src="./Js/ajaxView.js"></script>
  </head>


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
                        <i class="fa fa-bars fa-lg hidden-xs"></i>
                    </a>
                </li>
                <li class="ml-sm mr-n-xs hidden-xs"><a href="#"><i class="fa fa-refresh fa-lg"></i></a></li>
                <li class="ml-n-xs hidden-xs"><a href="#"><i class="fa fa-times fa-lg"></i></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right visible-xs">
                <li>
                    <!-- toggles chat -->
                    <a href="#" data-toggle="chat-sidebar">
                        <span class="rounded rounded-lg bg-gray text-white"><i class="fa fa-globe fa-lg"></i></span>
                    </a>
                </li>
            </ul>
            <!-- xs & sm screen logo -->
            <a class="navbar-brand visible-xs" href="index.html">
                <i class="fa fa-circle text-gray mr-n-sm"></i>
                <i class="fa fa-circle text-warning"></i>
                &nbsp;
                sing
                &nbsp;
                <i class="fa fa-circle text-warning mr-n-sm"></i>
                <i class="fa fa-circle text-gray"></i>
            </a>
        </div>

        <!-- this part is hidden for xs screens -->
        <div class="collapse navbar-collapse">
            <!-- search form! link it to your search server -->
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <div class="input-group input-group-no-border">
                    <span class="input-group-addon">
                        <i class="fa fa-search"></i>
                    </span>
                        <input class="form-control" type="text" placeholder="Search Dashboard">
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle dropdown-toggle-notifications" id="notifications-dropdown-toggle" data-toggle="dropdown">
                        <span class="thumb-sm avatar pull-left">
                            <img class="img-circle" src="demo/img/people/a5.jpg" alt="...">
                        </span>
                        &nbsp;
                        Philip <strong>Smith</strong>&nbsp;
                        <span class="circle bg-warning fw-bold">
                            13
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
                                    <strong>You have 13 notifications</strong>
                                </div>
                                <div class="btn-group btn-group-sm btn-group-justified" id="notifications-toggle" data-toggle="buttons">
                                    <label class="btn btn-default active">
                                        <!-- ajax-load plugin in action. setting data-ajax-load & data-ajax-target is the
                                             only requirement for async reloading -->
                                        <input type="radio" checked="" data-ajax-trigger="change" data-ajax-load="demo/ajax/notifications.html" data-ajax-target="#notifications-list"> Notifications
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio" data-ajax-trigger="change" data-ajax-load="demo/ajax/messages.html" data-ajax-target="#notifications-list"> Messages
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio" data-ajax-trigger="change" data-ajax-load="demo/ajax/progress.html" data-ajax-target="#notifications-list"> Progress
                                    </label>
                                </div>
                            </header>
                            <!-- notification list with .thin-scroll which styles scrollbar for webkit -->
                            <div id="notifications-list" class="list-group thin-scroll">
                                <div class="list-group-item">
                                <span class="thumb-sm pull-left mr clearfix">
                                    <img class="img-circle" src="demo/img/people/a3.jpg" alt="...">
                                </span>
                                    <p class="no-margin overflow-hidden">
                                        1 new user just signed up! Check out
                                        <a href="#">Monica Smith</a>'s account.
                                        <time class="help-block no-margin">
                                            2 mins ago
                                        </time>
                                    </p>
                                </div>
                                <a class="list-group-item" href="#">
                                <span class="thumb-sm pull-left mr">
                                    <i class="glyphicon glyphicon-upload fa-lg"></i>
                                </span>
                                    <p class="text-ellipsis no-margin">
                                        2.1.0-pre-alpha just released. </p>
                                    <time class="help-block no-margin">
                                        5h ago
                                    </time>
                                </a>
                                <a class="list-group-item" href="#">
                                <span class="thumb-sm pull-left mr">
                                    <i class="fa fa-bolt fa-lg"></i>
                                </span>
                                    <p class="text-ellipsis no-margin">
                                        Server load limited. </p>
                                    <time class="help-block no-margin">
                                        7h ago
                                    </time>
                                </a>
                                <div class="list-group-item">
                                <span class="thumb-sm pull-left mr clearfix">
                                    <img class="img-circle" src="demo/img/people/a5.jpg" alt="...">
                                </span>
                                    <p class="no-margin overflow-hidden">
                                        User <a href="#">Jeff</a> registered
                                        &nbsp;&nbsp;
                                        <button class="btn btn-xs btn-success">Allow</button>
                                        <button class="btn btn-xs btn-danger">Deny</button>
                                        <time class="help-block no-margin">
                                            12:18 AM
                                        </time>
                                    </p>
                                </div>
                                <div class="list-group-item">
                                    <span class="thumb-sm pull-left mr">
                                        <i class="fa fa-shield fa-lg"></i>
                                    </span>
                                    <p class="no-margin overflow-hidden">
                                        Instructions for changing your Envato Account password. Please
                                        check your account <a href="#">security page</a>.
                                        <time class="help-block no-margin">
                                            12:18 AM
                                        </time>
                                    </p>
                                </div>
                                <a class="list-group-item" href="#">
                                <span class="thumb-sm pull-left mr">
                                    <span class="rounded bg-primary rounded-lg">
                                        <i class="fa fa-facebook text-white"></i>
                                    </span>
                                </span>
                                    <p class="text-ellipsis no-margin">
                                        New <strong>76</strong> facebook likes received.</p>
                                    <time class="help-block no-margin">
                                        15 Apr 2014
                                    </time>
                                </a>
                                <a class="list-group-item" href="#">
                                <span class="thumb-sm pull-left mr">
                                    <span class="circle circle-lg bg-gray-dark">
                                        <i class="fa fa-circle-o text-white"></i>
                                    </span>
                                </span>
                                    <p class="text-ellipsis no-margin">
                                        Dark matter detected.</p>
                                    <time class="help-block no-margin">
                                        15 Apr 2014
                                    </time>
                                </a>
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
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i> &nbsp; My Account</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Calendar</a></li>
                        <li><a href="#">Inbox &nbsp;&nbsp;<span class="badge bg-danger animated bounceIn">9</span></a></li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out"></i> &nbsp; Log Out</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" data-toggle="chat-sidebar">
                        <i class="fa fa-globe fa-lg"></i>
                    <i class="chat-notification-sing animated bounceIn"></i></a>
                    <div id="chat-notification" class="chat-notification animated fadeOut hide">
                        <div class="chat-notification-inner">
                            <h6 class="title">
                                <span class="thumb-xs">
                                    <img src="demo/img/people/a6.jpg" class="img-circle mr-xs pull-left">
                                </span>
                                Jess Smith
                            </h6>
                            <p class="text">Hey! What's up?</p>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- common libraries. required for every page-->
<script src="./build/bootstrap/vendor/jquery/dist/jquery.min.js"></script>
<script src="./build/bootstrap/vendor/jquery-pjax/jquery.pjax.js"></script>
<script src="./build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/transition.js"></script>
<script src="./build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/collapse.js"></script>
<script src="./build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/dropdown.js"></script>
<script src="./build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/button.js"></script>
<script src="./build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
<script src="./build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/alert.js"></script>
<script src="./build/bootstrap/vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="./build/bootstrap/vendor/widgster/widgster.js"></script>
<script src="./build/bootstrap/vendor/pace.js/pace.js" data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
<script src="./build/bootstrap/vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>
<script src="./build/bootstrap/vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>

<!-- common app js -->
<script src="./build/bootstrap/js/settings.js"></script>
<script src="./build/bootstrap/js/app.js"></script>


<!-- page specific libs -->
<script id="test" src="./build/bootstrap/vendor/underscore/underscore.js"></script>
<script src="./build/bootstrap/vendor/jquery.sparkline/index.js"></script>
<script src="./build/bootstrap/vendor/jquery.sparkline/index.js"></script>
<script src="./build/bootstrap/vendor/d3/d3.min.js"></script>
<script src="./webapp/build/bootstrap/vendor/rickshaw/rickshaw.min.js"></script>
<script src="./build/bootstrap/vendor/raphael/raphael-min.js"></script>
<script src="./build/bootstrap/vendor/jQuery-Mapael/js/jquery.mapael.js"></script>
<script src="./build/bootstrap/vendor/jQuery-Mapael/js/maps/usa_states.js"></script>
<script src="./build/bootstrap/vendor/jQuery-Mapael/js/maps/world_countries.js"></script>
<script src="./build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/popover.js"></script>
<script src="./build/bootstrap/vendor/bootstrap_calendar/bootstrap_calendar/js/bootstrap_calendar.min.js"></script>
<script src="./build/bootstrap/vendor/jquery-animateNumber/jquery.animateNumber.min.js"></script>

<!-- page specific js -->
<script src="./build/bootstrap/js/index.js"></script>

</html>