<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="col-md-12" style="background-color:black">
	
                <section class="widget">
                
                    <header>
                        <h4>
                        	<span class="fw-semi-bold">Template</span>
                        </h4>
                        <div class="widget-controls">
                           <!-- <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a data-widgster="close" href="#"><i class="glyphicon glyphicon-remove"></i></a> -->
                        </div>
                    </header>
                    
                    <div class="widget-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="hidden-xs">NO.</th>
                                <th class="hidden-xs">작성자</th>
                                <th class="hidden-xs">제목</th>
                                <th class="hidden-xs">설명</th>
                                <th class="hidden-xs">업로드 날짜</th>
                                <th class="hidden-xs">용량</th>
                                <th class="hidden-xs">내려받기</th>
                                <th></th>
                            </tr>
                            </thead>
                            
                            
                            
                            <tbody>
                            <tr id="uploadTable">
                                <td class="hidden-xs">
                                1
                                </td> 
                                
                                
                                
                                <td class="width-150">
                                 	<%-- <c:forEach items="${category}" var="n">
										<option value="${n.category_id}">${n.title}</option>		
									</c:forEach> --%>
									황이준
                                </td>
                                
                                <td>
                                    	코알라
                                </td>
                                
                                <td class="hidden-xs">
                                    <p class="no-margin">
                                        <small>
                                           <!--  <span class="fw-semi-bold">Type:</span>
                                            <span class="text-semi-muted">&nbsp; JPEG</span> -->
                                            		설명
                                        </small>
                                    </p>
                                   <!--  <p>
                                        <small>
                                            <span class="fw-semi-bold">Dimensions:</span>
                                            <span class="text-semi-muted">&nbsp; 200x150</span>
                                        </small>
                                    </p> -->
                                 </td> 
                                
                                <td class="hidden-xs text-semi-muted">
                                    17/06/23
                                </td>
                                
                                <td class="hidden-xs text-semi-muted">
                                    45.6 KB
                                </td>
                                
                                <td class="hidden-xs text-semi-muted">
                                     <button type="button" id="download" name="download" class="glyphicon glyphicon-download">
                                </td>
                                
                                
                                
                                <!-- <td class="width-150">
                                    <div class="progress progress-sm mt-xs js-progress-animate">
                                    	<div class="progress-bar progress-bar-success" data-width="35%" style="width: 35%;"></div>
                                    </div>
                                </td> -->
                                
                            </tr>
                            
                            
                            <!-- <tr>
                                <td class="hidden-xs">2</td>
                                <td>
                                    <img class="img-rounded" src="demo/img/pictures/2.jpg" alt="" height="50">
                                </td>
                                <td>
                                    The Sky
                                </td>
                                <td class="hidden-xs">
                                    <p class="no-margin">
                                        <small>
                                            <span class="fw-semi-bold">Type:</span>
                                            <span class="text-semi-muted">&nbsp; PSD</span>
                                        </small>
                                    </p>
                                    <p>
                                        <small>
                                            <span class="fw-semi-bold">Dimensions:</span>
                                            <span class="text-semi-muted">&nbsp; 2400x1455</span>
                                        </small>
                                    </p>
                                </td>
                                <td class="hidden-xs text-semi-muted">
                                    November 14, 2012
                                </td>
                                <td class="hidden-xs text-semi-muted">
                                    15.3 MB
                                </td>
                                <td class="width-150">
                                    <div class="progress progress-sm mt-xs js-progress-animate">
                                        <div class="progress-bar progress-bar-warning" data-width="33%" style="width: 33%;"></div>
                                    </div>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td class="hidden-xs">3</td>
                                <td>
                                    <img class="img-rounded" src="demo/img/pictures/3.jpg" alt="" height="50">
                                </td>
                                <td>
                                    Down the road
                                    <br>
                                    
                                </td>
                                <td class="hidden-xs">
                                    <p class="no-margin">
                                        <small>
                                            <span class="fw-semi-bold">Type:</span>
                                            <span class="text-semi-muted">&nbsp; JPEG</span>
                                        </small>
                                    </p>
                                    <p>
                                        <small>
                                            <span class="fw-semi-bold">Dimensions:</span>
                                            <span class="text-semi-muted">&nbsp; 200x150</span>
                                        </small>
                                    </p>
                                </td>
                                <td class="hidden-xs text-semi-muted">
                                    September 14, 2012
                                </td>
                                <td class="hidden-xs text-semi-muted">
                                    49.0 KB
                                </td>
                                <td class="width-150">
                                    <div class="progress progress-sm mt-xs js-progress-animate">
                                        <div class="progress-bar progress-bar-gray" data-width="38%" style="width: 38%;"></div>
                                    </div>
                                </td>
                                
                                
                            </tr>
                            <tr>
                                <td class="hidden-xs">4</td>
                                <td>
                                    <img class="img-rounded" src="demo/img/pictures/4.jpg" alt="" height="50">
                                </td>
                                <td>
                                    The Edge
                                </td>
                                <td class="hidden-xs">
                                    <p class="no-margin">
                                        <small>
                                            <span class="fw-semi-bold">Type:</span>
                                            <span class="text-semi-muted">&nbsp; PNG</span>
                                        </small>
                                    </p>
                                    <p>
                                        <small>
                                            <span class="fw-semi-bold">Dimensions:</span>
                                            <span class="text-semi-muted">&nbsp; 210x160</span>
                                        </small>
                                    </p>
                                </td>
                                <td class="hidden-xs text-semi-muted">
                                    September 15, 2012
                                </td>
                                <td class="hidden-xs text-semi-muted">
                                    69.1 KB
                                </td>
                                <td class="width-150">
                                    <div class="progress progress-sm mt-xs js-progress-animate">
                                        <div class="progress-bar progress-bar-danger" data-width="17%" style="width: 17%;"></div>
                                    </div>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td class="hidden-xs">5</td>
                                <td>
                                    <img class="img-rounded" src="demo/img/pictures/11.jpg" alt="" height="50">
                                </td>
                                <td>
                                    Fortress
                                </td>
                                <td class="hidden-xs">
                                    <p class="no-margin">
                                        <small>
                                            <span class="fw-semi-bold">Type:</span>
                                            <span class="text-semi-muted">&nbsp; JPEG</span>
                                        </small>
                                    </p>
                                    <p>
                                        <small>
                                            <span class="fw-semi-bold">Dimensions:</span>
                                            <span class="text-semi-muted">&nbsp; 1452x1320</span>
                                        </small>
                                    </p>
                                </td>
                                <td class="hidden-xs text-semi-muted">
                                    October 1, 2012
                                </td>
                                <td class="hidden-xs text-semi-muted">
                                    2.3 MB
                                </td>
                                <td class="width-150">
                                    <div class="progress progress-sm mt-xs js-progress-animate">
                                        <div class="progress-bar" data-width="41%" style="width: 41%;"></div>
                                    </div>
                                </td>
                            </tr> -->
                            
                            
                            </tbody>

                        </table>
                        <div class="clearfix">
                            <div class="pull-right">
                     	 	 	
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModal">
	         						 파일 업로드
									</button>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="#">Clear</a></li>
                                        <li><a href="#">Move ...</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                </section>

</div>

</body>
</html>