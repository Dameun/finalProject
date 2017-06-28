<%--
	@Project : ZestWorld
	@File name : detailModal.jsp
	@Author : 최담은
	@Data : 2017.6.26
	@Desc : 전체개요 상세보기 -> 체크리스트 부분
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <link rel="stylesheet" type="text/css" href="./resource/dist/css/groupBoardView.css"> -->

<%-- <c:forEach items="${chklist}" var="n">
<div class="form-group row">
                            <div class="col-sm-8">
                                <input type="text" id="CheckContentsList" name="CheckContents" class="form-control mb-sm" style="width:635px"
                                       data-parsley-trigger="change"
                                       data-parsley-minlength="6"
                                       required="required" value="${n.contents }">
                                       
                            </div>
                            <span class="glyphicon glyphicon-trash"></span>
                     
                        </div>   
                        </c:forEach>  --%>
                        
                        
                       
                       
<%-- <div class="comments" >
			<ol class="group">
				<!--  for문 -->
				<c:forEach items="${chklist}" var="n">

					<li class="comment"><p class="text">${n.contents}</p> <time>asdsad</time>
						<a class="remove">삭제</a>
					</li>
				</c:forEach>
			</ol>
</div>  --%>


                <section class="widget" id="shares-widget"
                         data-widgster-load="demo/ajax/widgets/shares.php">
                    <header>
                        <h4>
                            <span class="label label-primary"></span> &nbsp;
                            <span class="fw-semi-bold">CheckList</span>
                        </h4>
                        <!-- <div class="widget-controls">
                            <a data-widgster="load" title="Reload" href="#"><strong class="text-gray-light">Reload</strong></a>
                            <a data-widgster="close" title="Close" href="#"><strong class="text-gray-light">Close</strong></a>
                        </div> -->
                    </header>
                    <c:forEach items="${chklist}" var="n">
                    <div class="widget-body no-padding">
                        <div class="list-group list-group-lg">
                            <a href="#" class="list-group-item">
                            <div class="row">
                            <div class="col-sm-1">
                               <span class="thumb-sm pull-xs-left mr">
                                  <%--  <input type="checkbox" id="${n.check_id}" onclick="updateChkFlag(${n.check_id});"  
	                                   <c:if test="${n.success_f eq 1}">
	                                   	checked= "checked"
	                                   </c:if>--%>
	                                    
	                                    
	                               <input type="checkbox" id="${n.check_id}"  
	                                   <c:if test="${n.success_f eq 1}">
		                                   checked= "checked"
		                                   onclick="updateChkFlag_zero(${n.check_id});"
	                                   </c:if>
	                                   <c:if test="${n.success_f eq 0}">
	                                   		onclick="updateChkFlag(${n.check_id});"
	                                   </c:if>
	                                   
	                                   
	                   <%--                 <c:if test="${n.success_f eq 1}">
			             checked= "checked"
			             onclick="changeSuccessF_zero(${n.task_id});"
			        </c:if> 
			        <c:if test="${n.success_f eq 0}">
			            onclick="changeSuccessF(${n.task_id});"
			        </c:if> --%>
                                   >
                                       
                                 </span> 
                            </div>
                               <!-- <i class="fa fa-circle pull-xs-right text-danger mt-sm"></i>  -->
                            <div class="col-sm-8">    
                                <h5 class="no-margin">${n.contents}</h5>
                                
                            </div>
                            <div class="col-sm-3">
	                            <div class="row">
	                            	<div class="col-sm-3"></div>
	                            	
	                            	<div class="col-sm-7">
	                                	<small class="text-muted">등록날짜...?</small>
	                            	</div>
	                            	
	                            	<div class="col-sm-2">
	                            		<span class="glyphicon glyphicon-trash" onclick="checkListDelete(${n.check_id});"></span>
	                                	<!-- <small class="text-muted">qwe</small> -->
	                            	</div>
	                            </div>
                            </div>
                            </div>
                            </a>
                            
                        </div>
                    </div>
                    </c:forEach>
                </section>