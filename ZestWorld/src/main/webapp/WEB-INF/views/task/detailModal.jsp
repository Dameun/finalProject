<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div class="modal fade" id = "detailModal" role="dialog">
	<div class="modal-dialog modal-lg">
	     	 <div class="modal-content">
    <section class="widget">
        <header>
            <h5>
                <span class="fw-semi-bold">업무 제목</span>
                <small>No JS needed to tune-up</small>
            </h5>
            <div class="widget-controls">
                <a data-widgster="expand" title="Expand" href="#"><i class="glyphicon glyphicon-chevron-up"></i></a>
                <a data-widgster="collapse" title="Collapse" href="#"><i class="glyphicon glyphicon-chevron-down"></i></a>
                <a data-widgster="close" title="Close" href="#"><i class="glyphicon glyphicon-remove" data-dismiss="modal"></i></a>
            </div>
        </header>
        <div class="widget-body">
            <form id="validation-form" class="form-horizontal form-label-left" method="post"
                  data-parsley-priority-enabled="false"
                  novalidate="novalidate">
<!--                 <fieldset>
                    <legend>
                        By default validation is started only after at least 3 characters have been input.
                    </legend>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="basic">Simple required</label>
                            <div class="col-sm-9">
                                <input type="text" id="basic" name="basic" class="form-control"
                                       required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="basic-change">
                                Min-length On Change
                        <span class="help-block">
                            At least 10
                        </span>
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="basic-change" name="basic-change" class="form-control"
                                       data-parsley-trigger="change"
                                       data-parsley-minlength="10"
                                       required="required">
                            </div>
                        </div>
                </fieldset> -->
                <fieldset>
                    <legend>
                        <span class="label label-warning  text-gray-dark mr-xs">
                            HTML5
                        </span>
                        input types supported
                    </legend>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="email">
                               		 위치
                            </label>
                            <div class="col-sm-9">
                            
                            <select id="project2" onchange="projectchange2();">
								<option value="" selected="selected">  </option>
								<c:forEach items="${projectlist}" var="n">
								 	<option value="${n.project_id}" selected="selected">${n.p_title}</option>		
								</c:forEach>
    		        		</select>
    		        		
    		        		<div id="categoryListModal">
    		        		
    		        		
    		        		
    		        		</div>
                         <!--    <div class="clearfix">
					            <div class="btn-toolbar">
					                <div class="btn-group">
					                    <a href="#" data-toggle="dropdown" class="btn dropdown-toggle btn-secondary">
					                        Popular <span class="caret"></span>
					                    </a>
					                    <ul class="dropdown-menu">
					                        <li><a class="dropdown-item" href="#">All</a></li>
					                        <li><a class="dropdown-item" href="#">Popular</a></li>
					                        <li><a class="dropdown-item" href="#">Interesting</a></li>
					                        <li><a class="dropdown-item" href="#">Latest</a></li>
					                    </ul>
					                </div>
					            </div>
				        	</div> -->
                                <!-- <input type="text" id="email" name="email" class="form-control"
                                       data-parsley-trigger="change"
                                       data-parsley-validation-threshold="1"
                                       required="required" >
		                        <span class="help-block">
		                            This one is triggered even when 1 character has been input
		                        </span> -->
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="number">
                                	시작일
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="detailStart" name="detailStart" class="form-control"
                                       data-parsley-type="number"
                                       required="required" value="${n.START_DATE}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="number">
                                	마감일
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="detailEnd" name="detailEnd" class="form-control"
                                       data-parsley-type="number"
                                       required="required" value="${detail.end_date}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="range">
                                	배정된 멤버
                            </label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control"
                                       id="member" name="member"
                                       data-parsley-range="[10, 100]"
                                       data-parsley-trigger="change"
                                       data-parsley-validation-threshold="1"
                                       required="required">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="password">
                               		 팔로워
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="follower" name="follower" class="form-control mb-sm"
                                       data-parsley-trigger="change"
                                       data-parsley-minlength="6"
                                       required="required">
                            </div>
                        </div>
                </fieldset>
               <!--  <fieldset>
                    <legend>
                        More validation
                    </legend>
                        <div class="form-group row">
         
                                <input type="password" id="password-r" name="password-r" class="form-control"
                                       data-parsley-trigger="change"
                                       data-parsley-minlength="6"
                                       data-parsley-equalto="#password"
                                       required="required">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-3" for="website">
                                Website
                            </label>
                            <div class="col-sm-9">
                                <input type="text" id="website" name="website" class="form-control"
                                       data-parsley-trigger="change"
                                       data-parsley-type="url"
                                       required="required">
                            </div>
                        </div>
                </fieldset> -->
                <div class="form-actions">
                    <button type="button" class="btn btn-danger btn-rounded pull-xs-right" >Validate &amp; Submit</button>
                    <button type="button" class="btn btn-secondary btn-rounded" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </section>
</div>
</div>
</div>