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
<link href="./resource/build/bootstrap/css/application.min.css" rel="stylesheet">
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
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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


/* function Edit()
{
	var imgSrc = $("#myImg").attr("src")
	
	
	console.log(imgSrc); // Outputs: "Hello World!"
	
	alert($("#exampleInputEmail1").val()+ btoa(imgSrc)+$("#pswd").val()+$("#name").val()+$("#phone").val());
	
	$.ajax({
		type:"post",
		url:"updateUser.htm",
		data: { "user_id"   : $("#exampleInputEmail1").val(),
			    "file"     : imgSrc,
			    "password" : $("#pswd").val(),
			    "name"     : $("#name").val(),
			    "phone"    : $("#phone").val()
 		},
		
	
		success:function(data){
			//data값이 성공일때 
			//수정되었씁니다 팝업창후 
			//ajaxView('');
		
			alert('수정되었습니다~'); 	
			ajaxView('joinEdit.ajax');
		
		},
		error:function(){
			alert('검색 에러! 관리자에게 문의하세요');
		}
		
	});
}  
 */
</script>
</head>

<c:set var="member" value="${member}"/>
   <div class="container" style="margin-top:-100px;">
      <main id="content" class="widget-login-container" role="main">
      <div class="row">
         <div
            class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
            <h4 class="widget-login-logo animated fadeInUp">
               <i class="fa fa-circle text-gray"></i> 회원정보 수정 <i
                  class="fa fa-circle text-warning"></i>
            </h4>
            <section class="widget widget-login animated fadeInUp"> 
            <div class="widget-body">
              
             <c:url value="/updateUser.htm" var="loginURL" /> 
               <form action="${loginURL}" method="post" id="userEdit"enctype="multipart/form-data">
              <div class="form-group" style="text-align:center;">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                            <div id="fileinput"class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                <img name ="img"  id="filename" src="upload/${member.img}" data-holder-rendered="true" style="height: 100%; width: 100%; display: block;">
                                            <!--data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTkwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE5MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MTAwJQpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNS4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnMvPjxyZWN0IHdpZHRoPSIxOTAiIGhlaWdodD0iMTQwIiBmaWxsPSIjRUVFRUVFIi8+PGc+PHRleHQgeD0iNjkuMDQ2ODc1IiB5PSI3MCIgc3R5bGU9ImZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjE5MHgxNDA8L3RleHQ+PC9nPjwvc3ZnPg==-->
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                                            <div>
                                                <span class="btn btn-default btn-file"><span class="fileinput-new">Select Image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
                                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                            </div>
                                        </div>
                                        
                                        <!-- <span class="fileinput-new" id="myBtn">Select image</span> -->
                 </div>
                  <!-- 이메일 -->
                  <div class="form-group">
                     <input type="text" name="user_id" class="form-control"
                        id="exampleInputEmail1" placeholder="email" value="${member.user_id}" readonly>
                  </div>
                  <!-- 비번 -->
                  <div class="form-group">
                     <input name="password" class="form-control" id="pswd" type="password"
                        placeholder="Password" value="${member.password}">
                  </div>
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
                  
               </form>
               </div>
            </section>
         </div>
      </div>
      </main>
   </div>
   <!-- page specific libs -->
<script src="./resource/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
<script src="./resource/build/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/modal.js"></script>
<script src="./resource/build/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="./resource/build/bootstrap/vendor/jquery-autosize/jquery.autosize.min.js"></script>
<script src="./resource/build/bootstrap/vendor/bootstrap3-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script>
<script src="./resource/build/bootstrap/vendor/bootstrap3-wysihtml5/src/bootstrap3-wysihtml5.js"></script>
<script src="./resource/build/bootstrap/vendor/select2/select2.min.js"></script>
<script src="./resource/build/bootstrap/vendor/switchery/dist/switchery.min.js"></script>
<script src="./resource/build/bootstrap/vendor/moment/min/moment.min.js"></script>
<script src="./resource/build/bootstrap/vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="./resource/build/bootstrap/vendor/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="./resource/build/bootstrap/vendor/jasny-bootstrap/js/inputmask.js"></script>
<script src="./resource/build/bootstrap/vendor/jasny-bootstrap/js/fileinput.js"></script>
<script src="./resource/build/bootstrap/vendor/holderjs/holder.js"></script>
<script src="./resource/build/bootstrap/vendor/dropzone/dist/min/dropzone.min.js"></script>
<script src="./resource/build/bootstrap/vendor/markdown/lib/markdown.js"></script>
<script src="./resource/build/bootstrap/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="./resource/build/bootstrap/vendor/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>
<script src="./resource/build/bootstrap/vendor/jquery/dist/jquery.min.js"></script>

<!-- page specific js -->
<script src="./resource/build/bootstrap/js/form-elements.js"></script>


</html>