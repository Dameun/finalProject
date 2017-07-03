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
<!-- <script src="assets/js/jquery-1.11.1.min.js"></script>
   <script src="assets/bootstrap/js/bootstrap.min.js"></script>
   <script src="assets/js/jquery.backstretch.min.js"></script>
   <script src="assets/js/wow.min.js"></script>
   <script src="assets/js/retina-1.1.0.min.js"></script>
   <script src="assets/js/jquery.magnific-popup.min.js"></script>
   <script src="assets/js/masonry.pkgd.min.js"></script>
   <script src="assets/js/scripts.js"></script>
   <script src="assets/js/modernizr.custom.63321.js"></script>
   
   <script src="ios-7-date-picker.js"></script>
   <script type="text/javascript" src="assets/js/jquery.dropdown.js"></script> -->
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript">

/* 아이디 유효성 */
function idchkclk() { 
      
            $.ajax({
               type:"get",
               url:"idchk.htm",
               data:{"user_id": $('#user_id').val().toLowerCase()},
               success:function(data){
                  console.log("idchclk: "+data)
                  console.log(data);
                  if(data.result == "success"){
                     $("#idselect").html("중복되는 아이디입니다"); 
                   $('#user_id').focus();
                  
                  }else{
                   
                     $("#idselect").html("사용가능한 아이디 입니다");
                    $('#user_id').focus();
                  }
               },
               error:function(){ //값이 안넘오 오나보네
                  $("#idselect").html("에러 입니다");   
               }
            });
            
            $('#user_id').keyup(function(){
               var idRex = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                   
                   if(idRex.test($('#user_id').val())){
                      $('#idselect').html("이메일 중복검사 버튼을 눌러주세요");
                   }else{
                      $('#idselect').html("알맞은 이메일 형식으로 작성해주세요");
                   } 
                });
            $('#name').keyup(function(){
                var regNm = /^[가-힣]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}$/;
                   
                   if(regNm.test($('#name').val())){
                      $('#namelb').html("유효합니다");
                   }else{
                      $('#namelb').html("다시 확인해주세요");
                   } 
                });
           
        
   //핸드폰번호 유효성 검사
      $('#phone').keyup(function() {

         var phoneRex = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;

         if (phoneRex.test($('#phone').val())) {
            $('#phonelbl').html("전화번호가 유효합니다");
         } else {
            $('#phonelbl').html("'-' 빼고입력해주세요 ");
         }

      });

      

      //비밀번호 유효성 검사
      $('#password').keyup(function() {

         var regPw = /^[a-z0-9]{6,10}$/;

         if (regPw.test($('#password').val())) {
            $('#passwordlb').html("");
         } else {
            $('#passwordlb').html(" 6자이상 10자이하로 입력해주세요");
         }

      });

   }

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
               <form action="${loginURL}" method="post" class="login-form mt-lg" id="registerForm">
                  <!-- 이메일 -->
                  <div class="form-group">
                  <div class="input-group">
                     <input type="text" name="user_id" class="form-control"
                        id="user_id" placeholder="Email" required="required">
                        
                        <div class="input-group-btn">
                       <button type="button" id="idchk" name="idchk" class="btn btn-inverse mb-xs" value="이메일 중복확인" onclick="idchkclk()">중복확인</button>
                 		</div>
                 		
                 	</div>
                 	<div class="form-group">
                 		<label id="idselect" class="col-md-12" for="user_id" ></label>
                 		</div>
                  </div>
                  <!-- 비번 -->
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								id="password" required="required" placeholder="Password" >
								<label class="col-md-12" id="passwordlb"></label>
						</div>
						<!-- 이름 -->
						<div class="form-group">
							<input name="name" class="form-control" id="name" type="text"
								placeholder="Name">  
								
								
						</div>
						<!-- 폰번호 -->
						<div class="form-group">
							<input type="text" name="phone" id="phone" class="form-control"
								required="required" placeholder="Phone"> <label
								class="col-md-12" for="phone" id="phonelbl"></label>
						</div>

						<!-- 회원가입  -->
                     <button type="button" class="btn btn-secondary btn-sm"
                        onclick="location.href='index.htm' ">Cancel</button>
                     <button type="submit" class="btn btn-inverse btn-sm">Sign up</button>
                  </form>
                  </div>
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
   </main>
</body>

</html>