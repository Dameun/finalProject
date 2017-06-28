<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
   request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ZestWorld</title>
<link href="resources/build/bootstrap/css/application.min.css" rel="stylesheet">
<!--  as of IE9 cannot parse css files with more that 4K classes separating in two files
[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]
<link rel="shortcut icon" href="img/favicon.png">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
<script>
   /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
    chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
    https://code.google.com/p/chromium/issues/detail?id=332189
    */
</script>
<style type="text/css">
.preView {
   width: 70px;
   height: 70px;
   text-align: center;
   border: 1px solid silver;
}
</style>

<script type="text/javascript">
</script>
</head>
<body class="nav-collapsed chat-sidebar-container pace-done">

<div class="container">
<c:set var="member" value="${member}"/>
<h3>${member.name} - <span class="fw-semi-bold">Profile</span></h3>
      <div class="row">
         <div class="col-xs-12 col-sm-6 col-md-6">
           <div class="well well-sm">
              <div class="row">
	           
	            	<c:url value="/updateUser.htm" var="loginURL" /> 
               <form action="${loginURL}"method="post" id="userEdit"enctype="multipart/form-data">
            <!--   <div class="form-group" style="text-align:center;"> -->
               <div class="col-sm-4 col-md-4" style="text-align:center;">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                        
                                            <div id="fileinput" class="fileinput-new thumbnail" style="width: 230px; height: 250px;">
                                                <img name ="img" class="img-rounded img-responsive" src="upload/${member.img}" data-holder-rendered="true" style="height: 100%; width: 100%; display: block;">
                                            <!--data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTkwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE5MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MTAwJQpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNS4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnMvPjxyZWN0IHdpZHRoPSIxOTAiIGhlaWdodD0iMTQwIiBmaWxsPSIjRUVFRUVFIi8+PGc+PHRleHQgeD0iNjkuMDQ2ODc1IiB5PSI3MCIgc3R5bGU9ImZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjE5MHgxNDA8L3RleHQ+PC9nPjwvc3ZnPg==-->
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail" ></div>
                                            <div>
                                                <span class="btn btn-default btn-file"><span class="fileinput-new">Select Image</span><span class="fileinput-exists">Change</span>
                                                <input type="file" name="file"></span>
                                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                            </div>
                                        </div>
                          </div>              
                                        <!-- <span class="fileinput-new" id="myBtn">Select image</span> -->
              <!--    </div> -->
                  <!-- 이메일 -->
                   <div class="col-sm-6 col-md-8" style="padding-left:80px;">
                    <h2>
                            ${member.name }</h2>
                            <hr>
                  <div class="form-group">
                     <input type="text" name="user_id" class="form-control"
                        id="exampleInputEmail1" placeholder="email" value="${member.user_id}" readonly>
                  </div>
                  <!-- 비번 -->
                  <%-- <div class="form-group">
                     <input name="password" class="form-control" id="pswd" type="password"
                        placeholder="Password" value="${member.password}">
                  </div> --%>
                  <!-- 이름 -->
                  <div class="form-group">
                     <input name="name" class="form-control" id="name" type="text"
                        placeholder="Name" value="${member.name}" readonly>
                  </div>
                  <!-- 폰번호 -->
                  <div class="form-group">
                     <input name="phone" class="form-control" id="phone" type="text"
                        placeholder="핸드폰'-'빼고입력해주세요"value="${member.phone }">
                  </div>
                  <div class="clearfix" style="text-align:center;">
                 

                     <!-- 회원정보 수정  -->
                     <button type="reset" class="btn btn-default btn-file"
                       >취소</button>
                     <button type="submit"  id="myEdit"class="btn btn-default btn-file">수정</button>
                     <!-- <a class="btn btn-inverse btn-sm" href="index.html">Login</a> -->
                  </div>
                  </div>
               </form>
	    		</div>
            <div class="widget-body">
              
             
               </div>
         </div>
         </div>
      </div>
</div>
   </div>
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
   <!-- page specific libs -->
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/modal.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="resources/build/bootstrap/vendor/jquery-autosize/jquery.autosize.min.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap3-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap3-wysihtml5/src/bootstrap3-wysihtml5.js"></script>
<script src="resources/build/bootstrap/vendor/select2/select2.min.js"></script>
<script src="resources/build/bootstrap/vendor/switchery/dist/switchery.min.js"></script>
<script src="resources/build/bootstrap/vendor/moment/min/moment.min.js"></script>
<script src="resources/build/bootstrap/vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="resources/build/bootstrap/vendor/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="resources/build/bootstrap/vendor/jasny-bootstrap/js/inputmask.js"></script>
<script src="resources/build/bootstrap/vendor/jasny-bootstrap/js/fileinput.js"></script>
<script src="resources/build/bootstrap/vendor/holderjs/holder.js"></script>
<script src="resources/build/bootstrap/vendor/dropzone/dist/min/dropzone.min.js"></script>
<script src="resources/build/bootstrap/vendor/markdown/lib/markdown.js"></script>
<script src="resources/build/bootstrap/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="resources/build/bootstrap/vendor/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>
<script src="resources/build/bootstrap/vendor/jquery/dist/jquery.js"></script>

<!-- page specific js -->
<script src="resources/build/bootstrap/js/form-elements.js"></script>

</body>
</html>