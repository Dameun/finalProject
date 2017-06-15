<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Login</title>
    <link href="./build/bootstrap/css/application.min.css" rel="stylesheet">
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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="http://www.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min.js"></script>
   <script type="text/javascript">
function search() {
	if ((pwsearch.userid.value != null)&&(pwsearch.phone.value != null)){
		pwsearch.submit();
	} else if (pwsearch.userid.value == null) {
		alert("아이디를 입력하세요.")
	} else if (pwsearch.phone.value == null) {
		alert("아이디를 입력하세요.")
	} 

}

</script>
</head>
<body class="l	ogin-page">

	<div class="container">
		<main id="content" class="widget-login-container" role="main">
		<div class="row">
			<div
				class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
				<h4 class="widget-login-logo animated fadeInUp">
					<i class="fa fa-circle text-gray"></i> 로그인 <i
						class="fa fa-circle text-warning"></i>
				</h4>
				<section class="widget widget-login animated fadeInUp"> <header>
				<h3>welcome to the zestworld</h3>
				</header>
				<div class="widget-body">
					<p class="widget-login-info">다들고생했습니다</p>
					<p class="widget-login-info">이쁘게봐주세요</p>
					<c:url value="/login" var="loginURL" />
					<form name="f" action="${loginURL}" method="post"
						class="login-form mt-lg">
						<div class="form-group">
							<input type="text" name="username" class="form-control"
								id="exampleInputEmail1" placeholder="email">
						</div>
						<div class="form-group">
							<input name="password" class="form-control" id="pswd" type="text"
								placeholder="Password">


						</div>

						<div class="clearfix">
							<div class="btn-toolbar pull-right">
								<!-- 회원가입  -->
								<button type="button" class="btn btn-default btn-sm"
									onclick="location.href='join.htm' ">회원가입 하러가기</button>
								<button type="submit" class="btn btn-default btn-sm">Login</button>
								<!-- <a class="btn btn-inverse btn-sm" href="index.html">Login</a> -->
							</div>
						</div>

					</form>
				</div>

				<div class="row">
					<div class="col-sm-6 col-sm-push-6">
						<div class="clearfix">
							<!-- <div class="checkbox widget-login-info pull-right ml-n-lg">
                                            <input type="checkbox" id="checkbox1" value="1">
                                            <label for="checkbox1">Keep me signed in </label>
                                        </div> -->
						</div>
					</div>
				</div>
				</section>
			<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">비밀번호 변경</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호 찾기</h4>
        </div>
        <div class="modal-body">
         <!-- 내용 -->
         	<c:url value="/sendpw.htm" var="loginURL"/>
<form action="${loginURL}" name="pwsearch" method="post"  id="pwsearch" >
         <tr>
			<td>아이디</td>
			<td><input type="text" name="userid"/></td>
		</tr>
		<tr>
			<td>phone</td>
			 <td><input type="text" name="phone" /></td> 
		</tr>
		<!-- <tr align="center">
			<td colspan="2">
			<input type="button" value="비밀번호 찾기 " onclick="search()" /></td>
			
		</tr> -->
         </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="search()">전송</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
			

		</div>
		</main>
		</div>

</body>


     <%--  <c:url value="/login" var="loginURL"/>
      <form name="f" action="${loginURL}" method="post">
   <div class="login">
      <div class="login-screen">
         <div class="app-title">
            <h1>Login</h1>
         </div>

         <div class="login-form">
            <div class="control-group">
            <input type="text" class="login-field" value="" placeholder="username" id="login-name" name="username">
            <label class="login-field-icon fui-user" label for="uid"></label>
            </div>

            <div class="control-group">
            <input type="password" class="login-field" value="" placeholder="password" id="login-pass" name="password">
            <label class="login-field-icon fui-lock" label for="pwd"></label>
            </div>
            
            
                <div class="control-group">
             <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
               </div>
       
            <!-- <a class="login-link" href="#">Lost your password?</a>  -->
            <div class="control-group">
             <button type="button" onclick="location.href='join.htm' " class="btn btn-primary btn-block btn-flat">회원가입</button>
               </div>
         </div>
            <!-- <a class="login-link" href="#">Lost your password?</a>  -->
         </div>
      </div>
   </div>
   </form>
   
   
   
      <c:if test="${param.error != null}">
         <div>
            로그인 실패<br>
             <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                  이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
              </c:if>
         </div>      
      </c:if>
   </div>    --%>

</html>