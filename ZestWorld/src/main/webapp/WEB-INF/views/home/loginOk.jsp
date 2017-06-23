<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ZestWorld - Login</title>
<link href="resources/build/bootstrap/css/application.min.css"
	rel="stylesheet">
<!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
<!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
<link rel="shortcut icon" href="img/favicon.png">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="http://www.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<script type="text/javascript">
	function search() {
		pwsearch.submit();
	}

	//벨리데이션
	$(document).ready(function() {
		$('#registerForm').validate({
			rules : {
				password : "required",
				username : {
					required : true,
					email : true
				}
			},
			messages : {
				password : "암호를 입력하시오.",
				username : {
					required : "이메일을 입력하시오.",
					email : "올바른 이메일을 입력하시오."
				}

			},
			submitHandler : function(frm) {
				frm.submit(); //유효성 검사를 통과시 전송
			},
			success : function(e) {
			}

		});
	});
</script>
</head>
<body class="login-page">

	<div class="container">
		<main id="content" class="widget-login-container" role="main">
		<div class="row">
			<div
				class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">

				<h5 class="widget-login-logo animated fadeInUp">

					<i class="fa fa-circle text-gray"></i> ZESTWORLD <i
						class="fa fa-circle text-warning"></i>
				</h5>
				<section class="widget widget-login animated fadeInUp"> <header>
				<h3>Login to ZestWorld</h3>
				</header>
				<div class="widget-body">

					<c:url value="/login" var="loginURL" />
					<form name="f" action="${loginURL}" method="post"
						class="login-form mt-lg" id="registerForm">
						<div class="form-group">
							<input type="text" name="username" class="form-control"
								id="username" placeholder="email">
						</div>
						<div class="form-group">
							<input name="password" class="form-control" id="password"
								type="password" placeholder="Password">
						</div>
						<div class="clearfix">
							<div class="btn-toolbar pull-xs-right">
								<!-- 회원가입  -->
								<button type="button" class="btn btn-secondary btn-sm"
									onclick="location.href='join.htm' ">Sign up</button>
								<button type="submit" class="btn btn-inverse btn-sm" onclick="location.href='selectWorkspace.htm?selectWorkspaceID=${workSpace.workspace_id}'">Login</button>
								<!-- onclick="location.href='selectWorkspace.htm?selectWorkspaceID=${workSpace.workspace_id}' -->
								<!-- <a class="btn btn-inverse btn-sm" href="index.html">Login</a> -->
							</div>
						</div>
					</form>
					<div class="row">                                                
						<div class="col-md-6 col-md-push-6">
							<div class="clearfix">
								<div
									class="abc-checkbox widget-login-info pull-xs-right ml-n-lg">
									<!--  <input type="checkbox" id="checkbox1" value="1">
                                            <label for="checkbox1">Keep me signed in </label> -->
								</div>
							</div>
						</div>

						<div class="col-md-6 col-md-pull-6">
							<a class="mr-n-lg" href="#myModal" data-toggle="modal"
								data-target="#myModal">비밀번호를 잊으셨나요?</a>
							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog"
								style="padding-left: 30%; width: 70%;">
								<div class="modla-dialog">

									<!-- Modal content-->
									<section class="widget widget-login animated fadeInUp">
									<header>

									<h4 class="modal-title">
										<i class="fa fa-circle text-gray"></i> 임시 비밀번호 받기 <i
											class="fa fa-circle text-warning"></i>
									</h4>
									</header>
									<hr>
									<!-- 내용 --> <c:url value="/sendpw.htm" var="loginURL" />

									<form class="login-form mt-lg" action="${loginURL}"
										name="pwsearch" method="post" id="pwsearch">
										<div class="form-froup">
											<label for="userid"> Email Address </label> <input
												type="text" name="userid" class="form-control"
												placeholder="Email" />
										</div>
										<br/>
										<div class="form-group">
											<label for="phone"> Phone Number</label> <input type="text"
												name="phone" class="form-control" placeholder="'-'빼고입력해주세요" />
										</div>
										<!-- <tr align="center">
			<td colspan="2">
			<input type="button" value="비밀번호 찾기 " onclick="search()" /></td>
		</tr> -->
									</form>
									<div class="row" style="text-align: center;">
										<div class="clearfix">
											<button type="button" class="btn btn-default"
												data-dismiss="modal" onclick="search()">SEND</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">CANCEL</button>
										</div>
									</div>
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
				</section>
			</div>
		</div>
		</main>
	</div>



</body>
</html>