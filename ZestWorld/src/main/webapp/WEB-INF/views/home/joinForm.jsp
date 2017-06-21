<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ZestWorld - SignUp</title>
<link href="resources/build/bootstrap/css/application.min.css" rel="stylesheet">
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
<style type="text/css">
.preView {
	width: 70px;
	height: 70px;
	text-align: center;
	border: 1px solid silver;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$.fn.setPreview = function(opt) {
		"use strict"
		var defaultOpt = {
			inputFile : $(this),
			img : null,
			w : 200,
			h : 200
		};
		$.extend(defaultOpt, opt);

		var previewImage = function() {
			if (!defaultOpt.inputFile || !defaultOpt.img)
				return;

			var inputFile = defaultOpt.inputFile.get(0);
			var img = defaultOpt.img.get(0);

			// FileReader
			if (window.FileReader) {
				// image 파일만
				if (!inputFile.files[0].type.match(/image\//))
					return;

				// preview
				try {
					var reader = new FileReader();
					reader.onload = function(e) {
						img.src = e.target.result;
						img.style.width = defaultOpt.w + 'px';
						img.style.height = defaultOpt.h + 'px';
						img.style.display = '';
					}
					reader.readAsDataURL(inputFile.files[0]);
				} catch (e) {
					// exception...
				}
				// img.filters (MSIE)
			} else if (img.filters) {
				inputFile.select();
				inputFile.blur();
				var imgSrc = document.selection.createRange().text;

				img.style.width = defaultOpt.w + 'px';
				img.style.height = defaultOpt.h + 'px';
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
						+ imgSrc + "\")";
				img.style.display = '';
				// no support
			} else {
				// Safari5, ...
			}
		};

		// onchange
		$(this).change(function() {
			previewImage();
		});
	};

	$(document).ready(function() {
		var opt = {
			img : $('#img_preview'),
			w : 200,
			h : 200
		};

		$('#input_file').setPreview(opt);
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
					<i class="fa fa-circle text-gray"></i> Sign Up <i
						class="fa fa-circle text-warning"></i>
				</h5>
				<section class="widget widget-login animated fadeInUp"> <header>
				<h3>Welcome to ZestWorld</h3>
				</header>
				<div class="widget-body">
					<c:url value="" var="loginURL" />
					<%-- <form name="f" action="${loginURL}" method="post" class="login-form mt-lg"> --%>
					<form action="${loginURL}" method="post" class="login-form mt-lg">
						<!-- 이메일 -->
						<div class="form-group">
							<input type="text" name="user_id" class="form-control"
								id="exampleInputEmail1" placeholder="email">
						</div>
						<!-- 비번 -->
						<div class="form-group">
							<input name="password" class="form-control" id="pswd" type="text"
								placeholder="Password">
						</div>
						<!-- 이름 -->
						<div class="form-group">
							<input name="name" class="form-control" id="" type="text"
								placeholder="Name">
						</div>
						<!-- 폰번호 -->
						<div class="form-group">
							<input name="phone" class="form-control" id="pswd" type="text"
								placeholder="Phone'-'빼고입력해주세요">
						</div>
						<div class="clearfix">
							<!-- 사진 업로드 -->
							<!-- <input type="file" id="input_file" /> <br /> <img
								id="img_preview" style="display: none;" /> -->


							<!-- 회원가입  -->
							<button type="button" class="btn btn-secondary btn-sm"
								onclick="location.href='index.htm' ">Cancel</button>
							<button type="submit" class="btn btn-inverse btn-sm">Sign up</button>
							<!-- <a class="btn btn-inverse btn-sm" href="index.html">Login</a> -->
						</div>
						</form>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-push-6">
						<div class="clearfix"></div>

					</div>


				</div>

				</section>
			</div>

			</section>

		</div>
	</div>

	</main>
	</div>

</body>

</html>