<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>ZESTWORLD - Login</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link href="resources/build/bootstrap/css/application.min.css" rel="stylesheet">
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
    <link rel="shortcut icon" href="img/favicon.png">
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

<script type="text/javascript">
function CreateWorkspace()
{
	
	console.log('CreateWorkspace');
	$.ajax({
		type:"get",
		url:"addWorkspace.ajax",
		success:function(data){
			
			$("#contentDiv").append( $('#contentDiv').html(data)); 		
		},
		error:function(){
			alert('error');
		},
	});	
}
</script>
</head>
<body>
<div id="contentDiv"  style="display:inline;overflow-x:auto;">

 	<div class="container">
 	   
    <main id="content" class="widget-login-container">
    <div class="clearfix">
                                <div class="btn-toolbar pull-right">
                                    <button type="button" class="btn btn-secondary btn-sm" onclick="CreateWorkspace()" >+ Create Workspace</button>
                                    <!-- <a class="btn btn-inverse btn-sm" href="index.html">Login</a> -->
                                </div>
                     </div>
        <div class="row">
		 		<c:forEach items="${workspaceList}" var="workSpace">
				<div class="col-md-3"style="padding-bottom:20px;">
		                <div class="live-tile flip ha" data-mode="flip" data-direction="horizontal" data-speed="600" data-delay="3000" data-height="373" data-play-onhover="true" style="height: 373px;">
		                    <div class="flip-front ha" style="transform: rotateY(360deg); transition: all 600ms ease 0s;">
		                        <section class="widget windget-padding-lg widget-md bg-gray-dark text-white">
		                            <div class="widget-body widget-body-container">
		                                <div class="text-align-center">
		                                    <i class="glyphicon glyphicon-globe text-warning fa-5x"></i>
		                                </div>
		                                <h3 class="fw-normal">${workSpace.workspace_name}</h3>
		                                <div class="widget-footer-bottom">
		                                    <div class="mb-sm">${workSpace.description}</div>
		                                    <p><button class="btn btn-default btn-block"  onclick="location.href='selectWorkspace.htm?selectWorkspaceID=${workSpace.workspace_id}'">Enter</button></p>
		                                </div>
		                            </div>
		                        </section>
		                    </div>
		                    <div class="flip-back ha" style="transform: rotateY(540deg); transition: all 600ms ease 0s;">
		                        <section class="widget windget-padding-lg widget-md">
		                            <div class="widget-body widget-body-container">
		                                <div class="text-align-center">
		                                    <i class="fa fa-globe text-primary fa-5x"></i>
		                                </div>
		                                <h3 class="fw-normal">참여 맴버:)</h3>
		                                <div class="widget-footer-bottom">
		                                    <div class="mb-sm">dbsl@naver.com /zest@kosta.com </div>
		                                    <p><button class="btn btn-gray btn-block"  onclick="location.href='selectWorkspace.htm?selectWorkspaceID=${workSpace.workspace_id}'">Enter</button></p>
		                                </div>
		                            </div>
		                        </section>
		                    </div>
		                </div>
		            </div>
		            </c:forEach>
		           
           </div>
      </main>
    </div>
</div>
</body>
</html>