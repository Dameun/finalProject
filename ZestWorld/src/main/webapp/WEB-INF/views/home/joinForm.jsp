<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body class="login-page">
	 <main id="content" class="widget-login-container" role="main">
        <div class="row">
            <div class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
                <h4 class="widget-login-logo animated fadeInUp">
                    <i class="fa fa-circle text-gray"></i>
                    sing
                    <i class="fa fa-circle text-warning"></i>
                </h4>
                <section class="widget widget-login animated fadeInUp">
                    <header>
                        <h3>Login to your Sing App</h3>
                    </header>
                    
					<form action="" method="post">
						<div class="login">
							<div class="login-screen">
								<div class="app-title">
									<h1>회원가입</h1>
								</div>
			
								<div class="login-form">
									<div class="form-group">
										<input type="text" class="login-field" value=""
											placeholder="username" id="login-name" name="userid"> <label
											class="login-field-icon fui-user" for="login-name"></label>
									</div>
			
									<div class="form-group">
										<input type="password" class="login-field" value=""
											placeholder="password" id="login-pass" name="password">
										<label class="login-field-icon fui-lock" for="login-pass"></label>
									</div>
									 <div class="clearfix">
		                                <div class="btn-toolbar pull-right">
		                                    <button type="submit" class="btn btn-default btn-sm" onclick="location.href='join.htm' ">회원가입</button>
		                           
		                                </div>
		                            </div>
								
								</div>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</main>
</body>
	<!--     <form action="" method="post">
         	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>회원가입</h1>
			</div>

			<div class="login-form">
				<div class="control-group">
				<input type="text" class="login-field" value="" placeholder="username" id="login-name" name="userid">
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>

				<div class="control-group">
				<input type="password" class="login-field" value="" placeholder="password" id="login-pass" name="password">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>

					 <button type="submit" class="btn btn-primary btn-block btn-flat">가입좀되라..</button>
				<a class="login-link" href="#">Lost your password?</a>
			</div>
		</div>
	</div>
</form>
        <a href="index.htm" class="text-center">I already have a membership</a>
   
</body> -->
</html>