<%@ page language="java" contentType="text/html; ch arset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>ZestWorld</title>
 
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link href="resources/build/bootstrap/css/application.min.css" rel="stylesheet">
    <!-- 민성 추가부분 (이부분에 안쓰면 modal 자동으로 닫기는 현상이 발생!!) -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- /민성 추가부분 (이부분에 안쓰면 modal 자동으로 닫기는 현상이 발생!!) -->
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
   <!--  <link rel="shortcut icon" href="./resource/img/favicon.png"> -->
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
                        <i class="fa fa-bars fa-lg hidden-xs" ></i>
                    </a>
                </li>
           <!--    <li class="ml-sm mr-n-xs hidden-xs"><a href="#"><i class="fa fa-refresh fa-lg"  style="padding-top:5px;"></i></a></li>
                <li class="ml-n-xs hidden-xs"><a href="#"><i class="fa fa-times fa-lg"  style="padding-top:2px;"></i></a></li> -->
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
		     		 <li class="nav-item nav-item-cta"style="list-style-type: none;">
							<sec:authorize access="!hasRole('ROLE_USER')">
								<a class="btn btn-cta btn-cta-secondary" href="login.htm">로그인</a>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_USER')">
							<sec:authentication property="name" var="loginUser" />
							<a style="padding-top:10px;" class="btn btn-cta btn-cta-secondary" href="${pageContext.request.contextPath}/logout">${loginUser}님 로그아웃</a>
							</sec:authorize>
								</li>
							<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_USER')">
							</sec:authorize>
							<sec:authorize access="!hasRole('ROLE_USER')">
							<li class="nav-item nav-item-cta last">
								<a class="btn btn-cta btn-cta-secondary" href="join.htm">회원가입</a>
							</li>
							</sec:authorize>
             <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown" id="dropdownid" onclick="AlarmReadCheck()" >
                    <a href="#" class="dropdown-toggle dropdown-toggle-notifications" id="notifications-dropdown-toggle" data-toggle="dropdown"
                   >
                        <span class="thumb-sm avatar pull-left">
                           <!--  <img class="img-circle" src="./resource/img/people/a5.jpg" alt="..."> -->
                        </span>
                        &nbsp;
                        User <strong>User</strong>&nbsp;
                        <span class="circle bg-warning fw-bold" id="alarmCount" name = "alarmCount">
                          	0
                        </span>
                        <b class="caret"></b></a>
                    <!-- ready to use notifications dropdown.  inspired by smartadmin template.
                         consists of three components:
                         notifications, messages, progress. leave or add what's important for you.
                         uses Sing's ajax-load plugin for async content loading. See #load-notifications-btn -->
                    <div class="dropdown-menu animated fadeInUp" id="notifications-dropdown-menu">
                        <section class="panel notifications" >
                            <header class="panel-heading">
                                <div class="text-align-center mb-sm">
                                    <strong>User STATE :D</strong>
                                    <strong>
	                                    <script type="text/javascript">
	                                    	
	                                    </script>
                                    </strong>
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
                            <div id="alarm">
                              
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
          
                <li  style="padding-top:5px;">
                    <a href="#">
                        <i class="fa fa-globe fa-lg"></i>
                    <i class="chat-notification-sing animated bounceIn"></i></a>
                   
                </li>
                <li style="padding-top:5px;">
     				<a href="javascript:popupOpen();" >
            			<i class="fa fa-reddit fa-lg">
            			</i>
            		</a>
            	</li>
          </ul>
        </div>
    </div>
</nav>

<script>
		
		</script>
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

<script type="text/javascript">
//ajaxView에서 connect 성공하면 호출, 알람시 호출

function AlarmCountView() 
{
	console.log("알람 <카운트 표시>");
	$.ajax({
		type:"get",
		url: "alarmCount.ajax",
		success:function(data)
		{
			console.log('alarmCountdata'+data);
			document.getElementById('alarmCount').innerHTML = data;
			AlarmUpdate();
		},
		
		error:function(){
			alert('error:' + "alarmCount.ajax");
		},
	});	
	
}


function AlarmUpdate()
{		
	console.log("알람 <DB>");
	$.ajax({
		type:"get",
		url: "alarmList.ajax",
		success:function(data)
		{
			$('#alarm').empty();
			$('#alarm').html(data); 		
		},
		error:function(){
			alert('error:' + "alarmCount.ajax");
		},
	});		
}

//알람 메세지 들어옴
function AlarmInsert(evt)
{
	console.log("알람 <insert>");

	$.ajax({
		  type:"post",
		  dataType: "html",
		  url:"newAlarm.ajax",
		  data:{"newAlarm": evt.data},
		  success:function(data){
			  AlarmCountView(); // header의 알람 숫자표시 수정
			  // $('#alarm').empty(); 
			  //$('#alarm').html(data);
		  }
	});	

}


//읽음으로 db변경 및 숫자표시 0으로 변경 
function AlarmReadCheck(target)
{
	if( document.getElementById('alarmCount').innerHTML== '0' )
	{
		AlarmUpdate();
	}
	
	//$("#dropdownid").attr("aria-expanded","true");
	$.ajax({
			type:"get",
			url:"updateAlarm.ajax",
			success:function(data){ 
				document.getElementById('alarmCount').innerHTML = '0';
				document.getElementById("dropdownid").setAttribute('class', 'dropdown open');
				
			},
			error:function(){
				alert('error');
			},
	});	
	//AlarmCountView();
	
}

/*
* 선택시 유져 상태 저장 
* 챗봇 데이터 저장시 이용
* parameter : userStateStr
* 01 : 업무
* 02 : 외출
* 03 : 회의
* 04 : 식사
* 
* */
function userState(userStateStr)
	{
		$.ajax({
			type:"get",
			url: "userState.ajax",
			data : "state="+userStateStr,
			success:function(data)
			{
				conselo.log("success");
			},
			
			error:function(){
				alert('error:' + menuName);
			},
		});	
	}



//2017-06-21 은경
function popupOpen() 
{
	var popUrl = "http://192.168.0.152:3000"; //팝업창에 출력될 페이지 URL
	var popOption = "width=380, height=400, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
	window.open(popUrl, "", popOption);
}
//});
</script>
</html>