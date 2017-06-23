<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ZestWorld</title>
	<!--  <script type="text/javascript" src="./resource/Js/ajaxView.js"></script> -->
	<!-- <link href="index.css" type="text/css" rel="stylesheet"> -->
</head>
<body class="nav-collapsed chat-sidebar-container pace-done">

            	<tiles:insertAttribute name="header" />
            	<tiles:insertAttribute name="aside" />
     
     <div class="content-wrap">
   
     <main id="content" class="content" role="main">
   
	

		<tiles:insertAttribute name="content" />
		
   	
	</main>
	
</div>
         
</body>
</html>