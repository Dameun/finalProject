<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container"style="margin-top:-70px;" >
 <main id="content" class="content" role="main">
      <c:set var="member" value="${member}"/>
       <h4 class="widget-login-logo animated fadeInUp">${member.name} - <span class="fw-semi-bold">Profile</span></h4>
        <div class="row">
            <div class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
                <section class="widget">
                    <div class="widget-body">
                        <div class="widget-top-overflow text-white">
                            <div class="height-250 overflow-hidden">
                                <img class="img-responsive" src="resources/img/pictures/19.jpg">
                            </div>
                            <div class="btn-toolbar">
                              <!--   <a href="#" class="btn btn-outline btn-sm pull-right">
                                    <i class="fa fa-twitter mr-xs"></i>
                                    Follow
                                </a> -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5 text-center">
                                <div class="post-user post-user-profile">
                                    <span class="thumb-xlg">
                                        <img class="img-circle" src="upload/${member.img }" alt="...">
                                    </span>
                                    <h4 class="fw-normal"> <span class="fw-semi-bold">${member.name }</span></h4>
                               <!--      <p>UI/UX designer</p> -->
                                   
                                    <ul class="contacts">
                                        <li><i class="fa fa-phone fa-fw mr-xs"></i><a href="#"> ${member.phone }</a></li>
                                        <li><i class="fa fa-envelope fa-fw mr-xs"></i><a href="#"> ${member.user_id }</a></li>
                                       <li><i class="fa fa-map-marker fa-fw mr-xs"></i><a href="#"> 한국소프트웨어기술진흥협회, KOSTA</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="stats-row stats-row-profile mt text-right">
                              <div class="stat-item">
                                        <a href="#" onclick="ajaxView('joinEdit.ajax')"class="btn btn-danger btn-sm mt">
                                        &nbsp;Edit
                                        <i class="fa fa-edit ml-xs"></i>&nbsp;
                                    </a>
                                    </div>
                                    <!-- <div class="stat-item">
                                        <p class="value">9.38%</p>
                                        <h5 class="name">Conversion</h5>
                                    </div>
                                    <div class="stat-item">
                                        <p class="value">842</p>
                                        <h5 class="name">Followers</h5>
                                    </div> -->
                                </div>
                            <!--     <p class="text-right mt-lg">
                                    <a href="#" class="label label-warning"> UI/UX </a>
                                    <a href="#" class="label label-danger ml-xs"> Web Design </a>
                                    <a href="#" class="label label-default ml-xs"> Mobile Apps </a>
                                </p>
                                <p class="lead mt-lg">
                                    My name is Adam Johns and here is my new Sing user profile page.
                                </p>
                                <p>
                                    I love reading people's summaries page especially those who are in the same industry as me.
                                    Sometimes it's much easier to find your concentration during the night.
                                </p> -->
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